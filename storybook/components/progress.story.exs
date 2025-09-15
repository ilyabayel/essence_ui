defmodule Storybook.Components.Progress do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.progress/1

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
          <.progress value={50} />
        </.box>
        """
      },
      %Variation{
        id: :variants,
        description: "Different variants",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text size="2" weight="medium">Classic</.text>
            <.progress value={75} variant="classic" />
          </.box>
          <.box>
            <.text size="2" weight="medium">Surface</.text>
            <.progress value={50} variant="surface" />
          </.box>
          <.box>
            <.text size="2" weight="medium">Soft</.text>
            <.progress value={25} variant="soft" />
          </.box>
        </.box>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text size="1">Size 1</.text>
            <.progress value={60} size="1" />
          </.box>
          <.box>
            <.text size="2">Size 2</.text>
            <.progress value={70} size="2" />
          </.box>
          <.box>
            <.text size="3">Size 3</.text>
            <.progress value={80} size="3" />
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
            <.text size="2" color="red">Red progress</.text>
            <.progress value={30} color="red" />
          </.box>
          <.box>
            <.text size="2" color="blue">Blue progress</.text>
            <.progress value={60} color="blue" />
          </.box>
          <.box>
            <.text size="2" color="green">Green progress</.text>
            <.progress value={90} color="green" />
          </.box>
        </.box>
        """
      },
      %Variation{
        id: :radius,
        description: "Different radius options",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text size="2">No radius</.text>
            <.progress value={40} radius="none" />
          </.box>
          <.box>
            <.text size="2">Small radius</.text>
            <.progress value={50} radius="small" />
          </.box>
          <.box>
            <.text size="2">Medium radius</.text>
            <.progress value={60} radius="medium" />
          </.box>
          <.box>
            <.text size="2">Large radius</.text>
            <.progress value={70} radius="large" />
          </.box>
          <.box>
            <.text size="2">Full radius</.text>
            <.progress value={80} radius="full" />
          </.box>
        </.box>
        """
      },
      %Variation{
        id: :values,
        description: "Different progress values",
        template: """
        <.box p="4" class="space-y-4">
          <.box>
            <.text size="2">0% Complete</.text>
            <.progress value={0} />
          </.box>
          <.box>
            <.text size="2">25% Complete</.text>
            <.progress value={25} />
          </.box>
          <.box>
            <.text size="2">50% Complete</.text>
            <.progress value={50} />
          </.box>
          <.box>
            <.text size="2">75% Complete</.text>
            <.progress value={75} />
          </.box>
          <.box>
            <.text size="2">100% Complete</.text>
            <.progress value={100} />
          </.box>
        </.box>
        """
      }
    ]
  end
end
