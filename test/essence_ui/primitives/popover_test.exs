defmodule EssenceUI.Primitives.PopoverTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Popover

  test "renders radix-like popover parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.root id="share" default_open on_open_change="changed" modal>
            <Popover.trigger id="share-trigger" content_id="share-content">Open</Popover.trigger>
            <Popover.anchor>Anchor</Popover.anchor>
            <Popover.content id="share-content" side="top" align="start">
              Body
              <Popover.close>Close</Popover.close>
              <Popover.arrow />
            </Popover.content>
          </Popover.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="PopoverRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-modal]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ "data-essence-popover-trigger"
    assert html =~ ~s[aria-controls="share-content"]
    assert html =~ "data-essence-popover-anchor"
    assert html =~ "data-essence-popover-content"
    assert html =~ ~s[data-side="top"]
    assert html =~ ~s[data-align="start"]
    assert html =~ "data-essence-popover-close"
    assert html =~ "data-essence-popover-arrow"
    assert html =~ "display: none"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Popover.root id="ported">
            <Popover.trigger>Open</Popover.trigger>
            <Popover.portal id="ported-portal" target="body">
              <Popover.content id="ported-content">Ported</Popover.content>
            </Popover.portal>
          </Popover.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="ported-portal"]
    assert html =~ "data-essence-popover-content"
    assert html =~ "Ported"
  end
end
