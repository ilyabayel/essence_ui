defmodule EssenceUIWeb.Storybook.Typography.Text do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Text

  def function, do: &Text.text/1

  def container, do: {:div, "data-scaling": "100%"}

  def layout, do: :one_column

  def args do
    [
      as: "span",
      size: "3",
      weight: "regular",
      align: "left",
      trim: "normal",
      truncate: false,
      wrap: "wrap",
      color: nil,
      high_contrast: false,
      inner_block: "The quick brown fox jumps over the lazy dog."
    ]
  end

  def argTypes do
    [
      as: [
        type: :string,
        options: ["span", "div", "label", "p"],
        default: "span",
        description: "The element to render"
      ],
      size: [
        type: :string,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
        default: "3",
        description: "Text size"
      ],
      weight: [
        type: :string,
        options: ["light", "regular", "medium", "bold"],
        default: "regular",
        description: "Font weight"
      ],
      align: [
        type: :string,
        options: ["left", "center", "right"],
        default: "left",
        description: "Text alignment"
      ],
      trim: [
        type: :string,
        options: ["normal", "start", "end", "both"],
        default: "normal",
        description: "Trim leading space"
      ],
      truncate: [
        type: :boolean,
        default: false,
        description: "Whether to truncate text with ellipsis"
      ],
      wrap: [
        type: :string,
        options: ["wrap", "nowrap", "pretty", "balance"],
        default: "wrap",
        description: "Text wrapping"
      ],
      color: [
        type: :string,
        options: [nil, "gray", "indigo", "cyan", "orange", "crimson"],
        default: nil,
        description: "Text color"
      ],
      high_contrast: [
        type: :boolean,
        default: false,
        description: "Whether to increase color contrast"
      ],
      inner_block: [
        type: :string,
        description: "Text content"
      ]
    ]
  end

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
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3">
          <.text as="p">This is a <strong>paragraph</strong> element.</.text>
          <.text as="label">This is a <strong>label</strong> element.</.text>
          <.text as="div">This is a <strong>div</strong> element.</.text>
          <.text as="span">This is a <strong>span</strong> element.</.text>
        </div>
        """
      },
      %Variation{
        id: :sizes_group,
        description: "Size",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3">
          <.text size="1">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="2">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="3">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="4">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="5">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="6">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="7">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="8">The quick brown fox jumps over the lazy dog.</.text>
          <.text size="9">The quick brown fox jumps over the lazy dog.</.text>
        </div>
        """
      },
      %Variation{
        id: :longform_sizes,
        description: "Longform content sizes",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-5">
          <.text as="p" size="4" style="margin-bottom: 20px;">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
          <.text as="p" size="3" style="margin-bottom: 20px;">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
          <.text as="p" size="2" color="gray">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :ui_label_sizes,
        description: "UI label sizes",
        template: """
        <div class="rt-Grid rt-r-gtc-2 rt-r-ai-center rt-r-gap-5 rt-r-p-3">
          <div style="display: flex; flex-direction: column;">
            <.text size="3" weight="bold">Get started</.text>
            <.text color="gray" size="2">Start your next project in minutes</.text>
          </div>
          <div style="display: flex; flex-direction: column;">
            <.text size="2" weight="bold">Get started</.text>
            <.text color="gray" size="2">Start your next project in minutes</.text>
          </div>
          <div style="display: flex; flex-direction: column;">
            <.text size="2" weight="bold">Get started</.text>
            <.text color="gray" size="1">Start your next project in minutes</.text>
          </div>
          <div style="display: flex; flex-direction: column;">
            <.text size="1" weight="bold">Get started</.text>
            <.text color="gray" size="1">Start your next project in minutes</.text>
          </div>
        </div>
        """
      },
      %Variation{
        id: :weights_group,
        description: "Weight",
        template: """
        <div style="display: flex; flex-direction: column;">
          <.text weight="regular" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
          <.text weight="medium" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
          <.text weight="bold" as="div">
            The quick brown fox jumps over the lazy dog.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :alignment,
        description: "Align",
        template: """
        <div style="width: 100%;">
          <.text align="left" as="div">Left-aligned</.text>
          <.text align="center" as="div">Center-aligned</.text>
          <.text align="right" as="div">Right-aligned</.text>
        </div>
        """
      },
      %Variation{
        id: :trim,
        description: "Trim",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3">
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
        </div>
        """
      },
      %Variation{
        id: :trim_box_example,
        description: "Trim in box components",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3">
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
        </div>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate",
        template: """
        <div class="rt-Flex rt-r-max-w" style="--max-width: 300px;">
          <.text truncate>
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :wrap_nowrap,
        description: "Wrap - nowrap",
        template: """
        <div class="rt-Flex rt-r-max-w" style="--max-width: 270px;">
          <.text wrap="nowrap">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :wrap_balance,
        description: "Wrap - balance",
        template: """
        <div class="rt-Flex rt-r-max-w" style="--max-width: 270px;">
          <.text wrap="balance">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :wrap_pretty,
        description: "Wrap - pretty",
        template: """
        <div class="rt-Flex rt-r-max-w" style="--max-width: 270px;">
          <.text wrap="pretty">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :colors_group,
        description: "Color",
        template: """
        <div class="rt-Flex rt-r-fd-column">
          <.text color="indigo">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="cyan">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="orange">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="crimson">The quick brown fox jumps over the lazy dog.</.text>
        </div>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <div style="display: flex; flex-direction: column;">
          <.text color="gray">The quick brown fox jumps over the lazy dog.</.text>
          <.text color="gray" high_contrast={true}>
            The quick brown fox jumps over the lazy dog.
          </.text>
        </div>
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
        <div style="max-width: 300px;">
          <.text as="label" size="3">
            <div style="display: flex; gap: 8px;">
              <input type="checkbox" checked />
              I understand that these documents are confidential and cannot be shared with a third party.
            </div>
          </.text>
        </div>
        """
      }
    ]
  end
end
