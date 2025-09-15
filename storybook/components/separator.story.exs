defmodule Storybook.Components.Separator do
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
       "data-accent-color": "indigo"}

  def imports, do: [{EssenceUI.Components, [box: 1, text: 1, flex: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.box p="4">
          <.text>Above separator</.text>
          <.separator my="3" />
          <.text>Below separator</.text>
        </.box>
        """
      },
      %Variation{
        id: :horizontal,
        description: "Horizontal separator (default)",
        template: """
        <.box p="4">
          <.text>First section</.text>
          <.separator orientation="horizontal" my="3" />
          <.text>Second section</.text>
        </.box>
        """
      },
      %Variation{
        id: :vertical,
        description: "Vertical separator",
        template: """
        <.flex align="center" gap="3" p="4">
          <.text>Left content</.text>
          <.separator orientation="vertical" />
          <.text>Right content</.text>
        </.flex>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text size="1">Size 1</.text>
            <.separator size="1" my="2" />
          </.box>
          <.box>
            <.text size="2">Size 2</.text>
            <.separator size="2" my="2" />
          </.box>
          <.box>
            <.text size="3">Size 3</.text>
            <.separator size="3" my="2" />
          </.box>
          <.box>
            <.text size="4">Size 4</.text>
            <.separator size="4" my="2" />
          </.box>
        </.box>
        """
      },
      %Variation{
        id: :colors,
        description: "Different colors",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text>Red separator</.text>
            <.separator color="red" my="2" />
          </.box>
          <.box>
            <.text>Blue separator</.text>
            <.separator color="blue" my="2" />
          </.box>
          <.box>
            <.text>Green separator</.text>
            <.separator color="green" my="2" />
          </.box>
        </.box>
        """
      }
    ]
  end
end
