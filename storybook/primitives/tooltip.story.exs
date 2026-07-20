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
        <Tooltip.provider delay_duration={100}>
          <Tooltip.root id="tooltip-primitive" open_delay={100} close_delay={0}>
            <Tooltip.trigger id="tooltip-trigger" content_id="tooltip-content" style="padding: 6px 12px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
              Hover me
            </Tooltip.trigger>
            <Tooltip.content id="tooltip-content" style="background: #111; color: white; border-radius: 4px; padding: 6px 8px; font-size: 12px;">
              Add to library
              <Tooltip.arrow />
            </Tooltip.content>
          </Tooltip.root>
        </Tooltip.provider>
        """
      }
    ]
  end
end
