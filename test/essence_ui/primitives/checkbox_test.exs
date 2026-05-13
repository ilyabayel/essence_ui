defmodule EssenceUI.Primitives.CheckboxTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Checkbox

  test "renders radix-like structure" do
    html = render_component(&Checkbox.root/1, %{id: "c1", inner_block: []})
    assert html =~ ~s[button id="c1"]
    assert html =~ ~s[phx-hook="CheckboxRoot"]
    assert html =~ ~s[role="checkbox"]
    assert html =~ ~s[data-state="unchecked"]

    assert html =~ ~s[input type="checkbox"]
    assert html =~ ~s[data-essence-checkbox-input]
  end

  test "renders with states" do
    html = render_component(&Checkbox.root/1, %{id: "c1", checked: true, inner_block: []})
    assert html =~ ~s[data-state="checked"]
    assert html =~ ~s[checked]

    html = render_component(&Checkbox.root/1, %{id: "c1", checked: "indeterminate", inner_block: []})
    assert html =~ ~s[data-state="indeterminate"]
  end

  test "renders attributes correctly" do
    html =
      render_component(&Checkbox.root/1, %{
        id: "c1",
        name: "terms",
        value: "on",
        disabled: true,
        required: true,
        inner_block: []
      })

    assert html =~ ~s[name="terms"]
    assert html =~ ~s[value="on"]
    assert html =~ ~s[disabled]
    assert html =~ ~s[required]
    assert html =~ ~s[data-disabled="true"]
    assert html =~ ~s[data-required="true"]
  end
end
