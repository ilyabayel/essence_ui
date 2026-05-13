defmodule EssenceUI.Components.CheckboxTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Checkbox

  test "renders checkbox component" do
    html = render_component(&Checkbox.checkbox/1, %{id: "c1"})

    # Primitive structure
    assert html =~ ~s(button id="c1")
    assert html =~ ~s(phx-hook="CheckboxRoot")
    assert html =~ ~s(input type="checkbox")

    # Component classes
    assert html =~ "rt-CheckboxRoot"
    assert html =~ "rt-BaseCheckboxRoot"
    # default size
    assert html =~ "rt-r-size-2"
    # default variant
    assert html =~ "rt-variant-surface"
  end

  test "renders with custom props" do
    html =
      render_component(&Checkbox.checkbox/1, %{
        id: "c2",
        size: "3",
        variant: "soft",
        color: "red",
        high_contrast: true,
        m: "4"
      })

    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="red")
    assert html =~ "rt-high-contrast"
    assert html =~ "rt-r-m-4"
  end

  test "renders both icons in indicator" do
    html = render_component(&Checkbox.checkbox/1, %{id: "c1"})

    assert html =~ ~s(data-state="checked")
    assert html =~ ~s(data-state="indeterminate")
    assert html =~ "rt-CheckboxIndicator"
  end
end
