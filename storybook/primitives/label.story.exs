defmodule Storybook.Primitives.LabelStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Label

  def function, do: &Label.label/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless label primitive",
        template: """
        <Label.label for="input-1">First Name</Label.label>
        <input id="input-1" type="text" />
        """
      }
    ]
  end
end
