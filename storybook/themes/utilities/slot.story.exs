defmodule Storybook.Themes.Utilities.Slot do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Utilities.Slot

  def layout, do: :one_column

  def function, do: &Slot.slot/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Prop composition with Slot",
        template: """
        <.slot as="button" class="rt-Button rt-variant-solid rt-r-size-2">
          Composed Button
        </.slot>
        """
      }
    ]
  end
end
