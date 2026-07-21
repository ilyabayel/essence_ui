defmodule Storybook.Primitives.TooltipStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Tooltip

  def function, do: &Tooltip.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless tooltip primitive",
        template: """
        <div class="radix-demo" data-component="tooltip">
          <Tooltip.provider delay_duration={100}>
            <Tooltip.root id="tooltip-primitive" open_delay={100} close_delay={0}>
              <Tooltip.trigger id="tooltip-trigger" content_id="tooltip-content" class="IconButton">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
                  <path d="M7.5 1v13M1 7.5h13" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                </svg>
              </Tooltip.trigger>
              <Tooltip.content id="tooltip-content" class="TooltipContent" side_offset={5}>
                Add to library
                <Tooltip.arrow class="TooltipArrow" />
              </Tooltip.content>
            </Tooltip.root>
          </Tooltip.provider>
        </div>
        """
      }
    ]
  end
end
