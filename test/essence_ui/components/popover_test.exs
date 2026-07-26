defmodule EssenceUI.Components.PopoverTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Popover

  test "renders themes popover over popover primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.popover_root id="pop">
            <Popover.popover_trigger>Open</Popover.popover_trigger>
            <Popover.popover_content id="pop-content" size="1" side="top" align="center">
              <p>Body</p>
              <Popover.popover_close>Close</Popover.popover_close>
            </Popover.popover_content>
          </Popover.popover_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="PopoverRoot"]
    assert html =~ "data-essence-popover-trigger"
    assert html =~ "data-essence-popover-content"
    assert html =~ "data-essence-popover-close"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="pop-content-portal"]
    assert html =~ ~s[role="dialog"]
    assert html =~ ~s[data-side="top"]
    assert html =~ ~s[data-align="center"]

    assert html =~ "est-PopoverRoot"
    assert html =~ "est-PopoverTrigger"
    assert html =~ "est-PopoverContent"
    assert html =~ "est-PopperContent"
    assert html =~ "essence-ui"
    assert html =~ "est-r-size-1"
    assert html =~ "est-PopoverClose"
    assert html =~ "Body"
    refute html =~ ~s[phx-hook="Popover"]

    # Themes wraps <.button>; trigger/close must be non-button wrappers (Radix asChild).
    assert html =~ ~r/<div[^>]*data-essence-popover-trigger/
    assert html =~ ~r/<div[^>]*data-essence-popover-close/
    refute html =~ ~r/<button[^>]*data-essence-popover-trigger/
  end

  test "nested button stays inside trigger wrapper" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.popover_root id="nested">
            <Popover.popover_trigger>
              <button type="button" class="est-Button">Comment</button>
            </Popover.popover_trigger>
            <Popover.popover_content id="nested-content">Body</Popover.popover_content>
          </Popover.popover_root>
          """
        end,
        %{}
      )

    assert html =~ ~r/data-essence-popover-trigger[^>]*>[\s\S]*<button[^>]*class="est-Button"/
    assert html =~ "Comment"
  end
end
