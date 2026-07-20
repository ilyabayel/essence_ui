defmodule EssenceUI.Primitives.ToolbarTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Toolbar

  test "renders radix-like toolbar parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toolbar.root id="toolbar" orientation="horizontal" loop>
            <Toolbar.button>Cut</Toolbar.button>
            <Toolbar.link href="#docs">Docs</Toolbar.link>
            <Toolbar.separator />
            <Toolbar.toggle_group type="single" value="left">
              <Toolbar.toggle_item value="left">L</Toolbar.toggle_item>
              <Toolbar.toggle_item value="right">R</Toolbar.toggle_item>
            </Toolbar.toggle_group>
          </Toolbar.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="ToolbarRoot"]
    assert html =~ ~s[role="toolbar"]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ ~s[data-loop="true"]
    assert html =~ "data-essence-toolbar-button"
    assert html =~ ~s[type="button"]
    assert html =~ "data-essence-toolbar-link"
    assert html =~ ~s[href="#docs"]
    assert html =~ "data-essence-toolbar-separator"
    assert html =~ "data-essence-toolbar-toggle-group"
    assert html =~ ~s[data-type="single"]
    assert html =~ ~s[data-value="left"]
    assert html =~ "data-essence-toolbar-toggle-item"
  end

  test "toggle group supports multiple values" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toolbar.root id="tb">
            <Toolbar.toggle_group type="multiple" value={["bold", "italic"]}>
              <Toolbar.toggle_item value="bold">B</Toolbar.toggle_item>
            </Toolbar.toggle_group>
          </Toolbar.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-value="bold,italic"]
  end
end
