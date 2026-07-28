defmodule EssenceUI.Components.ScrollAreaTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.ScrollArea

  test "renders scroll area wrapping primitive hook" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa1" size="2">
            <p>content</p>
          </ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="sa1"]
    assert html =~ ~s[phx-hook="ScrollAreaRoot"]
    assert html =~ ~s[data-radix-scroll-area-root]
    assert html =~ "rt-ScrollAreaRoot"
    assert html =~ "rt-ScrollAreaViewport"
    assert html =~ ~s[data-radix-scroll-area-viewport]
    assert html =~ ~s[data-radix-scroll-area-content]
    assert html =~ "rt-r-size-2"
    assert html =~ "content"
    assert html =~ ~s[data-orientation="vertical"]
    assert html =~ ~s[data-orientation="horizontal"]
  end

  test "scrollbars prop renders only requested axes" do
    vertical =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa-v" scrollbars="vertical">
            <p>v</p>
          </ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    refute vertical =~ ~s[data-orientation="horizontal"]
    assert vertical =~ ~s[data-orientation="vertical"]
    refute vertical =~ "rt-ScrollAreaCorner"

    horizontal =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa-h" scrollbars="horizontal">
            <p>h</p>
          </ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    assert horizontal =~ ~s[data-orientation="horizontal"]
    refute horizontal =~ ~s[data-orientation="vertical"]
  end

  test "scroll_hide_delay defaults like Radix Themes" do
    hover =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa-hover" type="hover"><p>x</p></ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    assert hover =~ ~s[data-scroll-hide-delay="0"]

    scroll =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa-scroll" type="scroll"><p>x</p></ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    assert scroll =~ ~s[data-scroll-hide-delay="600"]
  end
end
