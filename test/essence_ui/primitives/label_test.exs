defmodule EssenceUI.Primitives.LabelTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Label

  test "renders radix-like label" do
    html = render_component(&Label.label/1, %{for: "name", inner_block: []})

    assert html =~ ~s[<label]
    assert html =~ ~s[for="name"]
    assert html =~ ~s[phx-hook="LabelRoot"]
  end
end
