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
      direction: nil,
      align: nil,
      justify: nil,
      wrap: nil,
      p: nil,
      m: nil,
      width: nil,
      height: nil,
      class: nil,
      inner_block: "<div>Flex content</div>"
    ]
  end

  def argTypes do
    [
      as: [type: :string, options: ["div", "span"], default: "div", description: "The element to render"],
      direction: [
        type: :string,
        options: [nil, "row", "column", "row-reverse", "column-reverse"],
        description: "Flex direction"
      ],
      align: [type: :string, options: [nil, "start", "center", "end", "baseline", "stretch"], description: "Align items"],
      justify: [type: :string, options: [nil, "start", "center", "end", "between"], description: "Justify content"],
      wrap: [type: :string, options: [nil, "nowrap", "wrap", "wrap-reverse"], description: "Flex wrap"],
      p: [type: :string, description: "Padding utility class (1-9)"],
      m: [type: :string, description: "Margin utility class (1-9)"],
      width: [type: :string, description: "Width utility class (full, auto, screen)"],
      height: [type: :string, description: "Height utility class (full, auto, screen)"],
      class: [type: :string, description: "Additional CSS classes"],
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
