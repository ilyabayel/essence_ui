defmodule Storybook.Primitives.DirectionProviderStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.DirectionProvider

  def function, do: &DirectionProvider.direction_provider/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :rtl,
        attributes: %{dir: "rtl"},
        slots: ["Right to left"]
      }
    ]
  end
end
