defmodule Storybook.Primitives.MenubarStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Menubar

  def function, do: &Menubar.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless menubar primitive",
        template: """
        <Menubar.root id="menubar-primitive" style="display: flex; gap: 4px; border: 1px solid #ccc; border-radius: 6px; padding: 4px; background: white; width: fit-content;">
          <Menubar.menu value="file">
            <Menubar.trigger id="file-trigger" content_id="file-content" style="padding: 4px 10px; border: none; background: transparent; cursor: pointer; border-radius: 4px;">
              File
            </Menubar.trigger>
            <Menubar.content id="file-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 4px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 140px;">
              <Menubar.item style="padding: 6px 8px; cursor: pointer;">New</Menubar.item>
              <Menubar.item style="padding: 6px 8px; cursor: pointer;">Open</Menubar.item>
              <Menubar.separator style="height: 1px; background: #eee; margin: 4px 0;" />
              <Menubar.item style="padding: 6px 8px; cursor: pointer;">Exit</Menubar.item>
            </Menubar.content>
          </Menubar.menu>
          <Menubar.menu value="edit">
            <Menubar.trigger id="edit-trigger" content_id="edit-content" style="padding: 4px 10px; border: none; background: transparent; cursor: pointer; border-radius: 4px;">
              Edit
            </Menubar.trigger>
            <Menubar.content id="edit-content" style="background: white; border: 1px solid #ccc; border-radius: 6px; padding: 4px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 140px;">
              <Menubar.item style="padding: 6px 8px; cursor: pointer;">Undo</Menubar.item>
              <Menubar.item style="padding: 6px 8px; cursor: pointer;">Redo</Menubar.item>
            </Menubar.content>
          </Menubar.menu>
        </Menubar.root>
        """
      }
    ]
  end
end
