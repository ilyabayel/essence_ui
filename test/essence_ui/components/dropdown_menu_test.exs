defmodule EssenceUI.Components.DropdownMenuTest do
  use EssenceUIWeb.ConnCase, async: true

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
              <button type="button" class="est-Button">Options</button>
            </DropdownMenu.dropdown_menu_trigger>
            <DropdownMenu.dropdown_menu_content id="dm-btn-content">
              <DropdownMenu.dropdown_menu_item>Edit</DropdownMenu.dropdown_menu_item>
            </DropdownMenu.dropdown_menu_content>
          </DropdownMenu.dropdown_menu_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-essence-dropdown-menu-trigger]
    assert html =~ ~s[role="button"]
    refute html =~ ~r/<button[^>]*data-essence-dropdown-menu-trigger/
    assert html =~ ~s[class="est-Button"]
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
    assert html =~ "data-essence-dropdown-menu-root"
    assert html =~ "data-essence-dropdown-menu-trigger"
    assert html =~ "data-essence-dropdown-menu-content"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="dm-content-portal"]

    assert html =~ "est-DropdownMenuRoot"
    assert html =~ "est-DropdownMenuTrigger"
    assert html =~ "est-DropdownMenuTriggerIcon"
    assert html =~ "est-DropdownMenuContent"
    assert html =~ "est-BaseMenuContent"
    assert html =~ "est-PopperContent"
    assert html =~ "est-r-size-1"
    assert html =~ "est-variant-soft"
    assert html =~ "est-high-contrast"
    assert html =~ ~s[data-accent-color="indigo"]

    assert html =~ "est-DropdownMenuItem"
    assert html =~ "est-BaseMenuShortcut"
    assert html =~ "⌘ E"
    assert html =~ ~s[data-accent-color="red"]
    assert html =~ "est-DropdownMenuLabel"
    assert html =~ "est-DropdownMenuSeparator"
    assert html =~ "est-DropdownMenuCheckboxItem"
    assert html =~ "data-essence-dropdown-menu-checkbox-item"
    assert html =~ "data-essence-dropdown-menu-item-indicator"
    assert html =~ "data-essence-dropdown-menu-radio-item"
    assert html =~ "est-DropdownMenuRadioItem"
    assert html =~ "est-DropdownMenuSub"
    assert html =~ "est-DropdownMenuSubTrigger"
    assert html =~ "est-DropdownMenuSubContent"
    assert html =~ "est-BaseMenuViewport"
    refute html =~ ~s[phx-hook="DropdownMenu"]
  end
end
