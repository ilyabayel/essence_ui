defmodule Storybook.Themes.Components.Separator do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.separator/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px;",
       "data-gray-color": "slate",
       "data-accent-color": "gray"}

  def imports, do: [{EssenceUI.Components, [box: 1, text: 1, flex: 1]}]

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.text size="2">
          <.text>Tools for building high-quality, accessible UI</.text>
          <.separator my="3" size="4" />
          <.flex align="center" gap="3">
            <.text>Components</.text>
            <.separator orientation="vertical" mx="3" />
            <.text>Typography</.text>
            <.separator orientation="vertical" mx="3" />
            <.text>Colors</.text>
          </.flex>
        </.text>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <.flex direction="column" gap="4">
          <.separator size="1" />
          <.separator size="2" />
          <.separator size="3" />
          <.separator size="4" />
        </.flex>
        """
      },
      %Variation{
        id: :sizes_vertical,
        description: "Different sizes (vertical)",
        template: """
        <.flex align="center" gap="4" style="height: 96px;">
          <.separator size="1" orientation="vertical" />
          <.separator size="2" orientation="vertical" />
          <.separator size="3" orientation="vertical" />
          <.separator size="4" orientation="vertical" />
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Different colors",
        template: """
        <.flex direction="column" gap="4">
          <.separator size="4" color="indigo" />
          <.separator size="4" color="cyan" />
          <.separator size="4" color="orange" />
          <.separator size="4" color="crimson" />
        </.flex>
        """
      },
      %Variation{
        id: :orientation,
        description: "Orientation",
        template: """
        <.flex align="center" gap="3" p="4">
          <.separator orientation="horizontal" />
          <.separator orientation="vertical" />
        </.flex>
        """
      }
    ]
  end
end
