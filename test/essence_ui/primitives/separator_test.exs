defmodule EssenceUI.Primitives.SeparatorTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Separator

  test "renders radix-like horizontal separator" do
    html = render_component(&Separator.separator/1, %{})

    assert html =~ ~s(role="separator")
    assert html =~ ~s(data-orientation="horizontal")
    assert html =~ ~s(aria-orientation="horizontal")
  end

  test "decorative separator uses role none without aria-orientation" do
    html = render_component(&Separator.separator/1, %{decorative: true, orientation: "vertical"})

    assert html =~ ~s(role="none")
    assert html =~ ~s(data-orientation="vertical")
    refute html =~ "aria-orientation"
  end
end
