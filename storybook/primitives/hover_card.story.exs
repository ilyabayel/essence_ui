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
        <HoverCard.root id="hover-card-primitive" open_delay={100} close_delay={100}>
          <HoverCard.trigger id="hover-card-trigger" content_id="hover-card-content" style="display: inline-flex; color: #2563eb; text-decoration: underline; cursor: default;">
            @radix-ui
          </HoverCard.trigger>
          <HoverCard.content id="hover-card-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 220px;">
            <strong>Radix UI</strong>
            <p style="margin: 4px 0 0;">Component primitives for the web.</p>
            <HoverCard.arrow />
          </HoverCard.content>
        </HoverCard.root>
        """
      }
    ]
  end
end
