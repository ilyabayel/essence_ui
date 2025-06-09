defmodule Storybook.Typography.Code do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Code

  def function, do: &Code.code/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       style: "display: block;",
       "data-accent-color": "indigo",
       "data-radius": "medium",
       "data-gray-color": "slate"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default code",
        attributes: %{},
        slots: ["Repo.all()"]
      },
      %Variation{
        id: :sizes_group,
        description: "Size",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3 rt-r-ai-start">
          <.code size="1">Repo.all()</.code>
          <.code size="2">Repo.all()</.code>
          <.code size="3">Repo.all()</.code>
          <.code size="4">Repo.all()</.code>
          <.code size="5">Repo.all()</.code>
          <.code size="6">Repo.all()</.code>
          <.code size="7">Repo.all()</.code>
          <.code size="8">Repo.all()</.code>
          <.code size="9">Repo.all()</.code>
        </div>
        """
      },
      %Variation{
        id: :variant_group,
        description: "Variant",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
          <.code variant="solid">Repo.all()</.code>
          <.code variant="soft">Repo.all()</.code>
          <.code variant="outline">Repo.all()</.code>
          <.code variant="ghost">Repo.all()</.code>
        </div>
        """
      },
      %Variation{
        id: :colors_group,
        description: "Color",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
          <.code color="indigo">Repo.all()</.code>
          <.code color="crimson">Repo.all()</.code>
          <.code color="cyan">Repo.all()</.code>
          <.code color="orange">Repo.all()</.code>
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
              Repo.all()
            </.code>
            <.code color="gray" variant="soft">
              Repo.all()
            </.code>
            <.code color="gray" variant="outline">
              Repo.all()
            </.code>
            <.code color="gray" variant="ghost">
              Repo.all()
            </.code>
          </div>

          <div class="rt-Flex rt-r-fd-column rt-r-ai-start rt-r-gap-2">
            <.code color="gray" variant="solid" high_contrast={true}>
              Repo.all()
            </.code>
            <.code color="gray" variant="soft" high_contrast={true}>
              Repo.all()
            </.code>
            <.code color="gray" variant="outline" high_contrast={true}>
              Repo.all()
            </.code>
            <.code color="gray" variant="ghost" high_contrast={true}>
              Repo.all()
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
          <.code weight="regular">Repo.all()</.code>
          <.code weight="bold">Repo.all()</.code>
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
