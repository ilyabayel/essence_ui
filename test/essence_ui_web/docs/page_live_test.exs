defmodule EssenceUIWeb.Docs.PageLiveTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "renders getting started at /", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/")

    assert html =~ "Getting started"
    assert html =~ "Essence UI"
    assert html =~ "Hello from Essence UI"
    assert html =~ "docs-topbar"
    assert html =~ "Menu"
    assert html =~ "Skip to content"
    assert html =~ "docs-main-content"
    assert html =~ ~s(aria-current="page")
    refute html =~ "## 4. Start building"
    assert html =~ "Start building"
    assert html =~ ~s(href="/components/button")

    html = render_click(element(view, "button[phx-click=toggle_nav]"))
    assert html =~ "is-open"
    assert html =~ "Close"

    html = render_keydown(view, "keydown", %{"key" => "Escape"})
    refute html =~ "is-open"
  end

  test "renders button docs with live demo and props", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/components/button")

    assert html =~ "Trigger an action or event"
    assert html =~ "docs-demo"
    assert html =~ "API Reference"
    assert html =~ "variant"
  end

  test "renders primitive dialog docs with anatomy", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/primitives/dialog")

    assert html =~ "Anatomy"
    assert html =~ "Dialog.trigger"
    assert html =~ "docs-demo"
  end

  test "unknown path shows not found", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/does/not/exist")

    assert html =~ "Page not found"
  end
end
