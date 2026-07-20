defmodule Storybook.Primitives.ToggleStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Toggle

  def function, do: &Toggle.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs toggle demo",
        template: """
        <div class="radix-demo" data-component="toggle">
          <Toggle.root id="toggle-italic" class="Toggle" aria-label="Toggle italic">
            <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M5.67494 3.50001C5.67494 3.27615 5.85646 3.09463 6.08032 3.09463H10.4197C10.6435 3.09463 10.8251 3.27615 10.8251 3.50001C10.8251 3.72387 10.6435 3.90539 10.4197 3.90539H8.56935L6.23062 11.0946H7.9197C8.14355 11.0946 8.32508 11.2762 8.32508 11.5C8.32508 11.7239 8.14355 11.9054 7.9197 11.9054H3.58032C3.35646 11.9054 3.17494 11.7239 3.17494 11.5C3.17494 11.2762 3.35646 11.0946 3.58032 11.0946H5.43066L7.76939 3.90539H6.08032C5.85646 3.90539 5.67494 3.72387 5.67494 3.50001Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
          </Toggle.root>
        </div>
        """
      }
    ]
  end
end
