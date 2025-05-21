defmodule EssenceUIWeb.Storybook.Typography.Blockquote do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Blockquote

  def function, do: &Blockquote.blockquote/1

  def container,
    do: {:div, "data-scaling": "100%", "data-radius": "medium", style: "display: block;", "data-accent-color": "indigo"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{},
        slots: [
          "Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy."
        ]
      },
      %Variation{
        id: :sizes,
        description: "Size",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-5">
          <div style="max-width: 300px;">
            <.blockquote size="1">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 350px;">
            <.blockquote size="2">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 400px;">
            <.blockquote size="3">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 450px;">
            <.blockquote size="4">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 500px;">
            <.blockquote size="5">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 550px;">
            <.blockquote size="6">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 600px;">
            <.blockquote size="7">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 650px;">
            <.blockquote size="8">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
          <div style="max-width: 1000px;">
            <.blockquote size="9">
              Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
            </.blockquote>
          </div>
        </div>
        """
      },
      %Variation{
        id: :weights,
        description: "Weight",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3" style="max-width: 500px;">
          <.blockquote weight="regular">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote weight="medium">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote weight="bold">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
        </div>
        """
      },
      %Variation{
        id: :colors,
        description: "Color",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3" style="max-width: 500px;">
          <.blockquote color="indigo">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote color="cyan">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote color="orange">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote color="crimson">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
        </div>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3" style="max-width: 500px;">
          <.blockquote color="gray">
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
          <.blockquote color="gray" high_contrast={true}>
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
        </div>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate",
        template: """
        <div class="rt-Flex" style="max-width: 500px;">
          <.blockquote truncate>
            Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.
          </.blockquote>
        </div>
        """
      }
    ]
  end
end
