defmodule EssenceUI.Components.PopoverTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Popover

  test "renders popover via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.popover_root id="pop1">
            <Popover.popover_trigger>Open</Popover.popover_trigger>
            <Popover.popover_content id="pop1-content" size="2">
              Content
              <Popover.popover_close>Close</Popover.popover_close>
            </Popover.popover_content>
          </Popover.popover_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="PopoverRoot")
    assert html =~ "rt-PopoverRoot"
    assert html =~ "data-essence-popover-trigger"
    assert html =~ "rt-PopoverContent"
    assert html =~ "rt-PopperContent"
    assert html =~ "rt-r-size-2"
    assert html =~ "data-essence-popover-close"
  end
end
