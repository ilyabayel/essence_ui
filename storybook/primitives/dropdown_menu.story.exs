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
        description: "Radix docs dropdown menu demo",
        template: """
        <div class="radix-demo" data-component="dropdown-menu">
          <DropdownMenu.root id="dropdown-primitive">
            <DropdownMenu.trigger id="dropdown-trigger" content_id="dropdown-content" class="IconButton" aria-label="Customise options">
              <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M1.5 3C1.22386 3 1 3.22386 1 3.5C1 3.77614 1.22386 4 1.5 4H13.5C13.7761 4 14 3.77614 14 3.5C14 3.22386 13.7761 3 13.5 3H1.5ZM1 7.5C1 7.22386 1.22386 7 1.5 7H13.5C13.7761 7 14 7.22386 14 7.5C14 7.77614 13.7761 8 13.5 8H1.5C1.22386 8 1 7.77614 1 7.5ZM1 11.5C1 11.2239 1.22386 11 1.5 11H13.5C13.7761 11 14 11.2239 14 11.5C14 11.7761 13.7761 12 13.5 12H1.5C1.22386 12 1 11.7761 1 11.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
            </DropdownMenu.trigger>
            <DropdownMenu.content id="dropdown-content" class="DropdownMenuContent" side_offset={5}>
              <DropdownMenu.item class="DropdownMenuItem" text_value="New Tab">
                New Tab <div class="RightSlot">⌘+T</div>
              </DropdownMenu.item>
              <DropdownMenu.item class="DropdownMenuItem" text_value="New Window">
                New Window <div class="RightSlot">⌘+N</div>
              </DropdownMenu.item>
              <DropdownMenu.item class="DropdownMenuItem" disabled text_value="New Private Window">
                New Private Window <div class="RightSlot">⇧+⌘+N</div>
              </DropdownMenu.item>
              <DropdownMenu.sub>
                <DropdownMenu.sub_trigger class="DropdownMenuSubTrigger" text_value="More Tools">
                  More Tools
                  <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                </DropdownMenu.sub_trigger>
                <DropdownMenu.sub_content class="DropdownMenuSubContent" side_offset={2}>
                  <DropdownMenu.item class="DropdownMenuItem" text_value="Save Page As">
                    Save Page As… <div class="RightSlot">⌘+S</div>
                  </DropdownMenu.item>
                  <DropdownMenu.item class="DropdownMenuItem" text_value="Create Shortcut">Create Shortcut…</DropdownMenu.item>
                  <DropdownMenu.item class="DropdownMenuItem" text_value="Name Window">Name Window…</DropdownMenu.item>
                  <DropdownMenu.separator class="DropdownMenuSeparator" />
                  <DropdownMenu.item class="DropdownMenuItem" text_value="Developer Tools">Developer Tools</DropdownMenu.item>
                </DropdownMenu.sub_content>
              </DropdownMenu.sub>

              <DropdownMenu.separator class="DropdownMenuSeparator" />

              <DropdownMenu.checkbox_item class="DropdownMenuCheckboxItem" checked text_value="Show Bookmarks">
                <DropdownMenu.item_indicator class="DropdownMenuItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></DropdownMenu.item_indicator>
                Show Bookmarks <div class="RightSlot">⌘+B</div>
              </DropdownMenu.checkbox_item>
              <DropdownMenu.checkbox_item class="DropdownMenuCheckboxItem" text_value="Show Full URLs">
                <DropdownMenu.item_indicator class="DropdownMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></DropdownMenu.item_indicator>
                Show Full URLs
              </DropdownMenu.checkbox_item>

              <DropdownMenu.separator class="DropdownMenuSeparator" />

              <DropdownMenu.label class="DropdownMenuLabel">People</DropdownMenu.label>
              <DropdownMenu.radio_group value="pedro">
                <DropdownMenu.radio_item class="DropdownMenuRadioItem" value="pedro" checked>
                  <DropdownMenu.item_indicator class="DropdownMenuItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></DropdownMenu.item_indicator>
                  Pedro Duarte
                </DropdownMenu.radio_item>
                <DropdownMenu.radio_item class="DropdownMenuRadioItem" value="colm">
                  <DropdownMenu.item_indicator class="DropdownMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></DropdownMenu.item_indicator>
                  Colm Tuite
                </DropdownMenu.radio_item>
              </DropdownMenu.radio_group>

              <DropdownMenu.separator class="DropdownMenuSeparator" />
              <DropdownMenu.item class="DropdownMenuItem" text_value="Close">Close</DropdownMenu.item>

              <DropdownMenu.arrow class="DropdownMenuArrow" />
            </DropdownMenu.content>
          </DropdownMenu.root>
        </div>
        """
      }
    ]
  end
end
