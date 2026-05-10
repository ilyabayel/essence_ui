defmodule Storybook.Layout.Flex do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Flex

  def function, do: &Flex.flex/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium", "data-gray-color": "slate"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Box, box: 1}, {EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default flex",
        attributes: %{direction: "row", align: "center", justify: "center", gap: "2"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          """
        ]
      },
      %Variation{
        id: :column,
        description: "Column direction",
        attributes: %{direction: "column", align: "stretch", justify: "start", gap: "2"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          <.decoration_box height="64px" width="64px"/>
          """
        ]
      },
      %Variation{
        id: :jusify,
        description: "Column direction",
        template: """
        <div style="display: relative; width: 50vh;">
          <.flex justify="start">
            <.decoration_box height="64px" width="64px"/>
            <.decoration_box height="64px" width="64px"/>
          </.flex>
          <.flex justify="center">
            <.decoration_box height="64px" width="64px"/>
            <.decoration_box height="64px" width="64px"/>
          </.flex>
          <.flex justify="space-between">
            <.decoration_box height="64px" width="64px"/>
            <.decoration_box height="64px" width="64px"/>
          </.flex>
          <.flex justify="end">
            <.decoration_box height="64px" width="64px"/>
            <.decoration_box height="64px" width="64px"/>
          </.flex>
        </div>
        """
      },
      %Variation{
        id: :wrap,
        description: "Wrap items",
        attributes: %{wrap: "wrap", width: "calc(360px + 8px)", height: "32", gap: "2"},
        slots: [
          """
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          """
        ]
      },
      %Variation{
        id: :different_gaps_x_y,
        description: "With different gaps for X and Y axis",
        attributes: %{wrap: "wrap", width: "calc(360px + 8px * 2)", height: "32", gap_x: "2", gap_y: "6"},
        slots: [
          """
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          <.decoration_box height="64px"/>
          """
        ]
      }
    ]
  end
end
