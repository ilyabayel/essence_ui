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
        description: "Radix docs context menu demo",
        template: """
        <div class="radix-demo" data-component="context-menu">
          <ContextMenu.root id="context-primitive">
            <ContextMenu.trigger id="context-trigger" content_id="context-content" class="ContextMenuTrigger">
              Right-click here.
            </ContextMenu.trigger>
            <ContextMenu.content id="context-content" class="ContextMenuContent">
              <ContextMenu.item class="ContextMenuItem" text_value="Back">
                Back <div class="RightSlot">⌘+[</div>
              </ContextMenu.item>
              <ContextMenu.item class="ContextMenuItem" disabled text_value="Forward">
                Forward <div class="RightSlot">⌘+]</div>
              </ContextMenu.item>
              <ContextMenu.item class="ContextMenuItem" text_value="Reload">
                Reload <div class="RightSlot">⌘+R</div>
              </ContextMenu.item>
              <ContextMenu.sub>
                <ContextMenu.sub_trigger class="ContextMenuSubTrigger" text_value="More Tools">
                  More Tools
                  <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                </ContextMenu.sub_trigger>
                <ContextMenu.sub_content class="ContextMenuSubContent" side_offset={2}>
                  <ContextMenu.item class="ContextMenuItem" text_value="Save Page As">
                    Save Page As… <div class="RightSlot">⌘+S</div>
                  </ContextMenu.item>
                  <ContextMenu.item class="ContextMenuItem" text_value="Create Shortcut">Create Shortcut…</ContextMenu.item>
                  <ContextMenu.item class="ContextMenuItem" text_value="Name Window">Name Window…</ContextMenu.item>
                  <ContextMenu.separator class="ContextMenuSeparator" />
                  <ContextMenu.item class="ContextMenuItem" text_value="Developer Tools">Developer Tools</ContextMenu.item>
                </ContextMenu.sub_content>
              </ContextMenu.sub>

              <ContextMenu.separator class="ContextMenuSeparator" />

              <ContextMenu.checkbox_item class="ContextMenuCheckboxItem" checked text_value="Show Bookmarks">
                <ContextMenu.item_indicator class="ContextMenuItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></ContextMenu.item_indicator>
                Show Bookmarks <div class="RightSlot">⌘+B</div>
              </ContextMenu.checkbox_item>
              <ContextMenu.checkbox_item class="ContextMenuCheckboxItem" text_value="Show Full URLs">
                <ContextMenu.item_indicator class="ContextMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></ContextMenu.item_indicator>
                Show Full URLs
              </ContextMenu.checkbox_item>

              <ContextMenu.separator class="ContextMenuSeparator" />

              <ContextMenu.label class="ContextMenuLabel">People</ContextMenu.label>
              <ContextMenu.radio_group value="pedro">
                <ContextMenu.radio_item class="ContextMenuRadioItem" value="pedro" checked>
                  <ContextMenu.item_indicator class="ContextMenuItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></ContextMenu.item_indicator>
                  Pedro Duarte
                </ContextMenu.radio_item>
                <ContextMenu.radio_item class="ContextMenuRadioItem" value="colm">
                  <ContextMenu.item_indicator class="ContextMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></ContextMenu.item_indicator>
                  Colm Tuite
                </ContextMenu.radio_item>
              </ContextMenu.radio_group>
            </ContextMenu.content>
          </ContextMenu.root>
        </div>
        """
      }
    ]
  end
end
