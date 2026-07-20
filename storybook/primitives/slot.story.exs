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
        <div class="radix-demo" data-component="slot">
          <Slot.slot as="button" class="Button violet">
            Composed Button
          </Slot.slot>
        </div>
        """
      }
    ]
  end
end
