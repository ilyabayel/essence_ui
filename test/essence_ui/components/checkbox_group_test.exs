defmodule EssenceUI.Components.CheckboxGroupTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.CheckboxGroup

  test "root wraps primitive with themes classes" do
    html =
      render_component(&CheckboxGroup.checkbox_group_root/1, %{
        id: "cg1",
        size: "3",
        color: "blue",
        high_contrast: true,
        name: "traits",
        default_value: ["1"],
        inner_block: [%{inner_block: fn _, _ -> "" end}]
      })

    assert html =~ "est-CheckboxGroupRoot"
    assert html =~ "est-r-size-3"
    assert html =~ ~s(phx-hook="CheckboxGroupRoot")
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "est-high-contrast"
    assert html =~ ~s(data-name="traits")
  end

  test "item wraps primitive checkbox with indicator" do
    html =
      render_component(&CheckboxGroup.checkbox_group_item/1, %{
        id: "item1",
        value: "fun",
        checked: true,
        size: "2",
        variant: "soft",
        color: "crimson",
        inner_block: [%{inner_block: fn _, _ -> "Fun" end}]
      })

    assert html =~ "est-CheckboxGroupItem"
    assert html =~ "est-CheckboxGroupItemCheckbox"
    assert html =~ "est-BaseCheckboxRoot"
    assert html =~ "est-BaseCheckboxIndicator"
    assert html =~ ~s(role="checkbox")
    assert html =~ ~s(data-accent-color="crimson")
    assert html =~ "est-variant-soft"
    assert html =~ "Fun"
  end

  test "slot convenience checkbox_group renders root and items" do
    html =
      render_component(&CheckboxGroup.checkbox_group/1, %{
        id: "slot-cg",
        name: "demo",
        default_value: ["1"],
        size: "1",
        color: "indigo",
        item: [
          %{value: "1", inner_block: fn _, _ -> "One" end},
          %{value: "2", inner_block: fn _, _ -> "Two" end}
        ]
      })

    assert html =~ "est-CheckboxGroupRoot"
    assert html =~ ~s(phx-hook="CheckboxGroupRoot")
    assert html =~ "est-r-size-1"
    assert html =~ ~s(data-accent-color="indigo")
    assert html =~ "One"
    assert html =~ "Two"
    assert html =~ ~s(value="1")
    assert html =~ ~s(value="2")
  end
end
