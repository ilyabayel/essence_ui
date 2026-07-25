defmodule EssenceUIWeb.Docs.PageLiveTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "renders getting started at /docs", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/docs")

    assert html =~ "Getting started"
    assert html =~ "Essence UI"
    assert html =~ "Hello from Essence UI"
  end

  test "renders button docs with live demo and props", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/docs/components/button")

    assert html =~ "Trigger an action or event"
    assert html =~ "docs-demo"
    assert html =~ "API Reference"
    assert html =~ "variant"
  end

  test "renders primitive dialog docs with anatomy", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/docs/primitives/dialog")

    assert html =~ "Anatomy"
    assert html =~ "Dialog.trigger"
    assert html =~ "docs-demo"
  end

  test "unknown path shows not found", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/docs/does/not/exist")

    assert html =~ "Page not found"
  end
end
