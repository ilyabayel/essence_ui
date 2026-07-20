defmodule Storybook.Primitives.DropdownMenuStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.DropdownMenu

  def function, do: &DropdownMenu.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless dropdown menu primitive",
        template: """
        <DropdownMenu.root id="dropdown-primitive">
          <DropdownMenu.trigger id="dropdown-trigger" content_id="dropdown-content" style="padding: 6px 12px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
            Open
          </DropdownMenu.trigger>
          <DropdownMenu.content id="dropdown-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 4px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 180px;">
            <DropdownMenu.label style="padding: 6px 8px; font-size: 12px; color: #666;">Actions</DropdownMenu.label>
            <DropdownMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="new tab">New Tab</DropdownMenu.item>
            <DropdownMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="new window">New Window</DropdownMenu.item>
            <DropdownMenu.separator style="height: 1px; background: #eee; margin: 4px 0;" />
            <DropdownMenu.checkbox_item checked style="padding: 6px 8px; cursor: pointer;">
              <DropdownMenu.item_indicator force_mount>✓</DropdownMenu.item_indicator>
              Show Bookmarks
            </DropdownMenu.checkbox_item>
            <DropdownMenu.item style="padding: 6px 8px; cursor: pointer;" text_value="close">Close</DropdownMenu.item>
          </DropdownMenu.content>
        </DropdownMenu.root>
        """
      }
    ]
  end
end
