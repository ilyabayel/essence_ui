defmodule EssenceUI.Components.SwitchTest do
  use EssenceUIWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  alias EssenceUI.Components.Switch

  test "renders switch component" do
    html = render_component(&Switch.switch/1, %{id: "s1"})
    
    assert html =~ ~s[button id="s1"]
    assert html =~ ~s[phx-hook="SwitchRoot"]
    assert html =~ ~s[role="switch"]
    assert html =~ "rt-SwitchRoot"
    assert html =~ "rt-SwitchThumb"
    assert html =~ ~s[input type="checkbox"]
    assert html =~ ~s[data-essence-switch-input]
  end

  test "renders with custom props" do
    html = render_component(&Switch.switch/1, %{
      id: "s2",
      size: "3",
      variant: "soft",
      color: "blue",
      high_contrast: true,
      m: "2"
    })
    
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "rt-high-contrast"
    assert html =~ "rt-r-m-2"
  end

  test "renders checked state" do
    html = render_component(&Switch.switch/1, %{id: "s1", checked: true})
    assert html =~ ~s[data-state="checked"]
    assert html =~ ~s[checked]
  end
end
