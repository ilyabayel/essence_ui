---
title: Menubar
description: A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/menu/
---

A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands.

<.demo variant="primitive" component="menubar" css={primitive_css("menubar")}>

  <:heex>
    <Menubar.root
              id="menubar-primitive"
              class="MenubarRoot"
            >
              <Menubar.menu value="file">
                <Menubar.trigger
                  id="file-trigger"
                  content_id="file-content"
                  class="MenubarTrigger"
                >
                  File
                </Menubar.trigger>
                <Menubar.content
                  id="file-content"
                  class="MenubarContent"
                  align="start"
                  side_offset={5}
                >
                  <Menubar.item class="MenubarItem">New Tab <div class="RightSlot">⌘ T</div></Menubar.item>
                  <Menubar.item class="MenubarItem">New Window <div class="RightSlot">⌘ N</div></Menubar.item>
                  <Menubar.item
                    class="MenubarItem"
                    disabled
                  >
                    New Incognito Window
                  </Menubar.item>
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
                <Menubar.trigger
                  id="edit-trigger"
                  content_id="edit-content"
                  class="MenubarTrigger"
                >
                  Edit
                </Menubar.trigger>
                <Menubar.content
                  id="edit-content"
                  class="MenubarContent"
                  align="start"
                  side_offset={5}
                >
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
                <Menubar.trigger
                  id="view-trigger"
                  content_id="view-content"
                  class="MenubarTrigger"
                >
                  View
                </Menubar.trigger>
                <Menubar.content
                  id="view-content"
                  class="MenubarContent"
                  align="start"
                  side_offset={5}
                >
                  <Menubar.checkbox_item
                    class="MenubarCheckboxItem inset"
                    text_value="Always Show Bookmarks Bar"
                  >
                    <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Menubar.item_indicator>
                    Always Show Bookmarks Bar
                  </Menubar.checkbox_item>
                  <Menubar.checkbox_item
                    class="MenubarCheckboxItem inset"
                    checked
                    text_value="Always Show Full URLs"
                  >
                    <Menubar.item_indicator
                      class="MenubarItemIndicator"
                      force_mount
                    >
                      <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                    </Menubar.item_indicator>
                    Always Show Full URLs
                  </Menubar.checkbox_item>
                  <Menubar.separator class="MenubarSeparator" />
                  <Menubar.item class="MenubarItem inset">Reload <div class="RightSlot">⌘ R</div></Menubar.item>
                  <Menubar.item
                    class="MenubarItem inset"
                    disabled
                  >
                    Force Reload <div class="RightSlot">⇧ ⌘ R</div>
                  </Menubar.item>
                  <Menubar.separator class="MenubarSeparator" />
                  <Menubar.item class="MenubarItem inset">Toggle Fullscreen</Menubar.item>
                  <Menubar.separator class="MenubarSeparator" />
                  <Menubar.item class="MenubarItem inset">Hide Sidebar</Menubar.item>
                </Menubar.content>
              </Menubar.menu>

              <Menubar.menu value="profiles">
                <Menubar.trigger
                  id="profiles-trigger"
                  content_id="profiles-content"
                  class="MenubarTrigger"
                >
                  Profiles
                </Menubar.trigger>
                <Menubar.content
                  id="profiles-content"
                  class="MenubarContent"
                  align="start"
                  side_offset={5}
                >
                  <Menubar.radio_group value="Luis">
                    <Menubar.radio_item
                      class="MenubarRadioItem inset"
                      value="Andy"
                    >
                      <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></Menubar.item_indicator>
                      Andy
                    </Menubar.radio_item>
                    <Menubar.radio_item
                      class="MenubarRadioItem inset"
                      value="Benoît"
                    >
                      <Menubar.item_indicator class="MenubarItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></Menubar.item_indicator>
                      Benoît
                    </Menubar.radio_item>
                    <Menubar.radio_item
                      class="MenubarRadioItem inset"
                      value="Luis"
                      checked
                    >
                      <Menubar.item_indicator
                        class="MenubarItemIndicator"
                        force_mount
                      >
                        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg>
                      </Menubar.item_indicator>
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
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Supports submenus with configurable reading direction.</:item>
  <:item>Supports items, labels, groups of items.</:item>
  <:item>Supports checkable items (single or multiple).</:item>
  <:item>Customize side, alignment, offsets, collision handling.</:item>
  <:item>Optionally render a pointing arrow.</:item>
  <:item>Focus is fully managed.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Typeahead support.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Menubar.root id="…">
  <Menubar.menu value="…">
    <Menubar.trigger content_id="…" />
    <Menubar.portal>
      <Menubar.content id="…">
        <Menubar.label />
        <Menubar.item />
        <Menubar.group>
          <Menubar.item />
        </Menubar.group>
        <Menubar.checkbox_item>
          <Menubar.item_indicator />
        </Menubar.checkbox_item>
        <Menubar.radio_group>
          <Menubar.radio_item>
            <Menubar.item_indicator />
          </Menubar.radio_item>
        </Menubar.radio_group>
        <Menubar.sub>
          <Menubar.sub_trigger />
          <Menubar.sub_content />
        </Menubar.sub>
        <Menubar.separator />
      </Menubar.content>
    </Menubar.portal>
  </Menubar.menu>
