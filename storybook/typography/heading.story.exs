defmodule EssenceUIWeb.Storybook.Typography.Heading do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Heading

  def function, do: &Heading.heading/1

  def container,
    do: {:div, "data-scaling": "100%", "data-radius": "medium", style: "display: block;", "data-gray-color": "slate"}

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}]

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default heading",
        attributes: %{size: "6", as: "h1"},
        slots: [
          """
          The quick brown fox jumps over the lazy dog
          """
        ]
      },
      %VariationGroup{
        id: :sizes,
        description: "All heading sizes",
        variations: [
          %Variation{
            id: :size_1,
            description: "Size 1",
            attributes: %{size: "1", as: "h6"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_2,
            description: "Size 2",
            attributes: %{size: "2", as: "h6"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_3,
            description: "Size 3",
            attributes: %{size: "3", as: "h6"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_4,
            description: "Size 4",
            attributes: %{size: "4", as: "h6"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_5,
            description: "Size 5",
            attributes: %{size: "5", as: "h5"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_6,
            description: "Size 6",
            attributes: %{size: "6", as: "h4"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_7,
            description: "Size 7",
            attributes: %{size: "7", as: "h3"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_8,
            description: "Size 8",
            attributes: %{size: "8", as: "h2"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          },
          %Variation{
            id: :size_9,
            description: "Size 9",
            attributes: %{size: "9", as: "h1"},
            slots: [
              """
              The quick brown fox jumps over the lazy dog
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :weights,
        description: "Font weights",
        variations: [
          %Variation{
            id: :weight_light,
            description: "Light weight",
            attributes: %{weight: "light"},
            slots: ["Light weight"]
          },
          %Variation{
            id: :weight_regular,
            description: "Regular weight",
            attributes: %{weight: "regular"},
            slots: ["Regular weight"]
          },
          %Variation{
            id: :weight_medium,
            description: "Medium weight",
            attributes: %{weight: "medium"},
            slots: ["Medium weight"]
          },
          %Variation{
            id: :weight_bold,
            description: "Bold weight",
            attributes: %{weight: "bold"},
            slots: ["Bold weight"]
          }
        ]
      },
      %Variation{
        id: :align,
        description: "Text alignment",
        template: """
        <div style="width: 100%">
          <.heading align="left">Left-aligned</.heading>
          <.heading align="center">Center-aligned</.heading>
          <.heading align="right">Right-aligned</.heading>
        </div>
        """
      },
      %Variation{
        id: :trim,
        description: "Trim leading space",
        template: """
        <div class="rt-Flex rt-r-fd-column rt-r-gap-3">
          <.heading trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">Without trim</.heading>
          <.heading trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">With trim</.heading>
        </div>
        """
      },
      %Variation{
        id: :truncate,
        description: "Truncate text",
        attributes: %{truncate: true, style: "max-width: 300px;"},
        slots: [
          """
          The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.
          """
        ]
      },
      %Variation{
        id: :wrap,
        description: "Text wrapping",
        attributes: %{},
        template: """
        <.flex max_width="300px" gap="5" direction="column">
          <.heading wrap="nowrap">The quick brown fox jumps over the lazy dog</.heading>
          <.heading wrap="balance">The quick brown fox jumps over the lazy dog</.heading>
          <.heading wrap="pretty">The quick brown fox jumps over the lazy dog</.heading>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Accent colors",
        attributes: %{},
        slots: [
          """
          <.heading color="indigo">Indigo</.heading>
          <.heading color="cyan">Cyan</.heading>
          <.heading color="orange">Orange</.heading>
          <.heading color="crimson">Crimson</.heading>
          """
        ]
      },
      %VariationGroup{
        id: :high_contrast,
        description: "High contrast",
        variations: [
          %Variation{
            id: :high_contrast_true,
            description: "High contrast false",
            attributes: %{color: "gray", high_contrast: false},
            slots: ["Low contrast"]
          },
          %Variation{
            id: :high_contrast_false,
            description: "High contrast true",
            attributes: %{color: "gray", high_contrast: true},
            slots: ["High contrast"]
          }
        ]
      }
    ]
  end
end
