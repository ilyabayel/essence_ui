defmodule EssenceUI.Components.ScrollAreaTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.ScrollArea

  test "renders scroll area via primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ScrollArea.scroll_area id="sa1" size="2" type="hover">
            Content
          </ScrollArea.scroll_area>
          """
        end,
        %{}
      )

    assert html =~ ~s(id="sa1")
    assert html =~ ~s(phx-hook="ScrollAreaRoot")
    assert html =~ "rt-ScrollAreaRoot"
    assert html =~ "rt-ScrollAreaViewport"
    assert html =~ "rt-ScrollAreaViewportFocusRing"
    assert html =~ "rt-ScrollAreaScrollbar"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-ScrollAreaThumb"
    assert html =~ "rt-ScrollAreaCorner"
    assert html =~ "Content"
  end
end
