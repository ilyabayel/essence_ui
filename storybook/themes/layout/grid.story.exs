defmodule Storybook.Themes.Layout.Grid do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Grid

  def function, do: &Grid.grid/1

  def imports, do: [{EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium", "data-gray-color": "slate"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "3 columns, gap 4",
        attributes: %{columns: "3", gap: "4"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          """
        ]
      },
      %Variation{
        id: :responsive,
        description: "Responsive columns (xs:1, sm:2, md:3, lg:4). Change browser width to see the effect.",
        attributes: %{columns: %{xs: "1", sm: "2", md: "3", lg: "4"}, gap: "3"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          """
        ]
      },
      %Variation{
        id: :with_gaps,
        description: "Different gap_x and gap_y",
        attributes: %{columns: "2", gap_x: "6", gap_y: "2"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
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
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          """
        ]
      }
    ]
  end
end
