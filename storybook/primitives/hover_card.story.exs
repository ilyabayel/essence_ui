defmodule Storybook.Primitives.HoverCardStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.HoverCard

  def function, do: &HoverCard.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless hover card primitive",
        template: """
        <div class="radix-demo" data-component="hover-card">
          <HoverCard.root id="hover-card-primitive" open_delay={100} close_delay={100}>
            <HoverCard.trigger id="hover-card-trigger" content_id="hover-card-content">
              <a
                class="ImageTrigger"
                href="https://twitter.com/radix_ui"
                target="_blank"
                rel="noreferrer noopener"
              >
                <img
                  class="Image normal"
                  src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png"
                  alt="Radix UI"
                />
              </a>
            </HoverCard.trigger>
            <HoverCard.content id="hover-card-content" class="HoverCardContent" side_offset={5}>
              <div style="display: flex; flex-direction: column; gap: 7px;">
                <img
                  class="Image large"
                  src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png"
                  alt="Radix UI"
                />
                <div style="display: flex; flex-direction: column; gap: 15px;">
                  <div>
                    <div class="Text bold">Radix</div>
                    <div class="Text faded">@radix_ui</div>
                  </div>
                  <div class="Text">
                    Components, icons, colors, and templates for building high-quality, accessible UI. Free and open-source.
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
        </div>
        """
      }
    ]
  end
end
