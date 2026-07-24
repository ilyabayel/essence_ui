defmodule Storybook.Primitives.LabelStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Label

  def function, do: &Label.label/1

  def container, do: {:div, class: "radix-demo", "data-component": "label"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs label demo",
        template: """
        <div style="display: flex; padding: 0 20px; flex-wrap: wrap; gap: 15px; align-items: center;">
          <Label.label
            id="label-first-name"
            class="LabelRoot"
            for="firstName"
          >
            First Name
          </Label.label>
          <input
            class="Input"
            type="text"
            id="firstName"
            value="Pedro Duarte"
          />
        </div>
        """
      }
    ]
  end
end
