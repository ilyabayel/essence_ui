defmodule EssenceUIWeb.Docs.CatalogTest do
  use ExUnit.Case, async: true

  alias EssenceUIWeb.Docs.Catalog

  test "indexes markdown pages from docs/content" do
    pages = Catalog.pages()

    assert Map.has_key?(pages, "themes/overview/getting-started")
    assert Map.has_key?(pages, "themes/components/button")
    assert Map.has_key?(pages, "primitives/components/dialog")
    assert Map.has_key?(pages, "primitives/overview/introduction")
    assert Map.has_key?(pages, "primitives/guides/styling")
    assert Map.has_key?(pages, "primitives/utilities/slot")

    button = Catalog.fetch!(:themes, "components/button")
    assert button.title == "Button"
    assert button.description =~ "action"
    assert button.body =~ "props_table"
  end

  test "primitives nav has overview guides components utilities" do
    titles = Catalog.nav(:primitives) |> Enum.map(& &1.title)
    assert titles == ["Overview", "Guides", "Components", "Utilities"]
    assert Catalog.home_path(:primitives) == "overview/introduction"
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

  test "inject_heex_slot_code adds code attr from slot body" do
    body = """
    <.demo>
      <:heex>
        <Dialog.root id="x">Hi</Dialog.root>
      </:heex>
    </.demo>
    """

    injected = Catalog.inject_heex_slot_code(body)
    assert injected =~ ~s[code={"<Dialog.root id=\\"x\\">Hi</Dialog.root>"}]
    assert injected =~ "<Dialog.root id=\"x\">Hi</Dialog.root>"
  end

  test "inject_heex_slot_code leaves existing code attr alone" do
    body = """
    <:heex code={~s[<.button>Hi</.button>]}>
      <.button>Hi</.button>
    </:heex>
    """

    assert Catalog.inject_heex_slot_code(body) == body
  end
end
