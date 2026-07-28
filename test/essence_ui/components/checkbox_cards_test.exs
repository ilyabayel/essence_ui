defmodule EssenceUI.Components.CheckboxCardsTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.CheckboxCards

  test "root wraps CheckboxGroup primitive with grid and card classes" do
    html =
      render_component(&CheckboxCards.checkbox_cards_root/1, %{
        id: "cards1",
        size: "3",
        variant: "classic",
        color: "cyan",
        columns: "3",
        default_value: ["1"],
        inner_block: [%{inner_block: fn _, _ -> "" end}]
      })

    assert html =~ "rt-Grid"
    assert html =~ "rt-CheckboxCardsRoot"
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-classic"
    assert html =~ ~s(phx-hook="CheckboxGroupRoot")
    assert html =~ ~s(data-accent-color="cyan")
    assert html =~ ~s(role="group")
  end

  test "item wraps label and CheckboxGroup item with indicator" do
    html =
      render_component(&CheckboxCards.checkbox_cards_item/1, %{
        id: "card-item-1",
        value: "1",
        checked: true,
        size: "2",
        inner_block: [%{inner_block: fn _, _ -> "Keyboard" end}]
      })

    assert html =~ "rt-BaseCard"
    assert html =~ "rt-CheckboxCardsItem"
    assert html =~ "rt-CheckboxCardCheckbox"
    assert html =~ "rt-BaseCheckboxRoot"
    assert html =~ "rt-BaseCheckboxIndicator"
    assert html =~ "rt-variant-surface"
    assert html =~ ~s(role="checkbox")
    assert html =~ ~s(value="1")
    assert html =~ "Keyboard"
  end
end
