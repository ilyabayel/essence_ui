defmodule Storybook.Primitives.CollapsibleStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Collapsible

  def function, do: &Collapsible.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless collapsible primitive",
        template: """
        <div class="radix-demo" data-component="collapsible">
          <Collapsible.root id="collapsible-primitive" class="CollapsibleRoot">
            <div style="display: flex; align-items: center; justify-content: space-between;">
              <span class="Text" style="color: white;">@peduarte starred 3 repositories</span>
              <Collapsible.trigger id="collapsible-trigger" content_id="collapsible-content" class="IconButton" aria-label="Toggle">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
                  <path d="M3.5 5.5h8M3.5 9.5h8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                </svg>
              </Collapsible.trigger>
            </div>

            <div class="Repository">
              <span class="Text">@radix-ui/primitives</span>
            </div>

            <Collapsible.content id="collapsible-content">
              <div class="Repository">
                <span class="Text">@radix-ui/colors</span>
              </div>
              <div class="Repository">
                <span class="Text">@radix-ui/themes</span>
              </div>
            </Collapsible.content>
          </Collapsible.root>
        </div>
        """
      }
    ]
  end
end
