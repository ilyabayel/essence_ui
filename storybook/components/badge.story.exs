defmodule Storybook.Components.Badge do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Badge.badge/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{},
        slots: ["Badge"]
      },
      %Variation{
        id: :variants,
        description: "Different badge variants",
        attributes: %{},
        template: """
        <.flex gap="2">
          <.badge variant="solid">Solid</.badge>
          <.badge variant="soft">Soft</.badge>
          <.badge variant="surface">Surface</.badge>
          <.badge variant="outline">Outline</.badge>
        </.flex>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different badge sizes",
        attributes: %{},
        template: """
        <.flex gap="2" align="center">
          <.badge size="1">Size 1</.badge>
          <.badge size="2">Size 2</.badge>
          <.badge size="3">Size 3</.badge>
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Different badge colors",
        attributes: %{},
        template: """
        <.flex gap="2" wrap="wrap">
          <.badge color="gray">Gray</.badge>
          <.badge color="gold">Gold</.badge>
          <.badge color="bronze">Bronze</.badge>
          <.badge color="brown">Brown</.badge>
          <.badge color="yellow">Yellow</.badge>
          <.badge color="amber">Amber</.badge>
          <.badge color="orange">Orange</.badge>
          <.badge color="tomato">Tomato</.badge>
          <.badge color="red">Red</.badge>
          <.badge color="ruby">Ruby</.badge>
          <.badge color="crimson">Crimson</.badge>
          <.badge color="pink">Pink</.badge>
          <.badge color="plum">Plum</.badge>
          <.badge color="purple">Purple</.badge>
          <.badge color="violet">Violet</.badge>
          <.badge color="iris">Iris</.badge>
          <.badge color="indigo">Indigo</.badge>
          <.badge color="blue">Blue</.badge>
          <.badge color="cyan">Cyan</.badge>
          <.badge color="teal">Teal</.badge>
          <.badge color="jade">Jade</.badge>
          <.badge color="green">Green</.badge>
          <.badge color="grass">Grass</.badge>
          <.badge color="lime">Lime</.badge>
          <.badge color="mint">Mint</.badge>
          <.badge color="sky">Sky</.badge>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast badges",
        attributes: %{},
        template: """
        <.flex gap="2">
          <.badge color="blue">Normal</.badge>
          <.badge color="blue" high_contrast>High Contrast</.badge>
        </.flex>
        """
      },
      %Variation{
        id: :radius,
        description: "Different radius values",
        attributes: %{},
        template: """
        <.flex gap="2">
          <.badge radius="none">None</.badge>
          <.badge radius="small">Small</.badge>
          <.badge radius="medium">Medium</.badge>
          <.badge radius="large">Large</.badge>
          <.badge radius="full">Full</.badge>
        </.flex>
        """
      },
      %Variation{
        id: :margins,
        description: "Margin props demonstration",
        attributes: %{},
        template: """
        <.flex gap="2" direction="column">
          <div style="border: 1px dashed var(--gray-6)">
            <.badge m="2">Margin all</.badge>
          </div>
          <div style="border: 1px dashed var(--gray-6)">
            <.badge mx="4">Margin horizontal</.badge>
          </div>
          <div style="border: 1px dashed var(--gray-6)">
            <.badge my="3">Margin vertical</.badge>
          </div>
          <div style="border: 1px dashed var(--gray-6)">
            <.badge mt="5">Margin top</.badge>
          </div>
        </.flex>
        """
      },
      %Variation{
        id: :combinations,
        description: "Various badge combinations",
        attributes: %{},
        template: """
        <.flex gap="2">
          <.badge size="2" variant="solid" color="green">✓ Success</.badge>
          <.badge size="2" variant="soft" color="yellow">⚠ Warning</.badge>
          <.badge size="2" variant="outline" color="red">✗ Error</.badge>
          <.badge size="2" variant="surface" color="blue">ℹ Info</.badge>
          <.badge size="2" variant="solid" color="purple" radius="full">NEW</.badge>
        </.flex>
        """
      }
    ]
  end
end
