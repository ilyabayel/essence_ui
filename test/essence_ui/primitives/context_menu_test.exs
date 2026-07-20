defmodule EssenceUI.Primitives.ContextMenuTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.ContextMenu

  test "renders radix-like context menu parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ContextMenu.root id="cm" on_open_change="changed">
            <ContextMenu.trigger id="cm-trigger" content_id="cm-content">
              Right click
            </ContextMenu.trigger>
            <ContextMenu.content id="cm-content">
              <ContextMenu.label>Actions</ContextMenu.label>
              <ContextMenu.group>
                <ContextMenu.item text_value="copy">Copy</ContextMenu.item>
                <ContextMenu.item disabled>Disabled</ContextMenu.item>
              </ContextMenu.group>
              <ContextMenu.separator />
              <ContextMenu.checkbox_item checked>Pinned</ContextMenu.checkbox_item>
              <ContextMenu.radio_group value="a">
                <ContextMenu.radio_item value="a" checked>A</ContextMenu.radio_item>
                <ContextMenu.radio_item value="b">B</ContextMenu.radio_item>
              </ContextMenu.radio_group>
              <ContextMenu.item_indicator>✓</ContextMenu.item_indicator>
              <ContextMenu.sub>
                <ContextMenu.sub_trigger>More</ContextMenu.sub_trigger>
                <ContextMenu.sub_content>Sub</ContextMenu.sub_content>
              </ContextMenu.sub>
              <ContextMenu.arrow />
            </ContextMenu.content>
          </ContextMenu.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ContextMenuRoot"]
    assert html =~ ~s[data-state="closed"]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ "data-essence-context-menu-trigger"
    assert html =~ ~s[aria-controls="cm-content"]
    assert html =~ "data-essence-context-menu-content"
    assert html =~ "data-essence-context-menu-label"
    assert html =~ "data-essence-context-menu-item"
    assert html =~ ~s[data-text-value="copy"]
    assert html =~ "data-essence-context-menu-checkbox-item"
    assert html =~ "data-essence-context-menu-radio-group"
    assert html =~ "data-essence-context-menu-radio-item"
    assert html =~ "data-essence-context-menu-item-indicator"
    assert html =~ "data-essence-context-menu-separator"
    assert html =~ "data-essence-context-menu-sub"
    assert html =~ "data-essence-context-menu-sub-trigger"
    assert html =~ "data-essence-context-menu-sub-content"
    assert html =~ "data-essence-context-menu-arrow"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ContextMenu.root id="ported">
            <ContextMenu.trigger>Area</ContextMenu.trigger>
            <ContextMenu.portal id="cm-portal" target="body">
              <ContextMenu.content id="ported-content">Ported</ContextMenu.content>
            </ContextMenu.portal>
          </ContextMenu.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="cm-portal"]
    assert html =~ "data-essence-context-menu-content"
    assert html =~ "Ported"
  end
end
