defmodule Storybook.Themes.Utilities.VisuallyHidden do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Utilities.VisuallyHidden

  def layout, do: :one_column

  def function, do: &VisuallyHidden.visually_hidden/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Visually hidden but screen-reader accessible",
        template: """
        <.flex gap="3" align="center">
          <.text>There is a hidden message here: </.text>
          <.visually_hidden>This message is only for screen readers.</.visually_hidden>
          <.text>(Check the DOM to see it)</.text>
        </.flex>
        """
      }
    ]
  end
end
