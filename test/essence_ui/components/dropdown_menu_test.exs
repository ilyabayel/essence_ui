defmodule EssenceUI.Components.DropdownMenuTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.DropdownMenu

  test "themes trigger wraps nested button without invalid button nesting" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DropdownMenu.dropdown_menu_root id="dm-btn">
            <DropdownMenu.dropdown_menu_trigger>
              <button type="button" class="rt-Button">Options</button>
            </DropdownMenu.dropdown_menu_trigger>
            <DropdownMenu.dropdown_menu_content id="dm-btn-content">
              <DropdownMenu.dropdown_menu_item>Edit</DropdownMenu.dropdown_menu_item>
            </DropdownMenu.dropdown_menu_content>
          </DropdownMenu.dropdown_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-radix-dropdown-menu-trigger]
    assert html =~ ~s[role="button"]
    refute html =~ ~r/<button[^>]*data-radix-dropdown-menu-trigger/
    assert html =~ ~s[class="rt-Button"]
  end

  test "renders themes dropdown menu over dropdown menu primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DropdownMenu.dropdown_menu_root id="dm">
            <DropdownMenu.dropdown_menu_trigger>
              Options
              <DropdownMenu.dropdown_menu_trigger_icon />
            </DropdownMenu.dropdown_menu_trigger>
            <DropdownMenu.dropdown_menu_content
              id="dm-content"
              size="1"
              variant="soft"
              color="indigo"
              high_contrast
            >
              <DropdownMenu.dropdown_menu_label>Actions</DropdownMenu.dropdown_menu_label>
              <DropdownMenu.dropdown_menu_item shortcut="⌘ E" color="red">
                Edit
              </DropdownMenu.dropdown_menu_item>
              <DropdownMenu.dropdown_menu_separator />
              <DropdownMenu.dropdown_menu_checkbox_item checked shortcut="⌘ B">
                Bookmarks
              </DropdownMenu.dropdown_menu_checkbox_item>
              <DropdownMenu.dropdown_menu_radio_item value="a" checked>A</DropdownMenu.dropdown_menu_radio_item>
              <DropdownMenu.dropdown_menu_sub>
                <DropdownMenu.dropdown_menu_sub_trigger>More</DropdownMenu.dropdown_menu_sub_trigger>
                <DropdownMenu.dropdown_menu_sub_content>Sub</DropdownMenu.dropdown_menu_sub_content>
              </DropdownMenu.dropdown_menu_sub>
            </DropdownMenu.dropdown_menu_content>
          </DropdownMenu.dropdown_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="DropdownMenuRoot"]
    assert html =~ "data-radix-dropdown-menu-root"
    assert html =~ "data-radix-dropdown-menu-trigger"
    assert html =~ "data-radix-dropdown-menu-content"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="dm-content-portal"]

    assert html =~ "rt-DropdownMenuRoot"
    assert html =~ "rt-DropdownMenuTrigger"
    assert html =~ "rt-DropdownMenuTriggerIcon"
    assert html =~ "rt-DropdownMenuContent"
    assert html =~ "rt-BaseMenuContent"
    assert html =~ "rt-PopperContent"
    assert html =~ "rt-r-size-1"
    assert html =~ "rt-variant-soft"
    assert html =~ "rt-high-contrast"
    assert html =~ ~s[data-accent-color="indigo"]

    assert html =~ "rt-DropdownMenuItem"
    assert html =~ "rt-BaseMenuShortcut"
    assert html =~ "⌘ E"
    assert html =~ ~s[data-accent-color="red"]
    assert html =~ "rt-DropdownMenuLabel"
    assert html =~ "rt-DropdownMenuSeparator"
    assert html =~ "rt-DropdownMenuCheckboxItem"
    assert html =~ "data-radix-menu-checkbox-item"
    assert html =~ "data-radix-menu-item-indicator"
    assert html =~ "data-radix-menu-radio-item"
    assert html =~ "rt-DropdownMenuRadioItem"
    assert html =~ "rt-DropdownMenuSub"
    assert html =~ "rt-DropdownMenuSubTrigger"
    assert html =~ "rt-DropdownMenuSubContent"
    assert html =~ "rt-BaseMenuViewport"
    refute html =~ ~s[phx-hook="DropdownMenu"]
  end
end
