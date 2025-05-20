defmodule EssenceUIWeb.Storybook.Layout.Section do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Section

  def function, do: &Section.section/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  @spec args() :: [{atom(), nil | <<_::24, _::_*64>>}, ...]
  def args do
    [
      as_child: false,
      p: nil,
      m: nil,
      mx: nil,
      my: nil,
      width: nil,
      min_width: nil,
      max_width: nil,
      height: nil,
      min_height: nil,
      max_height: nil,
      position: nil,
      inset: nil,
      top: nil,
      right: nil,
      bottom: nil,
      left: nil,
      overflow: nil,
      overflow_x: nil,
      overflow_y: nil,
      flex_basis: nil,
      flex_shrink: nil,
      flex_grow: nil,
      grid_area: nil,
      grid_column: nil,
      grid_column_start: nil,
      grid_column_end: nil,
      grid_row: nil,
      grid_row_start: nil,
      grid_row_end: nil,
      class: nil,
      style: nil,
      rest: nil,
      inner_block: "Section content"
    ]
  end

  def argTypes do
    [
      as_child: [type: :boolean, default: false, description: "Composes into child instead of rendering <section>"],
      p: [type: :string, description: "Padding utility class (theme scale)"],
      m: [type: :string, description: "Margin utility class (theme scale)"],
      mx: [type: :string, description: "Margin X axis"],
      my: [type: :string, description: "Margin Y axis"],
      width: [type: :string, description: "Width utility class or value"],
      min_width: [type: :string, description: "Min width utility class or value"],
      max_width: [type: :string, description: "Max width utility class or value"],
      height: [type: :string, description: "Height utility class or value"],
      min_height: [type: :string, description: "Min height utility class or value"],
      max_height: [type: :string, description: "Max height utility class or value"],
      position: [
        type: :string,
        options: [nil, "static", "relative", "absolute", "fixed", "sticky"],
        description: "CSS position property"
      ],
      inset: [type: :string, description: "Inset utility (theme scale)"],
      top: [type: :string, description: "Top edge utility (theme scale)"],
      right: [type: :string, description: "Right edge utility (theme scale)"],
      bottom: [type: :string, description: "Bottom edge utility (theme scale)"],
      left: [type: :string, description: "Left edge utility (theme scale)"],
      overflow: [
        type: :string,
        options: [nil, "visible", "hidden", "clip", "scroll", "auto"],
        description: "CSS overflow property"
      ],
      overflow_x: [
        type: :string,
        options: [nil, "visible", "hidden", "clip", "scroll", "auto"],
        description: "CSS overflow-x property"
      ],
      overflow_y: [
        type: :string,
        options: [nil, "visible", "hidden", "clip", "scroll", "auto"],
        description: "CSS overflow-y property"
      ],
      flex_basis: [type: :string, description: "Flex basis utility"],
      flex_shrink: [type: :string, options: [nil, "0", "1"], description: "Flex shrink utility"],
      flex_grow: [type: :string, options: [nil, "0", "1"], description: "Flex grow utility"],
      grid_area: [type: :string, description: "Grid area utility"],
      grid_column: [type: :string, description: "Grid column utility"],
      grid_column_start: [type: :string, description: "Grid column start utility"],
      grid_column_end: [type: :string, description: "Grid column end utility"],
      grid_row: [type: :string, description: "Grid row utility"],
      grid_row_start: [type: :string, description: "Grid row start utility"],
      grid_row_end: [type: :string, description: "Grid row end utility"],
      class: [type: :string, description: "Additional CSS classes"],
      style: [type: :string, description: "Additional inline styles"],
      rest: [type: :any, description: "Additional HTML attributes"],
      inner_block: [type: :string, description: "Section content"]
    ]
  end

  def imports, do: [{EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default section",
        attributes: %{width: "100%"},
        slots: [
          """
          <.decoration_box height="64px"/>
          """
        ]
      },
      %Variation{
        id: :padding_margin,
        description: "With padding and margin",
        attributes: %{p: "4", m: "2", style: "border: 1px solid var(--color-overlay); border-radius: var(--radius-1);"},
        slots: [
          """
          <.decoration_box height="64px" width="calc(64px * 3)"/>
          """
        ]
      }
    ]
  end
end
