defmodule EssenceUIWeb.Docs.PageLiveTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "themes home renders at /", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")

    assert html =~ "Start building your app now"
    assert html =~ "Get started"
    assert html =~ "Playground"
    assert html =~ "site-header"
  end

  test "renders getting started docs", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/themes/docs/overview/getting-started")

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

    html = render_click(element(view, "button[phx-click=toggle_nav]"))
    assert html =~ "is-open"
    assert html =~ "Close"

    html = render_keydown(view, "keydown", %{"key" => "Escape"})
    refute html =~ "is-open"
  end

  test "renders button docs with live demo and props", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/themes/docs/components/button")

    assert html =~ "Trigger an action or event"
    assert html =~ "docs-demo"
    assert html =~ "API Reference"
    assert html =~ "variant"
  end

  test "renders primitive dialog docs with anatomy", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/primitives/docs/components/dialog")

    assert html =~ "Anatomy"
    assert html =~ "Dialog.trigger"
    assert html =~ "docs-demo"
    assert html =~ "Custom APIs"
    assert html =~ "docs-highlights"
  end

  test "primitives docs index lands on introduction", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/primitives/docs")

    assert html =~ "Introduction"
    assert html =~ "Essence UI Primitives"
  end

  test "primitives getting started guide renders", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/primitives/docs/overview/getting-started")

    assert html =~ "Popover"
    assert html =~ "docs-demo"
  end

  test "playground renders theme panel", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/themes/playground")

    assert html =~ "Theme"
    assert html =~ "Copy Theme"
    assert html =~ "Accent color"
  end

  test "colors home renders scales", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/colors")

    assert html =~ "color system"
    assert html =~ "indigo"
  end

  test "primitives home renders", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/primitives")

    assert html =~ "Core building blocks"
    assert html =~ "Dialog"
  end

  test "unknown path shows not found", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/themes/docs/does/not/exist")

    assert html =~ "Page not found"
  end
end
