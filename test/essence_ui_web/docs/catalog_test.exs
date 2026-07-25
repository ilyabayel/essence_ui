defmodule EssenceUIWeb.Docs.CatalogTest do
  use ExUnit.Case, async: true

  alias EssenceUIWeb.Docs.Catalog

  test "indexes markdown pages from docs/content" do
    pages = Catalog.pages()

    assert Map.has_key?(pages, "themes/overview/getting-started")
    assert Map.has_key?(pages, "themes/components/button")
    assert Map.has_key?(pages, "primitives/components/dialog")

    button = Catalog.fetch!(:themes, "components/button")
    assert button.title == "Button"
    assert button.description =~ "action"
    assert button.body =~ "props_table"
  end

  test "nav points at known pages for each section" do
    for section <- Catalog.sections() do
      paths =
        Catalog.nav(section)
        |> Enum.flat_map(& &1.items)
        |> Enum.map(& &1.path)

      for path <- paths do
        assert {:ok, _} = Catalog.fetch(section, path)
      end
    end
  end
end
