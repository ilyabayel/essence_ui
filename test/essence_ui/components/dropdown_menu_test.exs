defmodule EssenceUI.Components.DropdownMenuTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.DropdownMenu

  test "renders dropdown menu via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DropdownMenu.dropdown_menu_root id="dm1">
            <DropdownMenu.dropdown_menu_trigger>
              Open
              <DropdownMenu.dropdown_menu_trigger_icon />
            </DropdownMenu.dropdown_menu_trigger>
            <DropdownMenu.dropdown_menu_content id="dm1-content" size="2" variant="solid">
              <DropdownMenu.dropdown_menu_label>Actions</DropdownMenu.dropdown_menu_label>
              <DropdownMenu.dropdown_menu_group>
                <DropdownMenu.dropdown_menu_item shortcut="⌘ E">Edit</DropdownMenu.dropdown_menu_item>
              </DropdownMenu.dropdown_menu_group>
              <DropdownMenu.dropdown_menu_separator />
              <DropdownMenu.dropdown_menu_checkbox_item checked>Show</DropdownMenu.dropdown_menu_checkbox_item>
              <DropdownMenu.dropdown_menu_radio_group value="a">
                <DropdownMenu.dropdown_menu_radio_item value="a" checked>A</DropdownMenu.dropdown_menu_radio_item>
                <DropdownMenu.dropdown_menu_radio_item value="b">B</DropdownMenu.dropdown_menu_radio_item>
              </DropdownMenu.dropdown_menu_radio_group>
              <DropdownMenu.dropdown_menu_sub>
                <DropdownMenu.dropdown_menu_sub_trigger>More</DropdownMenu.dropdown_menu_sub_trigger>
                <DropdownMenu.dropdown_menu_sub_content>
                  <DropdownMenu.dropdown_menu_item>Nested</DropdownMenu.dropdown_menu_item>
                </DropdownMenu.dropdown_menu_sub_content>
              </DropdownMenu.dropdown_menu_sub>
            </DropdownMenu.dropdown_menu_content>
          </DropdownMenu.dropdown_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="DropdownMenuRoot")
    assert html =~ "rt-DropdownMenuRoot"
    assert html =~ "data-essence-dropdown-menu-trigger"
    assert html =~ "rt-DropdownMenuTrigger"
    assert html =~ "rt-DropdownMenuTriggerIcon"
    assert html =~ "rt-PopperContent"
    assert html =~ "rt-BaseMenuContent"
    assert html =~ "rt-DropdownMenuContent"
    assert html =~ "rt-BaseMenuViewport"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-variant-solid"
    assert html =~ "rt-DropdownMenuItem"
    assert html =~ "rt-BaseMenuCheckboxItem"
    assert html =~ "rt-BaseMenuRadioItem"
    assert html =~ "rt-DropdownMenuSubTrigger"
    assert html =~ "rt-DropdownMenuSubContent"
  end
end
