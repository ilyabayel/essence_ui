defmodule Storybook.Typography.QuoteStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Quote

  def function, do: &Quote.es_quote/1

  def container, do: {:div, "data-scaling": "100%", style: "display: block;", "data-gray-color": "slate"}
  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default inline quote.",
        template: """
        <.es_quote>Styles come and go. Good design is a language, not a style</.es_quote>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate long quote.",
        template: """
        <.flex max_width="300px">
          <.es_quote truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.es_quote>
        </.flex>
        """
      },
      %Variation{
        id: :wrap,
        description: "Wrap variations",
        template: """
        <.flex direction="column" gap="6" max_width="300px">
          <.es_quote wrap="wrap">Wrap: The quick brown fox jumps over the lazy dog.</.es_quote>
          <.es_quote wrap="nowrap">No wrap: The quick brown fox jumps over the lazy dog.</.es_quote>
          <.es_quote wrap="pretty">Pretty: The quick brown fox jumps over the lazy dog.</.es_quote>
          <.es_quote wrap="balance">Balance: The quick brown fox jumps over the lazy dog.</.es_quote>
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Color variants.",
        template: """
        <.flex direction="column">
          <.text color="indigo">This is color, <.es_quote>Indigo</.es_quote></.text>
          <.text color="crimson">This is color, <.es_quote>Crimson</.es_quote></.text>
          <.text color="grass">This is color, <.es_quote>Grass</.es_quote></.text>
          <.text color="orange">This is color, <.es_quote>Orange</.es_quote></.text>
        </.flex>
        """
      }
    ]
  end
end
