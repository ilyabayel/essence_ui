defmodule EssenceUI.Components.CheckboxCardsTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.CheckboxCards

  test "renders themes checkbox cards via checkbox primitive without cards hook" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <CheckboxCards.checkbox_cards_root
            id="cards"
            default_value={["1"]}
            columns="3"
            size="2"
            color="indigo"
            :let={ctx}
          >
            <CheckboxCards.checkbox_cards_item value="1" {ctx}>One</CheckboxCards.checkbox_cards_item>
            <CheckboxCards.checkbox_cards_item value="2" {ctx}>Two</CheckboxCards.checkbox_cards_item>
          </CheckboxCards.checkbox_cards_root>
          """
        end,
        %{}
      )

    assert html =~ "rt-CheckboxCardsRoot"
    assert html =~ "rt-Grid"
    assert html =~ "rt-CheckboxCardsItem"
    assert html =~ "rt-BaseCard"
    assert html =~ "rt-CheckboxCardCheckbox"
    assert html =~ ~s(phx-hook="CheckboxRoot")
    refute html =~ ~s(phx-hook="CheckboxCards")
    assert html =~ "rt-BaseCheckboxIndicator"
    assert html =~ ~s(data-accent-color="indigo")
    assert html =~ ~s(data-state="checked")
  end
end
