defmodule EssenceUI.Primitives.MenubarTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Menubar

  test "renders radix-like menubar parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Menubar.root id="mb" orientation="horizontal">
            <Menubar.menu value="file">
              <Menubar.trigger id="file-trigger" content_id="file-content">File</Menubar.trigger>
              <Menubar.content id="file-content">
                <Menubar.label>File</Menubar.label>
                <Menubar.group>
                  <Menubar.item text_value="new">New</Menubar.item>
                  <Menubar.item disabled>Disabled</Menubar.item>
                </Menubar.group>
                <Menubar.separator />
                <Menubar.checkbox_item checked>Autosave</Menubar.checkbox_item>
                <Menubar.radio_group value="a">
                  <Menubar.radio_item value="a" checked>A</Menubar.radio_item>
                  <Menubar.radio_item value="b">B</Menubar.radio_item>
                </Menubar.radio_group>
                <Menubar.item_indicator>✓</Menubar.item_indicator>
                <Menubar.sub>
                  <Menubar.sub_trigger>Share</Menubar.sub_trigger>
                  <Menubar.sub_content>Email</Menubar.sub_content>
                </Menubar.sub>
              </Menubar.content>
            </Menubar.menu>
            <Menubar.menu value="edit">
              <Menubar.trigger content_id="edit-content">Edit</Menubar.trigger>
              <Menubar.content id="edit-content">
                <Menubar.item>Undo</Menubar.item>
              </Menubar.content>
            </Menubar.menu>
          </Menubar.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="MenubarRoot"]
    assert html =~ ~s[role="menubar"]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ "data-essence-menubar-menu"
    assert html =~ "data-essence-menubar-trigger"
    assert html =~ "data-essence-menubar-content"
    assert html =~ "data-essence-menubar-label"
    assert html =~ "data-essence-menubar-item"
    assert html =~ "data-essence-menubar-checkbox-item"
    assert html =~ "data-essence-menubar-radio-group"
    assert html =~ "data-essence-menubar-radio-item"
    assert html =~ "data-essence-menubar-item-indicator"
    assert html =~ "data-essence-menubar-separator"
    assert html =~ "data-essence-menubar-sub"
    assert html =~ "data-essence-menubar-sub-trigger"
    assert html =~ "data-essence-menubar-sub-content"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Menubar.root id="ported">
            <Menubar.menu>
              <Menubar.trigger>File</Menubar.trigger>
              <Menubar.portal id="mb-portal" target="body">
                <Menubar.content id="ported-content">Ported</Menubar.content>
              </Menubar.portal>
            </Menubar.menu>
          </Menubar.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="mb-portal"]
    assert html =~ "data-essence-menubar-content"
    assert html =~ "Ported"
  end
end
