defmodule EssenceUI.Components.RadioCardsTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.RadioCards

  test "renders themes radio cards via radio group primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <RadioCards.radio_cards_root id="cards" default_value="1" columns="3" size="2" color="teal">
            <RadioCards.radio_cards_item value="1">One</RadioCards.radio_cards_item>
            <RadioCards.radio_cards_item value="2">Two</RadioCards.radio_cards_item>
          </RadioCards.radio_cards_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="RadioGroupRoot")
    refute html =~ ~s(phx-hook="RadioCards")
    assert html =~ "rt-RadioCardsRoot"
    assert html =~ "rt-Grid"
    assert html =~ "rt-RadioCardsItem"
    assert html =~ "rt-BaseCard"
    assert html =~ ~s(data-accent-color="teal")
    assert html =~ ~s(data-value="1")
    assert html =~ ~s(data-essence-radio-group-item)
    assert html =~ "rt-r-size-2"
  end
end
