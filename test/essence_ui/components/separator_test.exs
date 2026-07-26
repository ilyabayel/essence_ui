defmodule EssenceUI.Components.SeparatorTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Separator

  test "renders separator wrapping primitive a11y attrs" do
    html = render_component(&Separator.separator/1, %{})

    assert html =~ "est-Separator"
    assert html =~ "est-reset"
    assert html =~ ~s[role="separator"]
    assert html =~ ~s[data-orientation="horizontal"]
  end

  test "renders with size, color, and orientation" do
    html =
      render_component(&Separator.separator/1, %{
        orientation: "vertical",
        size: "2",
        color: "red",
        m: "4"
      })

    assert html =~ "est-r-size-2"
    assert html =~ "est-r-orientation-vertical"
    assert html =~ ~s(data-accent-color="red")
    assert html =~ ~s[data-orientation="vertical"]
    assert html =~ "est-r-m-4"
  end

  test "decorative omits separator role" do
    html = render_component(&Separator.separator/1, %{decorative: true})

    assert html =~ ~s[role="none"]
    refute html =~ ~s[role="separator"]
  end
end
