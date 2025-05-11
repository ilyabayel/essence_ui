defmodule EssenceUIWeb.Storybook.Components.Text do
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
        <div style="display: flex; flex-direction: column; gap: 12px;">
          <.text as="p">This is a <strong>paragraph</strong> element.</.text>
          <.text as="label">This is a <strong>label</strong> element.</.text>
          <.text as="div">This is a <strong>div</strong> element.</.text>
          <.text as="span">This is a <strong>span</strong> element.</.text>
        </div>
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Size",
        variations: [
          %Variation{
            id: :size_1,
            description: "Text size 1",
            attributes: %{size: "1"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_2,
            description: "Text size 2",
            attributes: %{size: "2"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_3,
            description: "Text size 3",
            attributes: %{size: "3"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_4,
            description: "Text size 4",
            attributes: %{size: "4"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_5,
            description: "Text size 5",
            attributes: %{size: "5"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_6,
            description: "Text size 6",
            attributes: %{size: "6"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_7,
            description: "Text size 7",
            attributes: %{size: "7"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_8,
            description: "Text size 8",
            attributes: %{size: "8"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :size_9,
            description: "Text size 9",
            attributes: %{size: "9"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          }
        ]
      },
      %Variation{
        id: :longform_sizes,
        description: "Longform content sizes",
        template: """
        <div class="flex flex-col gap-4">
          <.text as="p" size="4" style="margin-bottom: 1rem;">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.
          </.text>
          <.text as="p" size="3" style="margin-bottom: 1rem;">
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
        <div style="display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 20px; padding: 12px;">
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
      %VariationGroup{
        id: :weights,
        description: "Weight",
        variations: [
          %Variation{
            id: :weights_regular,
            description: "Regular",
            attributes: %{weight: "regular", as: "div"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :weights_medium,
            description: "Medium",
            attributes: %{weight: "medium", as: "div"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :weights_bold,
            description: "Bold",
            attributes: %{weight: "bold", as: "div"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          }
        ]
      },
      %Variation{
        id: :alignment,
        description: "Align",
        template: """
        <div style="display: flex; flex-direction: column; gap: 12px; width: 300px;">
          <div style="border: 1px solid #ccc; padding: 10px;">
            <.text align="left" as="div">Left-aligned</.text>
          </div>
          <div style="border: 1px solid #ccc; padding: 10px;">
            <.text align="center" as="div">Center-aligned</.text>
          </div>
          <div style="border: 1px solid #ccc; padding: 10px;">
            <.text align="right" as="div">Right-aligned</.text>
          </div>
        </div>
        """
      },
      %Variation{
        id: :trim,
        description: "Trim",
        template: """
        <div style="display: flex; flex-direction: column; gap: 12px;">
          <.text trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7); padding: 0 16px;">Without trim</.text>
          <.text trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7); padding: 0 16px;">With trim</.text>
        </div>
        """
      },
      %Variation{
        id: :trim_box_example,
        description: "Trim in box components",
        template: """
        <div style="display: flex; flex-direction: column; gap: 12px;">
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
        <div class="rt-Flex rt-r-max-w" style="--max-width: 300px">
          <.text truncate as="p">
            The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
          </.text>
        </div>
        """
      },
      %Variation{
        id: :wrap,
        description: "Wrap",
        template: """
        <div style="display: flex; flex-direction: column; gap: 12px;">
          <div style="max-width: 270px; border: 1px solid #ccc; padding: 10px;">
            <.text wrap="wrap">
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>
          <div style="max-width: 270px; border: 1px solid #ccc; padding: 10px; overflow-x: auto;">
            <.text wrap="nowrap">
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>
          <div style="max-width: 270px; border: 1px solid #ccc; padding: 10px;">
            <.text wrap="balance">
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>
          <div style="max-width: 270px; border: 1px solid #ccc; padding: 10px;">
            <.text wrap="pretty">
              The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.
            </.text>
          </div>
        </div>
        """
      },
      %VariationGroup{
        id: :colors,
        description: "Color",
        variations: [
          %Variation{
            id: :color_indigo,
            description: "Indigo",
            attributes: %{color: "indigo"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :color_cyan,
            description: "Cyan",
            attributes: %{color: "cyan"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :color_orange,
            description: "Orange",
            attributes: %{color: "orange"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          },
          %Variation{
            id: :color_crimson,
            description: "Crimson",
            attributes: %{color: "crimson"},
            slots: ["The quick brown fox jumps over the lazy dog."]
          }
        ]
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <div class="flex flex-col gap-2">
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
          Look, such a helpful <a href="#" class="text-blue-600 hover:underline">link</a>, an <em>italic emphasis</em>,
          a piece of computer <code class="bg-gray-100 px-1 py-0.5 rounded">code</code>, and even a hotkey combination
          <kbd class="bg-gray-100 border border-gray-300 rounded px-1 py-0.5 text-sm">⇧⌘A</kbd> within the text.
        </.text>
        """
      },
      %Variation{
        id: :with_form_controls,
        description: "With form controls",
        template: """
        <div style="max-width: 300px;">
          <.text as="label" size="3">
            <div style="display: flex; gap: 8px; align-items: flex-start;">
              <input type="checkbox" checked style="margin-top: 0.25em;" />
              <span>I understand that these documents are confidential and cannot be shared with a third party.</span>
            </div>
          </.text>
        </div>
        """
      }
    ]
  end
end
