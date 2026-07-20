defmodule EssenceUI.Primitives.ScrollAreaTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.ScrollArea

  test "renders radix-like root, viewport, scrollbar, thumb, and corner" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.root id="scroll" type="hover" scroll_hide_delay={600}>
            <ScrollArea.viewport>Content</ScrollArea.viewport>
            <ScrollArea.scrollbar orientation="vertical">
              <ScrollArea.thumb />
            </ScrollArea.scrollbar>
            <ScrollArea.scrollbar orientation="horizontal">
              <ScrollArea.thumb />
            </ScrollArea.scrollbar>
            <ScrollArea.corner />
          </ScrollArea.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ScrollAreaRoot"]
    assert html =~ ~s[data-type="hover"]
    assert html =~ ~s[data-scroll-hide-delay="600"]
    assert html =~ "data-essence-scroll-area-viewport"
    assert html =~ "data-essence-scroll-area-scrollbar"
    assert html =~ ~s[data-orientation="vertical"]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ "data-essence-scroll-area-thumb"
    assert html =~ "data-essence-scroll-area-corner"
  end
end
