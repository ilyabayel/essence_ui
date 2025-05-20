defmodule EssenceUIWeb.Storybook.Layout.Grid do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Grid

  @square """
  <.box width="64px" height="64px" style="background-color: var(--gray-a3); background-clip: padding-box; border: 1px solid var(--gray-a5); border-radius: var(--radius-1); background-image: url('data:image/svg+xml,%3Csvg width=\\'6\\' height=\\'6\\' viewBox=\\'0 0 6 6\\' xmlns=\\'http://www.w3.org/2000/svg\\'%3E%3Cg fill=\\'%239C92AC\\' fill-opacity=\\'0.2\\' fill-rule=\\'evenodd\\'%3E%3Cpath d=\\'M5 0h1L0 6V5zM6 5v1H5z\\'/%3E%3C/g%3E%3C/svg%3E'); background-size: 6px 6px;"></.box>
  """

  def function, do: &Grid.grid/1

  def imports, do: [{EssenceUI.Components.Box, box: 1}]

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  def args do
    [
      as: "div",
      columns: "3",
      gap: "4",
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
      class: nil,
      style: nil,
      rest: nil,
      as_child: nil,
      inner_block: """
        <div style=\"background:var(--gray-a3);padding:8px;text-align:center\">1</div>
        <div style=\"background:var(--gray-a3);padding:8px;text-align:center\">2</div>
        <div style=\"background:var(--gray-a3);padding:8px;text-align:center\">3</div>
      """
    ]
  end

  def argTypes do
    [
      as: [type: :string, options: ["div", "span"], default: "div", description: "The element to render"],
      columns: [
        type: :string,
        options: Enum.map(1..12, &Integer.to_string/1),
        description: "Number of columns in the grid (1-12) or responsive map"
      ],
      gap: [type: :string, description: "Gap utility for grid layouts (theme scale)"],
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
      class: [type: :string, description: "Additional CSS classes"],
      style: [type: :string, description: "Additional inline styles"],
      rest: [type: :any, description: "Additional HTML attributes"],
      as_child: [
        type: :boolean,
        description: "Composes the component into its immediate child instead of rendering its own HTML element"
      ],
      inner_block: [type: :string, description: "Grid content"]
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "3 columns, gap 4",
        attributes: %{columns: "3", gap: "4"},
        slots: [
          """
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          """
        ]
      },
      %Variation{
        id: :responsive,
        description: "Responsive columns (xs:1, sm:2, md:3, lg:4). Change browser width to see the effect.",
        attributes: %{columns: %{xs: "1", sm: "2", md: "3", lg: "4"}, gap: "3"},
        slots: [
          """
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          """
        ]
      },
      %Variation{
        id: :with_gaps,
        description: "Different gap_x and gap_y",
        attributes: %{columns: "2", gap_x: "6", gap_y: "2"},
        slots: [
          """
          #{@square}
          #{@square}
          #{@square}
          #{@square}
          """
        ]
      },
      %Variation{
        id: :with_padding_margin,
        description: "With padding and margin",
        attributes: %{
          columns: "2",
          gap: "2",
          p: "4",
          m: "2",
          style: "border: 1px solid var(--color-overlay); border-radius: var(--radius-1);"
        },
        slots: [
          """
          #{@square}
          #{@square}
          """
        ]
      }
    ]
  end
end
