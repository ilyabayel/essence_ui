defmodule Storybook.Primitives.VisuallyHiddenStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.VisuallyHidden

  def function, do: &VisuallyHidden.visually_hidden/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Screen reader text"]
      }
    ]
  end
end
