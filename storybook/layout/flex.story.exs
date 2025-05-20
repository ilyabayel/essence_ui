defmodule EssenceUIWeb.Storybook.Layout.Flex do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Flex

  @square """
  <.box width="64px" height="64px" style="background-color: var(--gray-a3); background-clip: padding-box; border: 1px solid var(--gray-a5); border-radius: var(--radius-1); background-image: url('data:image/svg+xml,%3Csvg width=\\'6\\' height=\\'6\\' viewBox=\\'0 0 6 6\\' xmlns=\\'http://www.w3.org/2000/svg\\'%3E%3Cg fill=\\'%239C92AC\\' fill-opacity=\\'0.2\\' fill-rule=\\'evenodd\\'%3E%3Cpath d=\\'M5 0h1L0 6V5zM6 5v1H5z\\'/%3E%3C/g%3E%3C/svg%3E'); background-size: 6px 6px;"></.box>
  """

  @rectangle """
  <.box width="180px" height="64px" style="background-color: var(--gray-a3); background-clip: padding-box; border: 1px solid var(--gray-a5); border-radius: var(--radius-1); background-image: url('data:image/svg+xml,%3Csvg width=\\'6\\' height=\\'6\\' viewBox=\\'0 0 6 6\\' xmlns=\\'http://www.w3.org/2000/svg\\'%3E%3Cg fill=\\'%239C92AC\\' fill-opacity=\\'0.2\\' fill-rule=\\'evenodd\\'%3E%3Cpath d=\\'M5 0h1L0 6V5zM6 5v1H5z\\'/%3E%3C/g%3E%3C/svg%3E'); background-size: 6px 6px;"></.box>
  """

  def function, do: &Flex.flex/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Box, box: 1}]

  def args do
    [
      as: "div",
      display: nil,
      direction: nil,
      align: nil,
      justify: nil,
      wrap: nil,
      gap: nil,
      gap_x: nil,
      gap_y: nil,
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
      min_width: nil,
      max_width: nil,
      height: nil,
      min_height: nil,
      max_height: nil,
      flex_basis: nil,
      flex_shrink: nil,
      flex_grow: nil,
      class: nil,
      style: nil,
      rest: nil,
      as_child: nil,
      inner_block: "<div>Flex content</div>"
    ]
  end

  def argTypes do
    [
      as: [type: :string, options: ["div", "span"], default: "div", description: "The element to render"],
      display: [type: :string, options: [nil, "none", "inline-flex", "flex"], description: "CSS display property"],
      direction: [
        type: :string,
        options: [nil, "row", "column", "row-reverse", "column-reverse"],
        description: "Flex direction"
      ],
      align: [type: :string, options: [nil, "start", "center", "end", "baseline", "stretch"], description: "Align items"],
      justify: [type: :string, options: [nil, "start", "center", "end", "between"], description: "Justify content"],
      wrap: [type: :string, options: [nil, "nowrap", "wrap", "wrap-reverse"], description: "Flex wrap"],
      gap: [type: :string, description: "Gap utility for flex/grid layouts (theme scale)"],
      gap_x: [type: :string, description: "Gap X axis utility (theme scale)"],
      gap_y: [type: :string, description: "Gap Y axis utility (theme scale)"],
      p: [type: :string, description: "Padding utility class (theme scale)"],
      pt: [type: :string, description: "Padding top"],
      pr: [type: :string, description: "Padding right"],
      pb: [type: :string, description: "Padding bottom"],
      pl: [type: :string, description: "Padding left"],
      px: [type: :string, description: "Padding X axis"],
      py: [type: :string, description: "Padding Y axis"],
      m: [type: :string, description: "Margin utility class (theme scale)"],
      mt: [type: :string, description: "Margin top"],
      mr: [type: :string, description: "Margin right"],
      mb: [type: :string, description: "Margin bottom"],
      ml: [type: :string, description: "Margin left"],
      mx: [type: :string, description: "Margin X axis"],
      my: [type: :string, description: "Margin Y axis"],
      width: [type: :string, description: "Width utility class or value"],
      min_width: [type: :string, description: "Min width utility class or value"],
      max_width: [type: :string, description: "Max width utility class or value"],
      height: [type: :string, description: "Height utility class or value"],
      min_height: [type: :string, description: "Min height utility class or value"],
      max_height: [type: :string, description: "Max height utility class or value"],
      flex_basis: [type: :string, description: "Flex basis utility"],
      flex_shrink: [type: :string, options: [nil, "0", "1"], description: "Flex shrink utility"],
      flex_grow: [type: :string, options: [nil, "0", "1"], description: "Flex grow utility"],
      class: [type: :string, description: "Additional CSS classes"],
      style: [type: :string, description: "Additional inline styles"],
      rest: [type: :any, description: "Additional HTML attributes"],
      as_child: [
        type: :boolean,
        description: "Composes the component into its immediate child instead of rendering its own HTML element"
      ],
      inner_block: [type: :string, description: "Flex content"]
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default flex",
        attributes: %{direction: "row", align: "center", justify: "center", gap: "2"},
        slots: [
          """
          #{@square}
          #{@square}
          #{@square}
          """
        ]
      },
      %Variation{
        id: :column,
        description: "Column direction",
        attributes: %{direction: "column", align: "stretch", justify: "start", gap: "2"},
        slots: [
          """
          #{@square}
          #{@square}
          #{@square}
          """
        ]
      },
      %Variation{
        id: :wrap,
        description: "Wrap items",
        attributes: %{wrap: "wrap", width: "calc(360px + 8px)", height: "32", gap: "2"},
        slots: [
          """
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          """
        ]
      },
      %Variation{
        id: :different_gaps_x_y,
        description: "With different gaps for X and Y axis",
        attributes: %{wrap: "wrap", width: "calc(360px + 8px * 2)", height: "32", gap_x: "2", gap_y: "6"},
        slots: [
          """
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          #{@rectangle}
          """
        ]
      }
    ]
  end
end
