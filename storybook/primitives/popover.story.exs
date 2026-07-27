defmodule Storybook.Primitives.PopoverStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Popover

  def function, do: &Popover.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "popover"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless popover primitive",
        template: """
        <Popover.root id="popover-primitive">
          <Popover.trigger
            id="popover-trigger"
            content_id="popover-content"
            class="DemoIconButton"
            aria-label="Update dimensions"
          >
            <svg
              width="15"
              height="15"
              viewBox="0 0 15 15"
              fill="none"
              aria-hidden="true"
            >
              <path
                d="M5.5 3v9M9.5 3v9M3 5.5h9M3 9.5h9"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
              />
            </svg>
          </Popover.trigger>
          <Popover.content
            id="popover-content"
            class="DemoPopoverContent"
            side_offset={5}
          >
            <div style="display: flex; flex-direction: column; gap: 10px;">
              <p
                class="DemoText"
                style="margin-bottom: 10px;"
              >
                Dimensions
              </p>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="popover-width"
                >
                  Width
                </label>
                <input
                  class="DemoInput"
                  id="popover-width"
                  value="100%"
                />
              </fieldset>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="popover-maxWidth"
                >
                  Max. width
                </label>
                <input
                  class="DemoInput"
                  id="popover-maxWidth"
                  value="300px"
                />
              </fieldset>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="popover-height"
                >
                  Height
                </label>
                <input
                  class="DemoInput"
                  id="popover-height"
                  value="25px"
                />
              </fieldset>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="popover-maxHeight"
                >
                  Max. height
                </label>
                <input
                  class="DemoInput"
                  id="popover-maxHeight"
                  value="none"
                />
              </fieldset>
            </div>
            <Popover.close
              class="DemoPopoverClose"
              aria-label="Close"
            >
              ×
            </Popover.close>
            <Popover.arrow class="DemoPopoverArrow" />
          </Popover.content>
        </Popover.root>
        """
      }
    ]
  end
end
