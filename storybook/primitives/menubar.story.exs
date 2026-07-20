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
        description: "Radix docs menubar demo",
        template: """
        <div class="radix-demo" data-component="menubar">
          <Menubar.root id="menubar-primitive" class="MenubarRoot">
            <Menubar.menu value="file">
              <Menubar.trigger id="file-trigger" content_id="file-content" class="MenubarTrigger">File</Menubar.trigger>
              <Menubar.content id="file-content" class="MenubarContent" align="start" side_offset={5}>
                <Menubar.item class="MenubarItem">New Tab <div class="RightSlot">⌘ T</div></Menubar.item>
                <Menubar.item class="MenubarItem">New Window <div class="RightSlot">⌘ N</div></Menubar.item>
                <Menubar.item class="MenubarItem" disabled>New Incognito Window</Menubar.item>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.sub>
                  <Menubar.sub_trigger class="MenubarSubTrigger">
                    Share
                    <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                  </Menubar.sub_trigger>
                  <Menubar.sub_content class="MenubarSubContent">
                    <Menubar.item class="MenubarItem">Email Link</Menubar.item>
                    <Menubar.item class="MenubarItem">Messages</Menubar.item>
                    <Menubar.item class="MenubarItem">Notes</Menubar.item>
                  </Menubar.sub_content>
                </Menubar.sub>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.item class="MenubarItem">Print… <div class="RightSlot">⌘ P</div></Menubar.item>
              </Menubar.content>
            </Menubar.menu>

            <Menubar.menu value="edit">
              <Menubar.trigger id="edit-trigger" content_id="edit-content" class="MenubarTrigger">Edit</Menubar.trigger>
              <Menubar.content id="edit-content" class="MenubarContent" align="start" side_offset={5}>
                <Menubar.item class="MenubarItem">Undo <div class="RightSlot">⌘ Z</div></Menubar.item>
                <Menubar.item class="MenubarItem">Redo <div class="RightSlot">⇧ ⌘ Z</div></Menubar.item>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.sub>
                  <Menubar.sub_trigger class="MenubarSubTrigger">
                    Find
                    <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                  </Menubar.sub_trigger>
                  <Menubar.sub_content class="MenubarSubContent">
                    <Menubar.item class="MenubarItem">Search the web…</Menubar.item>
                    <Menubar.separator class="MenubarSeparator" />
                    <Menubar.item class="MenubarItem">Find…</Menubar.item>
                    <Menubar.item class="MenubarItem">Find Next</Menubar.item>
                    <Menubar.item class="MenubarItem">Find Previous</Menubar.item>
                  </Menubar.sub_content>
                </Menubar.sub>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.item class="MenubarItem">Cut</Menubar.item>
                <Menubar.item class="MenubarItem">Copy</Menubar.item>
                <Menubar.item class="MenubarItem">Paste</Menubar.item>
              </Menubar.content>
            </Menubar.menu>

            <Menubar.menu value="view">
              <Menubar.trigger id="view-trigger" content_id="view-content" class="MenubarTrigger">View</Menubar.trigger>
              <Menubar.content id="view-content" class="MenubarContent" align="start" side_offset={5}>
                <Menubar.checkbox_item class="MenubarCheckboxItem inset" text_value="Always Show Bookmarks Bar">
                  <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Menubar.item_indicator>
                  Always Show Bookmarks Bar
                </Menubar.checkbox_item>
                <Menubar.checkbox_item class="MenubarCheckboxItem inset" checked text_value="Always Show Full URLs">
                  <Menubar.item_indicator class="MenubarItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Menubar.item_indicator>
                  Always Show Full URLs
                </Menubar.checkbox_item>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.item class="MenubarItem inset">Reload <div class="RightSlot">⌘ R</div></Menubar.item>
                <Menubar.item class="MenubarItem inset" disabled>Force Reload <div class="RightSlot">⇧ ⌘ R</div></Menubar.item>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.item class="MenubarItem inset">Toggle Fullscreen</Menubar.item>
                <Menubar.separator class="MenubarSeparator" />
                <Menubar.item class="MenubarItem inset">Hide Sidebar</Menubar.item>
              </Menubar.content>
            </Menubar.menu>

            <Menubar.menu value="profiles">
              <Menubar.trigger id="profiles-trigger" content_id="profiles-content" class="MenubarTrigger">Profiles</Menubar.trigger>
              <Menubar.content id="profiles-content" class="MenubarContent" align="start" side_offset={5}>
                <Menubar.radio_group value="Luis">
                  <Menubar.radio_item class="MenubarRadioItem inset" value="Andy">
                    <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></Menubar.item_indicator>
                    Andy
                  </Menubar.radio_item>
                  <Menubar.radio_item class="MenubarRadioItem inset" value="Benoît">
                    <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></Menubar.item_indicator>
                    Benoît
                  </Menubar.radio_item>
                  <Menubar.radio_item class="MenubarRadioItem inset" value="Luis" checked>
                    <Menubar.item_indicator class="MenubarItemIndicator" force_mount><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></Menubar.item_indicator>
                    Luis
                  </Menubar.radio_item>
                  <Menubar.separator class="MenubarSeparator" />
                  <Menubar.item class="MenubarItem inset">Edit…</Menubar.item>
                  <Menubar.separator class="MenubarSeparator" />
                  <Menubar.item class="MenubarItem inset">Add Profile…</Menubar.item>
                </Menubar.radio_group>
              </Menubar.content>
            </Menubar.menu>
          </Menubar.root>
        </div>
        """
      }
    ]
  end
end
