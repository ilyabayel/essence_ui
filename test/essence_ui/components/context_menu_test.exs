defmodule EssenceUI.Components.ContextMenuTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.ContextMenu

  test "renders themes context menu over context menu primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ContextMenu.context_menu_root id="cm">
            <ContextMenu.context_menu_trigger>Right-click</ContextMenu.context_menu_trigger>
            <ContextMenu.context_menu_content
              id="cm-content"
              size="1"
              variant="soft"
              color="indigo"
              high_contrast
            >
              <ContextMenu.context_menu_label>Actions</ContextMenu.context_menu_label>
              <ContextMenu.context_menu_group>
                <ContextMenu.context_menu_item shortcut="⌘ E" color="red">
                  Edit
                </ContextMenu.context_menu_item>
              </ContextMenu.context_menu_group>
              <ContextMenu.context_menu_separator />
              <ContextMenu.context_menu_checkbox_item checked shortcut="⌘ B">
                Bookmarks
              </ContextMenu.context_menu_checkbox_item>
              <ContextMenu.context_menu_radio_group value="a">
                <ContextMenu.context_menu_radio_item value="a" checked>
                  A
                </ContextMenu.context_menu_radio_item>
                <ContextMenu.context_menu_radio_item value="b">B</ContextMenu.context_menu_radio_item>
              </ContextMenu.context_menu_radio_group>
              <ContextMenu.context_menu_sub>
                <ContextMenu.context_menu_sub_trigger>More</ContextMenu.context_menu_sub_trigger>
                <ContextMenu.context_menu_sub_content>Sub</ContextMenu.context_menu_sub_content>
              </ContextMenu.context_menu_sub>
            </ContextMenu.context_menu_content>
          </ContextMenu.context_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ContextMenuRoot"]
    assert html =~ "data-essence-context-menu-root"
    assert html =~ "data-essence-context-menu-trigger"
    assert html =~ "data-essence-context-menu-content"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="cm-content-portal"]

    assert html =~ "rt-ContextMenuRoot"
    assert html =~ "rt-ContextMenuTrigger"
    assert html =~ "rt-ContextMenuContent"
    assert html =~ "rt-BaseMenuContent"
    assert html =~ "rt-PopperContent"
    assert html =~ "rt-r-size-1"
    assert html =~ "rt-variant-soft"
    assert html =~ "rt-high-contrast"
    assert html =~ ~s[data-accent-color="indigo"]

    assert html =~ "rt-ContextMenuItem"
    assert html =~ "rt-BaseMenuShortcut"
    assert html =~ "⌘ E"
    assert html =~ ~s[data-accent-color="red"]

    assert html =~ "rt-ContextMenuLabel"
    assert html =~ "rt-ContextMenuGroup"
    assert html =~ "rt-ContextMenuSeparator"
    assert html =~ "rt-ContextMenuCheckboxItem"
    assert html =~ "rt-BaseMenuItemIndicator"
    assert html =~ "data-essence-context-menu-checkbox-item"
    assert html =~ "data-essence-context-menu-item-indicator"
    assert html =~ "data-essence-context-menu-radio-group"
    assert html =~ "data-essence-context-menu-radio-item"
    assert html =~ "rt-ContextMenuRadioItem"
    assert html =~ "rt-ContextMenuSub"
    assert html =~ "rt-ContextMenuSubTrigger"
    assert html =~ "rt-ContextMenuSubContent"
    assert html =~ "rt-BaseMenuViewport"
  end

  test "content portals and keeps themes viewport wrapper" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ContextMenu.context_menu_root id="ported">
            <ContextMenu.context_menu_trigger>Area</ContextMenu.context_menu_trigger>
            <ContextMenu.context_menu_content id="ported-content" container="body">
              <ContextMenu.context_menu_item>One</ContextMenu.context_menu_item>
            </ContextMenu.context_menu_content>
          </ContextMenu.context_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="ported-content"]
    assert html =~ "rt-BaseMenuViewport"
    assert html =~ "One"
    refute html =~ ~s[phx-hook="ContextMenu"]
  end
end
