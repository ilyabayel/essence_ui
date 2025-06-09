defmodule Storybook.Typography.StrongStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Strong

  def function, do: &Strong.strong/1

  def container, do: {:div, "data-scaling": "100%", style: "display: block;", "data-gray-color": "slate"}
  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default inline strong.",
        template: """
        <.text>
          The most important thing to remember is, <.strong>stay positive</.strong>.
        </.text>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate long strong.",
        template: """
        <.flex max_width="300px">
          <.strong truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.strong>
        </.flex>
        """
      }
    ]
  end
end