</Menubar.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a menubar.</:part>
  <:part name="Menu">A top-level menu item containing a trigger and content.</:part>
  <:part name="Trigger">The button that toggles the menu content.</:part>
  <:part name="Portal">Portals the content into the document (default `body`).</:part>
  <:part name="Content">The component that pops out when a menu is open.</:part>
  <:part name="Item">An actionable menu item.</:part>
  <:part name="Checkbox Item">An item that can be checked or unchecked.</:part>
  <:part name="Radio Group">Groups mutually exclusive `radio_item` parts.</:part>
  <:part name="Radio Item">An item that can be selected among a radio group.</:part>
  <:part name="Item Indicator">Renders when a checkbox or radio item is checked.</:part>
  <:part name="Label">A non-focusable section label.</:part>
  <:part name="Separator">Visually separates groups of items.</:part>
  <:part name="Group">Groups multiple items.</:part>
  <:part name="Sub">Contains all the parts of a submenu.</:part>
  <:part name="Sub Trigger">An item that opens a submenu.</:part>
  <:part name="Sub Content">The submenu panel.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a menubar.

<.props_table module={EssenceUI.Primitives.Menubar} function={:root} />

### Menu

A top level menu item, contains a trigger with content combination.

<.props_table module={EssenceUI.Primitives.Menubar} function={:menu} />

### Trigger

The button that toggles the content. By default, `Menubar.content` positions itself against the trigger.

<.props_table module={EssenceUI.Primitives.Menubar} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the trigger is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the trigger is disabled.</:row>
</.data_attributes_table>

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.Menubar} function={:portal} />

### Content

The component that pops out when a menu is open.

<.props_table module={EssenceUI.Primitives.Menubar} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side the content rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment against the trigger.</:row>
</.data_attributes_table>

| CSS variable | Description |
| --- | --- |
| `--radix-menubar-content-transform-origin` | The `transform-origin` computed from content and arrow positions/offsets |
| `--radix-menubar-content-available-width` | Remaining width between the trigger and the boundary edge |
| `--radix-menubar-content-available-height` | Remaining height between the trigger and the boundary edge |
| `--radix-menubar-trigger-width` | The width of the trigger |
| `--radix-menubar-trigger-height` | The height of the trigger |

### Item

The component that contains the menubar items.

<.props_table module={EssenceUI.Primitives.Menubar} function={:item} />

<.data_attributes_table>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Checkbox Item

An item that can be controlled and rendered like a checkbox.

