defmodule EssenceUI.Components.ContextMenuTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.ContextMenu

  test "renders context menu via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <ContextMenu.context_menu_root id="cm1">
            <ContextMenu.context_menu_trigger>
              <div>Right-click</div>
            </ContextMenu.context_menu_trigger>
            <ContextMenu.context_menu_content id="cm1-content" size="2" variant="solid">
              <ContextMenu.context_menu_label>Actions</ContextMenu.context_menu_label>
              <ContextMenu.context_menu_group>
                <ContextMenu.context_menu_item shortcut="⌘ C">Copy</ContextMenu.context_menu_item>
              </ContextMenu.context_menu_group>
              <ContextMenu.context_menu_separator />
              <ContextMenu.context_menu_checkbox_item checked>Pinned</ContextMenu.context_menu_checkbox_item>
              <ContextMenu.context_menu_radio_group value="a">
                <ContextMenu.context_menu_radio_item value="a" checked>A</ContextMenu.context_menu_radio_item>
                <ContextMenu.context_menu_radio_item value="b">B</ContextMenu.context_menu_radio_item>
              </ContextMenu.context_menu_radio_group>
              <ContextMenu.context_menu_sub>
                <ContextMenu.context_menu_sub_trigger>More</ContextMenu.context_menu_sub_trigger>
                <ContextMenu.context_menu_sub_content>
                  <ContextMenu.context_menu_item>Nested</ContextMenu.context_menu_item>
                </ContextMenu.context_menu_sub_content>
              </ContextMenu.context_menu_sub>
            </ContextMenu.context_menu_content>
          </ContextMenu.context_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="ContextMenuRoot")
    assert html =~ "rt-ContextMenuRoot"
    assert html =~ "data-essence-context-menu-trigger"
    assert html =~ "rt-ContextMenuTrigger"
    assert html =~ "rt-PopperContent"
    assert html =~ "rt-BaseMenuContent"
    assert html =~ "rt-ContextMenuContent"
    assert html =~ "rt-BaseMenuViewport"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-variant-solid"
    assert html =~ "rt-ContextMenuItem"
    assert html =~ "rt-BaseMenuCheckboxItem"
    assert html =~ "rt-BaseMenuRadioItem"
    assert html =~ "rt-ContextMenuSubTrigger"
    assert html =~ "rt-ContextMenuSubContent"
  end
end
