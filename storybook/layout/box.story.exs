defmodule Storybook.Layout.Box do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Box

  def function, do: &Box.box/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium", "data-gray-color": "slate"}

  def layout, do: :one_column

  def imports, do: [{EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default box",
        attributes: %{width: "64px", height: "64px"},
        slots: [
          """
          <.decoration_box height="64px" width="64px"/>
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
      },
      %Variation{
        id: :as_section,
        description: "As section with width and height",
        attributes: %{
          as: "section",
          width: "100%",
          height: "32"
        },
        slots: [
          """
          <.decoration_box height="64px"/>
          """
        ]
      }
    ]
  end
end
