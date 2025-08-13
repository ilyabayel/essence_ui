defmodule Storybook.Components.SegmentedControlStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.SegmentedControl

  def function, do: &SegmentedControl.segmented_control/1

  def imports, do: [{SegmentedControl, segmented_control_item: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default segmented control with three options",
        template: """
        <.segmented_control value="option1">
          <:option value="option1">Option 1</:option>
          <:option value="option2">Option 2</:option>
          <:option value="option3">Option 3</:option>
        </.segmented_control>
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Different sizes of segmented control",
        variations: [
          %Variation{
            id: :size1,
            attributes: %{size: "1", value: "size1"},
            slots: [
              """
              <:option value="size1">Size 1</:option>
              <:option value="size2">Size 2</:option>
              <:option value="size3">Size 3</:option>
              """
            ]
          },
          %Variation{
            id: :size2,
            attributes: %{size: "2", value: "size2"},
            slots: [
              """
              <:option value="size1">Size 1</:option>
              <:option value="size2">Size 2</:option>
              <:option value="size3">Size 3</:option>
              """
            ]
          },
          %Variation{
            id: :size3,
            attributes: %{size: "3", value: "size3"},
            slots: [
              """
              <:option value="size1">Size 1</:option>
              <:option value="size2">Size 2</:option>
              <:option value="size3">Size 3</:option>
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :variants,
        description: "Different visual variants",
        variations: [
          %Variation{
            id: :surface,
            attributes: %{variant: "surface", value: "surface"},
            slots: [
              """
                <:option value="surface">Surface</:option>
                <:option value="classic">Classic</:option>
              """
            ]
          },
          %Variation{
            id: :classic,
            attributes: %{variant: "classic", value: "classic"},
            slots: [
              """
              <:option value="surface">Surface</:option>
              <:option value="classic">Classic</:option>
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :colors,
        description: "Accent color variants",
        variations: [
          %Variation{
            id: :blue,
            attributes: %{color: "blue", value: "blue"},
            slots: [
              """
              <:option value="blue">Blue</:option>
              <:option value="green">Green</:option>
              <:option value="purple">Purple</:option>
              """
            ]
          },
          %Variation{
            id: :green,
            attributes: %{color: "green", value: "green"},
            slots: [
              """
              <:option value="blue">Blue</:option>
              <:option value="green">Green</:option>
              <:option value="purple">Purple</:option>
              """
            ]
          },
          %Variation{
            id: :purple,
            attributes: %{color: "purple", value: "purple"},
            slots: [
              """
              <:option value="blue">Blue</:option>
              <:option value="green">Green</:option>
              <:option value="purple">Purple</:option>
              """
            ]
          }
        ]
      },
      %Variation{
        id: :disabled,
        description: "Disabled segmented control",
        template: """
        <.segmented_control value="enabled" disabled>
          <:option value="enabled">Enabled</:option>
          <:option value="disabled">Disabled</:option>
        </.segmented_control>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variant",
        template: """
        <.segmented_control value="normal" high_contrast>
          <:option value="normal">Normal</:option>
          <:option value="high">High Contrast</:option>
        </.segmented_control>
        """
      }
    ]
  end
end
