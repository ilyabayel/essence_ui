defmodule Storybook.Primitives.PopoverStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Popover

  def function, do: &Popover.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless popover primitive",
        template: """
        <div class="radix-demo" data-component="popover">
          <Popover.root id="popover-primitive">
            <Popover.trigger id="popover-trigger" content_id="popover-content" class="IconButton" aria-label="Update dimensions">
              <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
                <path d="M5.5 3v9M9.5 3v9M3 5.5h9M3 9.5h9" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
              </svg>
            </Popover.trigger>
            <Popover.content id="popover-content" class="PopoverContent" side_offset={5}>
              <div style="display: flex; flex-direction: column; gap: 10px;">
                <p class="Text" style="margin-bottom: 10px;">Dimensions</p>
                <fieldset class="Fieldset">
                  <label class="Label" for="popover-width">Width</label>
                  <input class="Input" id="popover-width" value="100%" />
                </fieldset>
                <fieldset class="Fieldset">
                  <label class="Label" for="popover-maxWidth">Max. width</label>
                  <input class="Input" id="popover-maxWidth" value="300px" />
                </fieldset>
                <fieldset class="Fieldset">
                  <label class="Label" for="popover-height">Height</label>
                  <input class="Input" id="popover-height" value="25px" />
                </fieldset>
                <fieldset class="Fieldset">
                  <label class="Label" for="popover-maxHeight">Max. height</label>
                  <input class="Input" id="popover-maxHeight" value="none" />
                </fieldset>
              </div>
              <Popover.close class="PopoverClose" aria-label="Close">×</Popover.close>
              <Popover.arrow class="PopoverArrow" />
            </Popover.content>
          </Popover.root>
        </div>
        """
      }
    ]
  end
end
