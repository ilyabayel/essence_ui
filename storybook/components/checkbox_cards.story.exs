defmodule Storybook.Components.CheckboxCards do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Box
  alias EssenceUI.Components.CheckboxCards
  alias EssenceUI.Components.Flex
  alias EssenceUI.Components.Text

  def function, do: &CheckboxCards.checkbox_cards_root/1

  def imports, do: [{Box, [box: 1]}, {Flex, [flex: 1]}, {Text, [text: 1]}, {CheckboxCards, [checkbox_cards_item: 1]}]

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block; padding: 20px; z-index: 1000;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default checkbox cards with product selection",
        template: """
        <.checkbox_cards_root default_value={["1"]} columns="3">
          <.checkbox_cards_item value="1">
            <.flex direction="column" width="100%">
              <.text weight="bold">A1 Keyboard</.text>
              <.text>US Layout</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="2">
            <.flex direction="column" width="100%">
              <.text weight="bold">Pro Mouse</.text>
              <.text>Zero-lag wireless</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="3">
            <.flex direction="column" width="100%">
              <.text weight="bold">Lightning Mat</.text>
              <.text>Wireless charging</.text>
            </.flex>
          </.checkbox_cards_item>
        </.checkbox_cards_root>
        """
      }
    ]
  end
end
