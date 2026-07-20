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
        <Popover.root id="popover-primitive">
          <Popover.trigger id="popover-trigger" content_id="popover-content" style="padding: 6px 12px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
            Open
          </Popover.trigger>
          <Popover.content id="popover-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 200px;">
            <p style="margin: 0 0 8px;">Popover content</p>
            <Popover.close style="padding: 4px 8px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
              Close
            </Popover.close>
            <Popover.arrow />
          </Popover.content>
        </Popover.root>
        """
      }
    ]
  end
end
