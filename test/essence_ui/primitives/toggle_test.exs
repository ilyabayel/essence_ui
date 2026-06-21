defmodule EssenceUI.Primitives.ToggleTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Toggle
  alias EssenceUI.Primitives.ToggleGroup

  test "toggle renders radix-like button state" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toggle.root id="bold" pressed>B</Toggle.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ToggleRoot"]
    assert html =~ ~s[aria-pressed="true"]
    assert html =~ ~s[data-state="on"]
  end

  test "toggle group renders single selection root and item" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ToggleGroup.root id="alignment" type="single" value="left">
            <ToggleGroup.item value="left">Left</ToggleGroup.item>
          </ToggleGroup.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ToggleGroupRoot"]
    assert html =~ ~s[role="radiogroup"]
    assert html =~ ~s[data-type="single"]
    assert html =~ ~s[data-value="left"]
    assert html =~ "data-essence-toggle-group-item"
  end

  test "toggle group renders multiple selection value list" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ToggleGroup.root id="formatting" type="multiple" value={["bold", "italic"]}>
            <ToggleGroup.item value="bold">Bold</ToggleGroup.item>
          </ToggleGroup.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[role="toolbar"]
    assert html =~ ~s[data-value="bold,italic"]
  end
end
