defmodule EssenceUIWeb.Storybook.Typography.Em do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Em

  def function, do: &Em.em/1

  def container, do: {:div, "data-scaling": "100%", style: "display: block;", "data-gray-color": "slate"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Text, text: 1}, {EssenceUI.Components.Flex, flex: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default Em",
        attributes: %{},
        template: """
        <.text>
          We <.em>had</.em> to do something about it.
        </.text>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate",
        template: """
        <.flex max_width="300px">
          <.em truncate>
            The goal of typography is to relate font size, line height, and line width
            in a proportional way that maximizes beauty and makes reading easier and
            more pleasant.
          </.em>
        </.flex>
        """
      }
    ]
  end
end
