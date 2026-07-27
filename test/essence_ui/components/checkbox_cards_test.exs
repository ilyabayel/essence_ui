defmodule EssenceUI.Components.CheckboxCardsTest do
  use EssenceUIWeb.ConnCase, async: true

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

    assert html =~ "est-Grid"
    assert html =~ "est-CheckboxCardsRoot"
    assert html =~ "est-r-size-3"
    assert html =~ "est-variant-classic"
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

    assert html =~ "est-BaseCard"
    assert html =~ "est-CheckboxCardsItem"
    assert html =~ "est-CheckboxCardCheckbox"
    assert html =~ "est-BaseCheckboxRoot"
    assert html =~ "est-BaseCheckboxIndicator"
    assert html =~ "est-variant-surface"
    assert html =~ ~s(role="checkbox")
    assert html =~ ~s(value="1")
    assert html =~ "Keyboard"
  end
end
