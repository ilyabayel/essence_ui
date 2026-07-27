defmodule EssenceUI.Primitives.CheckboxGroupTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.CheckboxGroup

  test "renders root, item, indicator, and bubble input" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <CheckboxGroup.root
            id="traits"
            default_value={["a"]}
            name="traits"
            required
            on_value_change="changed"
          >
            <CheckboxGroup.item value="a" checked name="traits" required>
              <CheckboxGroup.indicator checked class="CheckboxGroupIndicator">
                ✓
              </CheckboxGroup.indicator>
            </CheckboxGroup.item>
            <CheckboxGroup.item value="b" name="traits">
              <CheckboxGroup.indicator class="CheckboxGroupIndicator" />
            </CheckboxGroup.item>
          </CheckboxGroup.root>
          """
        end,
        %{}
      )

    assert html =~ ~s(role="group")
    assert html =~ ~s(phx-hook="CheckboxGroupRoot")
    assert html =~ ~s(aria-required="true")
    assert html =~ ~s(data-value="[&quot;a&quot;]")
    assert html =~ ~s(data-name="traits")
    assert html =~ ~s(data-on-value-change="changed")
    assert html =~ ~s(role="checkbox")
    assert html =~ ~s(value="a")
    assert html =~ ~s(aria-checked="true")
    assert html =~ "data-radix-checkbox-group-indicator"
    assert html =~ ~s(class="CheckboxGroupIndicator")
    assert html =~ ~s(type="checkbox")
    assert html =~ "data-radix-checkbox-group-input"
    assert html =~ ~s(name="traits")
  end

  test "encodes multiple default values as JSON array" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <CheckboxGroup.root id="multi" default_value={["x", "y"]}>
            <CheckboxGroup.item value="x" checked />
            <CheckboxGroup.item value="y" checked />
          </CheckboxGroup.root>
          """
        end,
        %{}
      )

    assert html =~ "data-radix-checkbox-group-root"
    assert html =~ ~s(data-value="[&quot;x&quot;,&quot;y&quot;]")
  end
end
