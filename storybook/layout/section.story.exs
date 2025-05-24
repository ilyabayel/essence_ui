defmodule Storybook.Layout.Section do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Section

  def function, do: &Section.section/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium", "data-gray-color": "slate"}

  def layout, do: :one_column

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
