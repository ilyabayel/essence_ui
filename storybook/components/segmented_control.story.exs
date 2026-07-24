defmodule Storybook.Components.SegmentedControlStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.SegmentedControl

  def function, do: &SegmentedControl.segmented_control/1

  def imports, do: [{SegmentedControl, segmented_control_item: 1}, {EssenceUI.Components.Grid, grid: 1}]

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
          <.segmented_control_item value="option1">Option 1</.segmented_control_item>
          <.segmented_control_item value="option2">Option 2</.segmented_control_item>
          <.segmented_control_item value="option3">Option 3</.segmented_control_item>
        </.segmented_control>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes of segmented control",
        template: """
        <.grid columns="1" gap="4" style="width: max-content;">
          <.segmented_control size="1" value="size1">
            <.segmented_control_item value="size1">Size 1</.segmented_control_item>
            <.segmented_control_item value="size2">Size 2</.segmented_control_item>
            <.segmented_control_item value="size3">Size 3</.segmented_control_item>
          </.segmented_control>
          <.segmented_control size="2" value="size2">
            <.segmented_control_item value="size1">Size 1</.segmented_control_item>
            <.segmented_control_item value="size2">Size 2</.segmented_control_item>
            <.segmented_control_item value="size3">Size 3</.segmented_control_item>
          </.segmented_control>
          <.segmented_control size="3" value="size3">
            <.segmented_control_item value="size1">Size 1</.segmented_control_item>
            <.segmented_control_item value="size2">Size 2</.segmented_control_item>
            <.segmented_control_item value="size3">Size 3</.segmented_control_item>
          </.segmented_control>
        </.grid>
        """
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
                <.segmented_control_item value="surface">Surface</.segmented_control_item>
                <.segmented_control_item value="classic">Classic</.segmented_control_item>
              """
            ]
          },
          %Variation{
            id: :classic,
            attributes: %{variant: "classic", value: "classic"},
            slots: [
              """
              <.segmented_control_item value="surface">Surface</.segmented_control_item>
              <.segmented_control_item value="classic">Classic</.segmented_control_item>
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
              <.segmented_control_item value="blue">Blue</.segmented_control_item>
              <.segmented_control_item value="green">Green</.segmented_control_item>
              <.segmented_control_item value="purple">Purple</.segmented_control_item>
              """
            ]
          },
          %Variation{
            id: :green,
            attributes: %{color: "green", value: "green"},
            slots: [
              """
              <.segmented_control_item value="blue">Blue</.segmented_control_item>
              <.segmented_control_item value="green">Green</.segmented_control_item>
              <.segmented_control_item value="purple">Purple</.segmented_control_item>
              """
            ]
          },
          %Variation{
            id: :purple,
            attributes: %{color: "purple", value: "purple"},
            slots: [
              """
              <.segmented_control_item value="blue">Blue</.segmented_control_item>
              <.segmented_control_item value="green">Green</.segmented_control_item>
              <.segmented_control_item value="purple">Purple</.segmented_control_item>
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
          <.segmented_control_item value="enabled">Enabled</.segmented_control_item>
          <.segmented_control_item value="disabled">Disabled</.segmented_control_item>
        </.segmented_control>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variant",
        template: """
        <.segmented_control value="normal" high_contrast>
          <.segmented_control_item value="normal">Normal</.segmented_control_item>
          <.segmented_control_item value="high">High Contrast</.segmented_control_item>
        </.segmented_control>
        """
      },
      %Variation{
        id: :radius,
        description: "Use the radius prop to assign a specific radius value",
        template: """
        <.grid columns="1" gap="4" style="width: max-content;">
          <.segmented_control radius="none" value="none">
            <.segmented_control_item value="none">None</.segmented_control_item>
            <.segmented_control_item value="small">Small</.segmented_control_item>
            <.segmented_control_item value="medium">Medium</.segmented_control_item>
            <.segmented_control_item value="large">Large</.segmented_control_item>
            <.segmented_control_item value="full">Full</.segmented_control_item>
          </.segmented_control>
          <.segmented_control radius="small" value="small">
            <.segmented_control_item value="none">None</.segmented_control_item>
            <.segmented_control_item value="small">Small</.segmented_control_item>
            <.segmented_control_item value="medium">Medium</.segmented_control_item>
            <.segmented_control_item value="large">Large</.segmented_control_item>
            <.segmented_control_item value="full">Full</.segmented_control_item>
          </.segmented_control>
          <.segmented_control radius="medium" value="medium">
            <.segmented_control_item value="none">None</.segmented_control_item>
            <.segmented_control_item value="small">Small</.segmented_control_item>
            <.segmented_control_item value="medium">Medium</.segmented_control_item>
            <.segmented_control_item value="large">Large</.segmented_control_item>
            <.segmented_control_item value="full">Full</.segmented_control_item>
          </.segmented_control>
          <.segmented_control radius="large" value="large">
            <.segmented_control_item value="none">None</.segmented_control_item>
            <.segmented_control_item value="small">Small</.segmented_control_item>
            <.segmented_control_item value="medium">Medium</.segmented_control_item>
            <.segmented_control_item value="large">Large</.segmented_control_item>
            <.segmented_control_item value="full">Full</.segmented_control_item>
          </.segmented_control>
          <.segmented_control radius="full" value="full">
            <.segmented_control_item value="none">None</.segmented_control_item>
            <.segmented_control_item value="small">Small</.segmented_control_item>
            <.segmented_control_item value="medium">Medium</.segmented_control_item>
            <.segmented_control_item value="large">Large</.segmented_control_item>
            <.segmented_control_item value="full">Full</.segmented_control_item>
          </.segmented_control>
        </.grid>
        """
      }
    ]
  end
end
