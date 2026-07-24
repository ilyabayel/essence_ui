defmodule Storybook.Themes.Typography.Kbd do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Flex
  alias EssenceUI.Components.Kbd

  def function, do: &Kbd.kbd/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-accent-color": "indigo",
       "data-gray-color": "slate",
       "data-gray-color": "slate"}

  def layout, do: :one_column

  def imports, do: [{Flex, flex: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{},
        slots: ["Shift + Tab"]
      },
      %Variation{
        id: :sizes,
        description: "Size",
        template: """
        <.flex direction="column" gap="3" align="start">
          <.kbd size="1">Shift + Tab</.kbd>
          <.kbd size="2">Shift + Tab</.kbd>
          <.kbd size="3">Shift + Tab</.kbd>
          <.kbd size="4">Shift + Tab</.kbd>
          <.kbd size="5">Shift + Tab</.kbd>
          <.kbd size="6">Shift + Tab</.kbd>
          <.kbd size="7">Shift + Tab</.kbd>
          <.kbd size="8">Shift + Tab</.kbd>
          <.kbd size="9">Shift + Tab</.kbd>
        </.flex>
        """
      }
    ]
  end
end
