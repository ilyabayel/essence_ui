defmodule EssenceUIWeb.Docs.PrimitivesSmokeTest do
  use EssenceUIWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  alias EssenceUIWeb.Docs.Catalog

  test "every primitives nav page renders without crash", %{conn: conn} do
    paths =
      Catalog.nav(:primitives)
      |> Enum.flat_map(& &1.items)
      |> Enum.map(& &1.path)

    assert length(paths) >= 40

    for path <- paths do
      assert {:ok, _view, html} = live(conn, "/primitives/docs/" <> path), path
      refute html =~ "Page not found", path
      assert html =~ "docs-article", path
    end
  end

  test "dialog has full radix sections", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/primitives/docs/components/dialog")
    assert html =~ "Anatomy"
    assert html =~ "API Reference"
    assert html =~ "Examples"
    assert html =~ "Accessibility"
    assert html =~ "Custom APIs"
    assert html =~ "docs-highlights"
  end

  test "getting started and styling guides render", %{conn: conn} do
    {:ok, _, html} = live(conn, "/primitives/docs/overview/getting-started")
    assert html =~ "Popover"
    {:ok, _, html} = live(conn, "/primitives/docs/guides/styling")
    assert html =~ "data-state"
    {:ok, _, html} = live(conn, "/primitives/docs/utilities/slot")
    assert html =~ "Slot"
  end
end
