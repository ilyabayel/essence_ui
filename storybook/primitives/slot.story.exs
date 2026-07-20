defmodule Storybook.Primitives.SlotStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Slot

  def function, do: &Slot.slot/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Prop composition with Slot",
        template: """
        <Slot.slot as="button" class="rt-Button rt-variant-solid rt-r-size-2">
          Composed Button
        </Slot.slot>
        """
      }
    ]
  end
end
