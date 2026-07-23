defmodule EssenceUI.Components.CheckboxGroupTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.CheckboxGroup

  test "renders themes checkbox group via checkbox primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <CheckboxGroup.checkbox_group
            id="group"
            name="skills"
            default_value={["elixir"]}
            size="2"
            variant="soft"
            color="blue"
          >
            <:item value="elixir">Elixir</:item>
            <:item value="react">React</:item>
          </CheckboxGroup.checkbox_group>
          """
        end,
        %{}
      )

    assert html =~ "rt-CheckboxGroupRoot"
    assert html =~ "rt-CheckboxGroupItem"
    assert html =~ "rt-CheckboxGroupItemCheckbox"
    assert html =~ "rt-CheckboxGroupItemInner"
    assert html =~ ~s(phx-hook="CheckboxRoot")
    assert html =~ "rt-BaseCheckboxRoot"
    assert html =~ "rt-BaseCheckboxIndicator"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ ~s(name="skills")
    assert html =~ ~s(data-state="checked")
  end
end
