defmodule Storybook.Typography.Code do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Code

  def function, do: &Code.code/1

  def container,
    do: {:div, "data-scaling": "100%", style: "display: block;", "data-accent-color": "indigo", "data-radius": "medium"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default code",
        attributes: %{},
        slots: ["console.log()"]
      },
      %Variation{
        id: :sizes_group,
        description: "Size",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3 rt-r-ai-start">
          <.code size="1">console.log()</.code>
          <.code size="2">console.log()</.code>
          <.code size="3">console.log()</.code>
          <.code size="4">console.log()</.code>
          <.code size="5">console.log()</.code>
          <.code size="6">console.log()</.code>
          <.code size="7">console.log()</.code>
          <.code size="8">console.log()</.code>
          <.code size="9">console.log()</.code>
        </div>
        """
      },
      %Variation{
        id: :variant_group,
        description: "Variant",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
          <.code variant="solid">console.log()</.code>
          <.code variant="soft">console.log()</.code>
          <.code variant="outline">console.log()</.code>
          <.code variant="ghost">console.log()</.code>
        </div>
        """
      },
      %Variation{
        id: :colors_group,
        description: "Color",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
          <.code color="indigo">console.log()</.code>
          <.code color="crimson">console.log()</.code>
          <.code color="cyan">console.log()</.code>
          <.code color="orange">console.log()</.code>
        </div>
        """
      },
      %Variation{
        id: :high_contrast_group,
        description: "High-contrast",
        template: """
        <div class="rt-Flex rt-r-gap-3">
          <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
            <.code color="gray" variant="solid">
              console.log()
            </.code>
            <.code color="gray" variant="soft">
              console.log()
            </.code>
            <.code color="gray" variant="outline">
              console.log()
            </.code>
            <.code color="gray" variant="ghost">
              console.log()
            </.code>
          </div>

          <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
            <.code color="gray" variant="solid" high_contrast={true}>
              console.log()
            </.code>
            <.code color="gray" variant="soft" high_contrast={true}>
              console.log()
            </.code>
            <.code color="gray" variant="outline" high_contrast={true}>
              console.log()
            </.code>
            <.code color="gray" variant="ghost" high_contrast={true}>
              console.log()
            </.code>
          </div>
        </div>
        """
      },
      %Variation{
        id: :weight_group,
        description: "Weight",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-2 rt-r-ai-start">
          <.code weight="regular">console.log()</.code>
          <.code weight="bold">console.log()</.code>
        </div>
        """
      },
      %Variation{
        id: :truncate_example,
        description: "Truncate",
        template: """
        <div class="rt-Flex rt-r-max-w" style="--max-width: 200px;">
          <.code truncate={true}>linear-gradient(red, orange, yellow, green, blue);</.code>
        </div>
        """
      }
    ]
  end
end
