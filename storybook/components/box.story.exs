defmodule EssenceUIWeb.Storybook.Components.Box do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Box

  def function, do: &Box.box/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  def args do
    [
      as: "div",
      p: nil,
      pt: nil,
      pr: nil,
      pb: nil,
      pl: nil,
      px: nil,
      py: nil,
      m: nil,
      mt: nil,
      mr: nil,
      mb: nil,
      ml: nil,
      mx: nil,
      my: nil,
      width: nil,
      height: nil,
      class: nil,
      inner_block: "Box content"
    ]
  end

  def argTypes do
    [
      as: [
        type: :string,
        options: ["div", "section", "article", "nav", "aside"],
        default: "div",
        description: "The element to render"
      ],
      p: [type: :string, description: "Padding utility class (1-9)"],
      pt: [type: :string, description: "Padding top"],
      pr: [type: :string, description: "Padding right"],
      pb: [type: :string, description: "Padding bottom"],
      pl: [type: :string, description: "Padding left"],
      px: [type: :string, description: "Padding X axis"],
      py: [type: :string, description: "Padding Y axis"],
      m: [type: :string, description: "Margin utility class (1-9)"],
      mt: [type: :string, description: "Margin top"],
      mr: [type: :string, description: "Margin right"],
      mb: [type: :string, description: "Margin bottom"],
      ml: [type: :string, description: "Margin left"],
      mx: [type: :string, description: "Margin X axis"],
      my: [type: :string, description: "Margin Y axis"],
      width: [type: :string, description: "Width utility class (full, auto, screen)"],
      height: [type: :string, description: "Height utility class (full, auto, screen)"],
      class: [type: :string, description: "Additional CSS classes"],
      inner_block: [type: :string, description: "Box content"]
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default box",
        attributes: %{width: "64px", height: "64px"},
        slots: [
          """
          <div class="rt-Box rt-r-h" style="--height: 100%; background-color: var(--gray-a3); background-clip: padding-box; border: 1px solid var(--gray-a5); border-radius: var(--radius-1); background-image: url(&quot;data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%239C92AC' fill-opacity='0.2' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E&quot;);"></div>
          """
        ]
      }
      # %Variation{
      #   id: :padding_margin,
      #   description: "With padding and margin",
      #   attributes: %{p: "4", m: "2"},
      #   slots: ["Box with padding and margin"]
      # },
      # %Variation{
      #   id: :as_section,
      #   description: "As section with width and height",
      #   attributes: %{as: "section", width: "full", height: "32"},
      #   slots: ["Section Box"]
      # },
      # %Variation{
      #   id: :custom_class,
      #   description: "With custom class",
      #   attributes: %{class: "rounded shadow", p: "3"},
      #   slots: ["Custom class Box"]
      # }
    ]
  end
end
