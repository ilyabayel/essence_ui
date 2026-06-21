defmodule EssenceUI.Primitives.UtilityTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.AccessibleIcon
  alias EssenceUI.Primitives.DirectionProvider
  alias EssenceUI.Primitives.Progress
  alias EssenceUI.Primitives.Slot
  alias EssenceUI.Primitives.VisuallyHidden

  test "accessible icon renders hidden label" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AccessibleIcon.accessible_icon label="Close">x</AccessibleIcon.accessible_icon>
          """
        end,
        %{}
      )

    assert html =~ ~s[aria-hidden="true"]
    assert html =~ ~s[focusable="false"]
    assert html =~ "Close"
  end

  test "direction provider renders dir wrapper" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DirectionProvider.direction_provider dir="rtl">Content</DirectionProvider.direction_provider>
          """
        end,
        %{}
      )

    assert html =~ ~s[dir="rtl"]
    assert html =~ "Content"
  end

  test "progress renders radix-like states" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Progress.root value={50}>
            <Progress.indicator value={50} />
          </Progress.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[role="progressbar"]
    assert html =~ ~s[aria-valuenow="50"]
    assert html =~ ~s[data-state="loading"]
    assert html =~ ~s[data-value="50"]

    html = render_component(&Progress.root/1, %{inner_block: []})
    assert html =~ ~s[data-state="indeterminate"]
    refute html =~ "aria-valuenow"

    html = render_component(&Progress.root/1, %{value: 2.5, max: 10, inner_block: []})
    assert html =~ ~s[aria-valuenow="2.5"]
    assert html =~ ~s[aria-valuetext="25%"]
  end

  test "visually hidden renders hidden span" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <VisuallyHidden.visually_hidden>Hidden</VisuallyHidden.visually_hidden>
          """
        end,
        %{}
      )

    assert html =~ "position: absolute"
    assert html =~ "Hidden"
  end

  test "slot renders slotted content" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Slot.slot class="target">Content</Slot.slot>
          """
        end,
        %{}
      )

    assert html =~ ~s[class="target"]
    assert html =~ "Content"
  end
end
