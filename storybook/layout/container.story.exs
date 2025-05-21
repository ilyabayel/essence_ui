defmodule EssenceUIWeb.Storybook.Layout.Container do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Container

  def function, do: &Container.container/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  def imports, do: [{EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def variations do
    [
      %Variation{
        id: :size_1,
        description: "Container with size 1",
        attributes: %{size: "1", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_2,
        description: "Container with size 2",
        attributes: %{size: "2", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_3,
        description: "Container with size 3",
        attributes: %{size: "3", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_4,
        description: "Container with size 4",
        attributes: %{size: "4", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      }
    ]
  end
end
