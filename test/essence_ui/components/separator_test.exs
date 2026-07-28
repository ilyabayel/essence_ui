defmodule EssenceUI.Components.SeparatorTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Separator

  test "renders separator wrapping primitive a11y attrs" do
    html = render_component(&Separator.separator/1, %{})

    assert html =~ "rt-Separator"
    assert html =~ "rt-reset"
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

    assert html =~ "rt-r-size-2"
    assert html =~ "rt-r-orientation-vertical"
    assert html =~ ~s(data-accent-color="red")
    assert html =~ ~s[data-orientation="vertical"]
    assert html =~ "rt-r-m-4"
  end

  test "decorative omits separator role" do
    html = render_component(&Separator.separator/1, %{decorative: true})

    assert html =~ ~s[role="none"]
    refute html =~ ~s[role="separator"]
  end
end