<.props_table module={EssenceUI.Primitives.Menubar} function={:checkbox_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Radio Group

Used to group multiple `Menubar.radio_item` parts.

<.props_table module={EssenceUI.Primitives.Menubar} function={:radio_group} />

### Radio Item

An item that can be controlled and rendered like a radio.

<.props_table module={EssenceUI.Primitives.Menubar} function={:radio_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the selected state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Item Indicator

Renders when the parent `checkbox_item` or `radio_item` is checked.

<.props_table module={EssenceUI.Primitives.Menubar} function={:item_indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state of the parent item.</:row>
</.data_attributes_table>

### Label

Used to render a label. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Primitives.Menubar} function={:label} />

### Separator

Used to visually separate items in a menubar menu.

<.props_table module={EssenceUI.Primitives.Menubar} function={:separator} />

### Group

Used to group multiple `Menubar.item` parts.

<.props_table module={EssenceUI.Primitives.Menubar} function={:group} />

### Sub

Contains all the parts of a submenu.

<.props_table module={EssenceUI.Primitives.Menubar} function={:sub} />

### Sub Trigger

An item that opens a submenu. Must be rendered inside `Menubar.sub`.

<.props_table module={EssenceUI.Primitives.Menubar} function={:sub_trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Sub Content

The component that pops out when a submenu is open. Must be rendered inside `Menubar.sub`.

<.props_table module={EssenceUI.Primitives.Menubar} function={:sub_content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side the submenu rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment of the submenu.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the submenu.</:row>
</.data_attributes_table>

## Examples

### With submenus

You can create submenus by using `Menubar.sub` in combination with its parts.

```heex
<Menubar.root id="menubar-sub">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-sub-trigger" content_id="menubar-sub-content">…</Menubar.trigger>
    <Menubar.content id="menubar-sub-content">
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.separator class="MenubarSeparator" />
      <Menubar.sub>
        <Menubar.sub_trigger class="MenubarSubTrigger">Sub menu →</Menubar.sub_trigger>
        <Menubar.sub_content class="MenubarSubContent">
          <Menubar.item class="MenubarItem">Sub menu item</Menubar.item>
          <Menubar.item class="MenubarItem">Sub menu item</Menubar.item>
        </Menubar.sub_content>
      </Menubar.sub>
      <Menubar.separator class="MenubarSeparator" />
      <Menubar.item class="MenubarItem">…</Menubar.item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### With disabled items

You can add special styles to disabled items via the `data-disabled` attribute.

```heex
<Menubar.root id="menubar-disabled">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-disabled-trigger" content_id="menubar-disabled-content">…</Menubar.trigger>
    <Menubar.content id="menubar-disabled-content">
      <Menubar.item class="MenubarItem" disabled>…</Menubar.item>
      <Menubar.item class="MenubarItem">…</Menubar.item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

```css
.MenubarItem[data-disabled] {
  color: gainsboro;
}
```

### With separators

Use the `separator` part to add a separator between items.

```heex
<Menubar.root id="menubar-separators">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-separators-trigger" content_id="menubar-separators-content">…</Menubar.trigger>
    <Menubar.content id="menubar-separators-content">
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.separator class="MenubarSeparator" />
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.separator class="MenubarSeparator" />
      <Menubar.item class="MenubarItem">…</Menubar.item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### With labels

Use the `label` part to help label a section.

```heex
<Menubar.root id="menubar-labels">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-labels-trigger" content_id="menubar-labels-content">…</Menubar.trigger>
    <Menubar.content id="menubar-labels-content">
      <Menubar.label class="MenubarLabel">Label</Menubar.label>
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.item class="MenubarItem">…</Menubar.item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### With checkbox items

Use the `checkbox_item` part to add an item that can be checked. Pass `checked` from LiveView assigns to control state.

```heex
<Menubar.root id="menubar-checkbox">
  <Menubar.menu value="view">
    <Menubar.trigger id="menubar-checkbox-trigger" content_id="menubar-checkbox-content">…</Menubar.trigger>
    <Menubar.content id="menubar-checkbox-content">
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.item class="MenubarItem">…</Menubar.item>
      <Menubar.separator class="MenubarSeparator" />
      <Menubar.checkbox_item checked={@checked} class="MenubarCheckboxItem" text_value="Checkbox item">
        <Menubar.item_indicator class="MenubarItemIndicator">✓</Menubar.item_indicator>
        Checkbox item
      </Menubar.checkbox_item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### With radio items

Use the `radio_group` and `radio_item` parts to add an item that can be checked amongst others.

```heex
<Menubar.root id="menubar-radio">
  <Menubar.menu value="profiles">
    <Menubar.trigger id="menubar-radio-trigger" content_id="menubar-radio-content">…</Menubar.trigger>
    <Menubar.content id="menubar-radio-content">
      <Menubar.radio_group value={@color}>
        <Menubar.radio_item value="red" checked={@color == "red"} class="MenubarRadioItem">
          <Menubar.item_indicator class="MenubarItemIndicator">●</Menubar.item_indicator>
          Red
        </Menubar.radio_item>
        <Menubar.radio_item value="blue" checked={@color == "blue"} class="MenubarRadioItem">
          <Menubar.item_indicator class="MenubarItemIndicator">●</Menubar.item_indicator>
          Blue
        </Menubar.radio_item>
      </Menubar.radio_group>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### With complex items

You can add extra decorative elements in the `item` parts, such as images.

```heex
<Menubar.root id="menubar-complex">
  <Menubar.menu value="people">
    <Menubar.trigger id="menubar-complex-trigger" content_id="menubar-complex-content">…</Menubar.trigger>
    <Menubar.content id="menubar-complex-content">
      <Menubar.item class="MenubarItem">
        <img src="…" alt="" />
        Adolfo Hess
      </Menubar.item>
      <Menubar.item class="MenubarItem">
        <img src="…" alt="" />
        Miyah Myles
      </Menubar.item>
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

### Constrain the content/sub-content size

You may want to constrain the width of the content (or sub-content) so that it matches the trigger width, or constrain its height to not exceed the viewport.

We expose several CSS custom properties such as `--radix-menubar-trigger-width` and `--radix-menubar-content-available-height` to support this. Use them to constrain the content dimensions.

```heex
<Menubar.root id="menubar-constrain">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-constrain-trigger" content_id="menubar-constrain-content">…</Menubar.trigger>
    <Menubar.content id="menubar-constrain-content" class="MenubarContent" side_offset={5}>
      …
    </Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

```css
.MenubarContent {
  width: var(--radix-menubar-trigger-width);
  max-height: var(--radix-menubar-content-available-height);
}
```

### Origin-aware animations

We expose a CSS custom property `--radix-menubar-content-transform-origin`. Use it to animate the content from its computed origin based on `side`, `side_offset`, `align`, and any collisions.

```heex
<Menubar.root id="menubar-origin">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-origin-trigger" content_id="menubar-origin-content">…</Menubar.trigger>
    <Menubar.content id="menubar-origin-content" class="MenubarContent">…</Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

```css
.MenubarContent {
  transform-origin: var(--radix-menubar-content-transform-origin);
  animation: scaleIn 0.5s ease-out;
}

@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
```

### Collision-aware animations

We expose `data-side` and `data-align` attributes. Their values change at runtime to reflect collisions. Use them to create collision and direction-aware animations.

```heex
<Menubar.root id="menubar-collision">
  <Menubar.menu value="file">
    <Menubar.trigger id="menubar-collision-trigger" content_id="menubar-collision-content">…</Menubar.trigger>
    <Menubar.content id="menubar-collision-content" class="MenubarContent">…</Menubar.content>
  </Menubar.menu>
</Menubar.root>
```

```css
.MenubarContent {
  animation-duration: 0.6s;
  animation-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}
.MenubarContent[data-side="top"] {
  animation-name: slideUp;
}
.MenubarContent[data-side="bottom"] {
  animation-name: slideDown;
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

## Accessibility

Adheres to the [Menu Button WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/menu-button/) and uses [roving tabindex](https://www.w3.org/WAI/ARIA/apg/practices/keyboard-interface/#kbd_roving_tabindex) to manage focus movement among menu items.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">When focus is on `Menubar.trigger`, opens the menubar and focuses the first item. When focus is on an item, activates the focused item.</:row>
  <:row keys="Enter">When focus is on `Menubar.trigger`, opens the associated menu. When focus is on an item, activates the focused item.</:row>
  <:row keys="ArrowDown">When focus is on `Menubar.trigger`, opens the associated menu. When focus is on an item, moves focus to the next item.</:row>
  <:row keys="ArrowUp">When focus is on an item, moves focus to the previous item.</:row>
  <:row keys="ArrowRight, ArrowLeft">When focus is on a `Menubar.trigger`, moves focus to the next or previous item. When focus is on a `Menubar.sub_trigger`, opens or closes the submenu depending on reading direction. When focus is within a `Menubar.content`, opens the next menu in the menubar.</:row>
  <:row keys="Esc">Closes the currently open menu and moves focus to its `Menubar.trigger`.</:row>
</.keyboard_table>
