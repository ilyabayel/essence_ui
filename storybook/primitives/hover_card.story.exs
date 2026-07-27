defmodule Storybook.Primitives.HoverCardStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.HoverCard

  def function, do: &HoverCard.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "hover-card"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless hover card primitive",
        template: """
        <HoverCard.root
          id="hover-card-primitive"
          open_delay={100}
          close_delay={100}
        >
          <HoverCard.trigger
            id="hover-card-trigger"
            content_id="hover-card-content"
          >
            <a
              class="ImageTrigger"
              href="https://github.com/ilyabayel/essence_ui"
              target="_blank"
              rel="noreferrer noopener"
            >
              <img
                class="Image normal"
                src="https://github.com/ilyabayel.png"
                alt="Essence UI"
              />
            </a>
          </HoverCard.trigger>
          <HoverCard.content
            id="hover-card-content"
            class="HoverCardContent"
            side_offset={5}
          >
            <div style="display: flex; flex-direction: column; gap: 7px;">
              <img
                class="Image large"
                src="https://github.com/ilyabayel.png"
                alt="Essence UI"
              />
              <div style="display: flex; flex-direction: column; gap: 15px;">
                <div>
                  <div class="Text bold">Essence UI</div>
                  <div class="Text faded">@essence_ui</div>
                </div>
                <div class="Text">
                  Accessible, themeable Phoenix LiveView components. Free and open-source.
                </div>
                <div style="display: flex; gap: 15px;">
                  <div style="display: flex; gap: 5px;">
                    <div class="Text bold">0</div>
                    <div class="Text faded">Following</div>
                  </div>
                  <div style="display: flex; gap: 5px;">
                    <div class="Text bold">2,900</div>
                    <div class="Text faded">Followers</div>
                  </div>
                </div>
              </div>
            </div>
            <HoverCard.arrow class="HoverCardArrow" />
          </HoverCard.content>
        </HoverCard.root>
        """
      }
    ]
  end
end
