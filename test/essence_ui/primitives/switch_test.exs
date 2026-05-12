defmodule EssenceUI.Primitives.SwitchTest do
  use EssenceUIWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  alias EssenceUI.Primitives.Switch

  test "renders radix-like structure" do
    html = render_component(&Switch.root/1, %{id: "s1", inner_block: []})
    assert html =~ ~s[button id="s1"]
    assert html =~ ~s[phx-hook="SwitchRoot"]
    assert html =~ ~s[role="switch"]
    assert html =~ ~s[data-state="unchecked"]
    
    assert html =~ ~s[input type="checkbox"]
    assert html =~ ~s[data-essence-switch-input]
  end

  test "renders with checked state" do
    html = render_component(&Switch.root/1, %{id: "s1", checked: true, inner_block: []})
    assert html =~ ~s[data-state="checked"]
    assert html =~ ~s[checked]
  end

  test "renders attributes correctly" do
    html = render_component(&Switch.root/1, %{
      id: "s1", 
      name: "notifications", 
      value: "on", 
      disabled: true, 
      required: true,
      inner_block: []
    })
    
    assert html =~ ~s[name="notifications"]
    assert html =~ ~s[value="on"]
    assert html =~ ~s[disabled]
    assert html =~ ~s[required]
    assert html =~ ~s[data-disabled="true"]
    assert html =~ ~s[data-required="true"]
  end

  test "renders thumb when used" do
    html = render_component(fn assigns ->
      ~H"""
      <Switch.root id="s1">
        <Switch.thumb id="thumb" />
      </Switch.root>
      """
    end, %{})
    
    assert html =~ ~s[data-essence-switch-thumb]
    assert html =~ ~s[id="thumb"]
  end
end
