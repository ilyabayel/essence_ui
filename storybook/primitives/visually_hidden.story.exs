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
        id: :primitive,
        description: "Visually hidden but available to screen readers",
        template: """
        <div class="radix-demo" data-component="visually-hidden">
          <button class="Button violet" type="button">
            Save
            <VisuallyHidden.visually_hidden> the document</VisuallyHidden.visually_hidden>
          </button>
        </div>
        """
      }
    ]
  end
end
