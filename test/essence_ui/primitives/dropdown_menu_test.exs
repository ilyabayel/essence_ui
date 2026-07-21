defmodule EssenceUI.Primitives.DropdownMenuTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.DropdownMenu

  test "renders radix-like dropdown menu parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DropdownMenu.root id="dm" default_open on_open_change="changed">
            <DropdownMenu.trigger id="dm-trigger" content_id="dm-content">Open</DropdownMenu.trigger>
            <DropdownMenu.content id="dm-content" side="bottom" align="start">
              <DropdownMenu.label>Actions</DropdownMenu.label>
              <DropdownMenu.group>
                <DropdownMenu.item text_value="new">New</DropdownMenu.item>
                <DropdownMenu.item disabled>Disabled</DropdownMenu.item>
              </DropdownMenu.group>
              <DropdownMenu.separator />
              <DropdownMenu.checkbox_item checked>Show</DropdownMenu.checkbox_item>
              <DropdownMenu.radio_group value="a">
                <DropdownMenu.radio_item value="a" checked>A</DropdownMenu.radio_item>
                <DropdownMenu.radio_item value="b">B</DropdownMenu.radio_item>
              </DropdownMenu.radio_group>
              <DropdownMenu.item_indicator>✓</DropdownMenu.item_indicator>
              <DropdownMenu.sub>
                <DropdownMenu.sub_trigger>More</DropdownMenu.sub_trigger>
                <DropdownMenu.sub_content>Sub</DropdownMenu.sub_content>
              </DropdownMenu.sub>
              <DropdownMenu.arrow />
            </DropdownMenu.content>
          </DropdownMenu.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="DropdownMenuRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ "data-essence-dropdown-menu-trigger"
    assert html =~ ~s[aria-controls="dm-content"]
    assert html =~ "data-essence-dropdown-menu-content"
    assert html =~ "data-essence-dropdown-menu-label"
    assert html =~ "data-essence-dropdown-menu-item"
    assert html =~ ~s[data-text-value="new"]
    assert html =~ "data-disabled"
    assert html =~ "data-essence-dropdown-menu-checkbox-item"
    assert html =~ ~s[data-state="checked"]
    assert html =~ "data-essence-dropdown-menu-radio-group"
    assert html =~ "data-essence-dropdown-menu-radio-item"
    assert html =~ "data-essence-dropdown-menu-item-indicator"
    assert html =~ "data-essence-dropdown-menu-separator"
    assert html =~ "data-essence-dropdown-menu-sub"
    assert html =~ "data-essence-dropdown-menu-sub-trigger"
    assert html =~ "data-essence-dropdown-menu-sub-content"
    assert html =~ "data-essence-dropdown-menu-arrow"
    assert html =~ "display: none"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <DropdownMenu.root id="ported">
            <DropdownMenu.trigger>Open</DropdownMenu.trigger>
            <DropdownMenu.portal id="dm-portal" target="body">
              <DropdownMenu.content id="ported-content">Ported</DropdownMenu.content>
            </DropdownMenu.portal>
          </DropdownMenu.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="dm-portal"]
    assert html =~ "data-essence-dropdown-menu-content"
    assert html =~ "Ported"
  end
end
