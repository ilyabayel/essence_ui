defmodule EssenceUI.Primitives.RadioGroupTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.RadioGroup

  test "renders radix-like root and item" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <RadioGroup.root id="choice" default_value="a" name="choice" required on_value_change="changed">
            <RadioGroup.item value="a" checked>
              <RadioGroup.indicator checked>•</RadioGroup.indicator>
            </RadioGroup.item>
          </RadioGroup.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[role="radiogroup"]
    assert html =~ ~s[aria-required="true"]
    assert html =~ ~s[data-value="a"]
    assert html =~ ~s[data-name="choice"]
    assert html =~ ~s[data-on-value-change="changed"]
    assert html =~ ~s[role="radio"]
    assert html =~ ~s[value="a"]
    assert html =~ ~s[aria-checked="true"]
    assert html =~ "data-essence-radio-group-indicator"
  end
end
