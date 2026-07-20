defmodule Storybook.Primitives.ContextMenuStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.ContextMenu

  def function, do: &ContextMenu.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless context menu primitive",
        template: """
        <ContextMenu.root id="context-primitive">
          <ContextMenu.trigger id="context-trigger" content_id="context-content" style="display: flex; align-items: center; justify-content: center; height: 120px; border: 1px dashed #ccc; border-radius: 6px; color: #666; user-select: none;">
            Right click here
          </ContextMenu.trigger>
          <ContextMenu.content id="context-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 4px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 160px;">
            <ContextMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="back">Back</ContextMenu.item>
            <ContextMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="forward">Forward</ContextMenu.item>
            <ContextMenu.separator style="height: 1px; background: #eee; margin: 4px 0;" />
            <ContextMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="reload">Reload</ContextMenu.item>
          </ContextMenu.content>
        </ContextMenu.root>
        """
      }
    ]
  end
end
