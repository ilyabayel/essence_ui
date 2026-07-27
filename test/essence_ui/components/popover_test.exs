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
    assert html =~ "data-radix-popover-trigger"
    assert html =~ "data-radix-popover-content"
    assert html =~ "data-radix-popover-close"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="pop-content-portal"]
    assert html =~ ~s[role="dialog"]
    assert html =~ ~s[data-side="top"]
    assert html =~ ~s[data-align="center"]

    assert html =~ "rt-PopoverRoot"
    assert html =~ "rt-PopoverTrigger"
    assert html =~ "rt-PopoverContent"
    assert html =~ "rt-PopperContent"
    assert html =~ "radix-themes"
    assert html =~ "rt-r-size-1"
    assert html =~ "rt-PopoverClose"
    assert html =~ "Body"
    refute html =~ ~s[phx-hook="Popover"]

    # Themes wraps <.button>; trigger/close must be non-button wrappers (Radix asChild).
    assert html =~ ~r/<div[^>]*data-radix-popover-trigger/
    assert html =~ ~r/<div[^>]*data-radix-popover-close/
    refute html =~ ~r/<button[^>]*data-radix-popover-trigger/
  end

  test "nested button stays inside trigger wrapper" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.popover_root id="nested">
            <Popover.popover_trigger>
              <button type="button" class="rt-Button">Comment</button>
            </Popover.popover_trigger>
            <Popover.popover_content id="nested-content">Body</Popover.popover_content>
          </Popover.popover_root>
          """
        end,
        %{}
      )

    assert html =~ ~r/data-radix-popover-trigger[^>]*>[\s\S]*<button[^>]*class="rt-Button"/
    assert html =~ "Comment"
  end
end
