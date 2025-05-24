defmodule Storybook.Typography.Text do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Text

  def function, do: &Text.text/1

  def container, do: {:div, "data-scaling": "100%", style: "display: block;", "data-gray-color": "slate"}

  def imports,
    do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Grid, grid: 1}, {EssenceUI.Components.Box, box: 1}]

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default text",
        attributes: %{},
        slots: ["The quick brown fox jumps over the lazy dog."]
      },
      %Variation{
        id: :as_elements,
        description: "As another element",
        template: """
        <.flex gap="3" direction="column">
          <.text as="p">This is a <strong>paragraph</strong> element.</.text>
          <.text as="label">This is a <strong>label</strong> element.</.text>
          <.text as="div">This is a <strong>div</strong> element.</.text>
          <.text as="span">This is a <strong>span</strong> element.</.text>
        </.flex>
        """
      },
      %Variation{
        id: :sizes_group,
        description: "Size",
        template: """
        <.flex gap="3" direction="column">
          <.text size="1">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="2">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="3">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="4">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="5">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="6">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="7">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="8">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="9">The quick brown fox jumps over the lazy dog.</.text>
        </.flex>
        """
      },
      %Variation{
        id: :longform_sizes,
        description: "Longform content sizes",
        template: """
        <.flex gap="5" direction="column">
          <.text as="p" size="4" style="margin-bottom: 20px;">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
          <.text as="p" size="3" style="margin-bottom: 20px;">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
          <.text as="p" size="2" color="gray">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :ui_label_sizes,
        description: "UI label sizes",
        template: """
        <.grid gap="5" columns="2" p="3" align="center">
          <.flex direction="column">
            <.text size="3" weight="bold">Get started</.text>
            <.text color="gray" size="2">Start your next project in minutes</.text>
          </.flex>
          <.flex direction="column">
            <.text size="2" weight="bold">Get started</.text>
            <.text color="gray" size="2">Start your next project in minutes</.text>
          </.flex>
          <.flex direction="column">
            <.text size="2" weight="bold">Get started</.text>
            <.text color="gray" size="1">Start your next project in minutes</.text>
          </.flex>
          <.flex direction="column">
            <.text size="1" weight="bold">Get started</.text>
            <.text color="gray" size="1">Start your next project in minutes</.text>
          </.flex>
        </.grid>
        """
      },
      %Variation{
        id: :weights_group,
        description: "Weight",
        template: """
        <.flex direction="column" gap="3">
          <.text weight="regular" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
          <.text weight="medium" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
          <.text weight="bold" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :alignment,
        description: "Align",
        template: """
        <.box width="100%">
          <.text align="left" as="div">Left-aligned</.text>
          <.text align="center" as="div">Center-aligned</.text>
          <.text align="right" as="div">Right-aligned</.text>
        </.box>
        """
      },
      %Variation{
        id: :trim,
        description: "Trim",
        template: """
        <.flex gap="3" direction="column">
          <.text
            trim="normal"
            style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);"
          >
            Without trim
          </.text>
          <.text
            trim="both"
            style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);"
          >
            With trim
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :trim_box_example,
        description: "Trim in box components",
        template: """
        <.flex gap="3" direction="column">
          <div style="background: var(--gray-a2); border: 1px dashed var(--gray-a7); padding: 16px;">
            <.text weight="bold" size="3" style="margin-bottom: 4px;">Without trim</.text>
            <.text>
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>

          <div style="background: var(--gray-a2); border: 1px dashed var(--gray-a7); padding: 16px;">
            <.text weight="bold" size="3" style="margin-bottom: 4px;" trim="start">With trim</.text>
            <.text trim="end">
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>
        </.flex>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate",
        template: """
        <.flex gap="3" direction="column" max_width="300px">
          <.text truncate>
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :wrap,
        description: "Wrap - nowrap",
        template: """
        <.flex gap="3" direction="column" max_width="300px">
          <.text wrap="nowrap">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
          <.text wrap="balance">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
          <.text wrap="pretty">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :colors_group,
        description: "Color",
        template: """
        <.flex direction="column">
          <.text color="indigo">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="cyan">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="orange">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="crimson">The quick brown fox jumps over the lazy dog.</.text>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <.flex direction="column">
          <.text color="gray">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="gray" high_contrast={true}>
            The quick brown fox jumps over the lazy dog.
          </.text>
        </.flex>
        """
      },
      %Variation{
        id: :with_formatting,
        description: "With formatting",
        template: """
        <.text as="p">
          Look, such a helpful <a href="#">link</a>, an <em>italic emphasis</em>,
          a piece of computer <code>code</code>, and even a hotkey combination{" "}
          <kbd>⇧⌘A</kbd> within the text.
        </.text>
        """
      },
      %Variation{
        id: :with_form_controls,
        description: "With form controls",
        template: """
        <.box max_width="300px">
          <.text as="label" size="3">
            <.flex gap="1">
              <input type="checkbox" checked />
              I understand that these documents are confidential and cannot be shared with a third party.
            </.flex>
          </.text>
        </.box>
        """
      }
    ]
  end
end
