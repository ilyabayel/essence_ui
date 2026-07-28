defmodule EssenceUI.Primitives.RadioGroupTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.RadioGroup

  test "renders root, item, empty indicator, and bubble input" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <RadioGroup.root id="choice" default_value="a" name="choice" required on_value_change="changed">
            <RadioGroup.item value="a" checked name="choice" required>
              <RadioGroup.indicator checked class="RadioGroupIndicator" />
            </RadioGroup.item>
            <RadioGroup.item value="b" name="choice">
              <RadioGroup.indicator class="RadioGroupIndicator" />
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
    assert html =~ "data-radix-radio-group-indicator"
    assert html =~ ~s[class="RadioGroupIndicator"]
    assert html =~ ~s[type="radio"]
    assert html =~ "data-radix-radio-group-input"
    assert html =~ ~s[name="choice"]

    # Empty indicator (no nested content) for checked item
    assert html =~ ~r/data-radix-radio-group-indicator[^>]*>\s*</
  end
end
