---
title: Dropdown Menu
description: Displays a menu to the user—such as a set of actions or functions—triggered by a button.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/menu-button/
---

Displays a menu to the user—such as a set of actions or functions—triggered by a button.

<.demo theme="light" variant="primitive" component="dropdown-menu" css={primitive_css("dropdown-menu")}>

  <:heex>
    <DropdownMenu.root id="dropdown-primitive">
              <DropdownMenu.trigger
                id="dropdown-trigger"
                content_id="dropdown-content"
                class="IconButton"
                aria-label="Customise options"
              >
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M1.5 3C1.22386 3 1 3.22386 1 3.5C1 3.77614 1.22386 4 1.5 4H13.5C13.7761 4 14 3.77614 14 3.5C14 3.22386 13.7761 3 13.5 3H1.5ZM1 7.5C1 7.22386 1.22386 7 1.5 7H13.5C13.7761 7 14 7.22386 14 7.5C14 7.77614 13.7761 8 13.5 8H1.5C1.22386 8 1 7.77614 1 7.5ZM1 11.5C1 11.2239 1.22386 11 1.5 11H13.5C13.7761 11 14 11.2239 14 11.5C14 11.7761 13.7761 12 13.5 12H1.5C1.22386 12 1 11.7761 1 11.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </DropdownMenu.trigger>
              <DropdownMenu.content
                id="dropdown-content"
                class="DropdownMenuContent"
                side_offset={5}
              >
                <DropdownMenu.item
                  class="DropdownMenuItem"
                  text_value="New Tab"
                >
                  New Tab <div class="RightSlot">⌘+T</div>
                </DropdownMenu.item>
                <DropdownMenu.item
                  class="DropdownMenuItem"
                  text_value="New Window"
                >
                  New Window <div class="RightSlot">⌘+N</div>
                </DropdownMenu.item>
                <DropdownMenu.item
                  class="DropdownMenuItem"
                  disabled
                  text_value="New Private Window"
                >
                  New Private Window <div class="RightSlot">⇧+⌘+N</div>
                </DropdownMenu.item>
                <DropdownMenu.sub>
                  <DropdownMenu.sub_trigger
                    class="DropdownMenuSubTrigger"
                    text_value="More Tools"
                  >
                    More Tools
                    <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                  </DropdownMenu.sub_trigger>
                  <DropdownMenu.sub_content
                    class="DropdownMenuSubContent"
                    side_offset={2}
                  >
                    <DropdownMenu.item
                      class="DropdownMenuItem"
                      text_value="Save Page As"
                    >
                      Save Page As… <div class="RightSlot">⌘+S</div>
                    </DropdownMenu.item>
                    <DropdownMenu.item
                      class="DropdownMenuItem"
                      text_value="Create Shortcut"
                    >
                      Create Shortcut…
                    </DropdownMenu.item>
                    <DropdownMenu.item
                      class="DropdownMenuItem"
                      text_value="Name Window"
                    >
                      Name Window…
                    </DropdownMenu.item>
                    <DropdownMenu.separator class="DropdownMenuSeparator" />
                    <DropdownMenu.item
                      class="DropdownMenuItem"
                      text_value="Developer Tools"
                    >
                      Developer Tools
                    </DropdownMenu.item>
                  </DropdownMenu.sub_content>
                </DropdownMenu.sub>

                <DropdownMenu.separator class="DropdownMenuSeparator" />

                <DropdownMenu.checkbox_item
                  class="DropdownMenuCheckboxItem"
                  checked
                  text_value="Show Bookmarks"
                >
                  <DropdownMenu.item_indicator
                    class="DropdownMenuItemIndicator"
                    force_mount
                  >
                    <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                  </DropdownMenu.item_indicator>
                  Show Bookmarks <div class="RightSlot">⌘+B</div>
                </DropdownMenu.checkbox_item>
                <DropdownMenu.checkbox_item
                  class="DropdownMenuCheckboxItem"
                  text_value="Show Full URLs"
                >
                  <DropdownMenu.item_indicator class="DropdownMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></DropdownMenu.item_indicator>
                  Show Full URLs
                </DropdownMenu.checkbox_item>

                <DropdownMenu.separator class="DropdownMenuSeparator" />

                <DropdownMenu.label class="DropdownMenuLabel">People</DropdownMenu.label>
                <DropdownMenu.radio_group value="pedro">
                  <DropdownMenu.radio_item
                    class="DropdownMenuRadioItem"
                    value="pedro"
                    checked
                  >
                    <DropdownMenu.item_indicator
                      class="DropdownMenuItemIndicator"
                      force_mount
                    >
                      <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg>
                    </DropdownMenu.item_indicator>
                    Pedro Duarte
                  </DropdownMenu.radio_item>
                  <DropdownMenu.radio_item
                    class="DropdownMenuRadioItem"
                    value="colm"
                  >
                    <DropdownMenu.item_indicator class="DropdownMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></DropdownMenu.item_indicator>
                    Colm Tuite
                  </DropdownMenu.radio_item>
                </DropdownMenu.radio_group>

                <DropdownMenu.separator class="DropdownMenuSeparator" />
                <DropdownMenu.item
                  class="DropdownMenuItem"
                  text_value="Close"
                >
                  Close
                </DropdownMenu.item>

                <DropdownMenu.arrow class="DropdownMenuArrow" />
              </DropdownMenu.content>
            </DropdownMenu.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Supports submenus with configurable reading direction.</:item>
  <:item>Supports items, labels, groups of items.</:item>
  <:item>Supports checkable items (single or multiple) with optional indeterminate state.</:item>
  <:item>Supports modal and non-modal modes.</:item>
  <:item>Customize side, alignment, offsets, collision handling.</:item>
  <:item>Optionally render a pointing arrow.</:item>
  <:item>Focus is fully managed.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Typeahead support.</:item>
  <:item>Dismissing and layering behavior is highly customizable.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<DropdownMenu.root id="…">
  <DropdownMenu.trigger content_id="…" />
  <DropdownMenu.portal>
    <DropdownMenu.content id="…">
      <DropdownMenu.label />
      <DropdownMenu.item />
      <DropdownMenu.group>
        <DropdownMenu.item />
      </DropdownMenu.group>
      <DropdownMenu.checkbox_item>
        <DropdownMenu.item_indicator />
      </DropdownMenu.checkbox_item>
      <DropdownMenu.radio_group>
        <DropdownMenu.radio_item>
          <DropdownMenu.item_indicator />
        </DropdownMenu.radio_item>
      </DropdownMenu.radio_group>
      <DropdownMenu.sub>
        <DropdownMenu.sub_trigger />
        <DropdownMenu.sub_content />
      </DropdownMenu.sub>
      <DropdownMenu.separator />
      <DropdownMenu.arrow />
    </DropdownMenu.content>
  </DropdownMenu.portal>
</DropdownMenu.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a dropdown menu.</:part>
  <:part name="Trigger">The button that toggles the dropdown menu.</:part>
  <:part name="Portal">Portals the content into the document (default `body`).</:part>
  <:part name="Content">The component that pops out when the menu is open.</:part>
  <:part name="Item">An actionable menu item.</:part>
  <:part name="Checkbox Item">An item that can be checked or unchecked.</:part>
  <:part name="Radio Group">Groups mutually exclusive `radio_item` parts.</:part>
  <:part name="Radio Item">An item that can be selected among a radio group.</:part>
  <:part name="Item Indicator">Renders when a checkbox or radio item is checked.</:part>
  <:part name="Label">A non-focusable section label.</:part>
  <:part name="Separator">Visually separates groups of items.</:part>
  <:part name="Group">Groups multiple items.</:part>
  <:part name="Arrow">Optional pointer linking the trigger to the content.</:part>
  <:part name="Sub">Contains all the parts of a submenu.</:part>
  <:part name="Sub Trigger">An item that opens a submenu.</:part>
  <:part name="Sub Content">The submenu panel.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a dropdown menu.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:root} />

### Trigger

The button that toggles the dropdown menu. By default, `DropdownMenu.content` positions itself against the trigger.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the trigger is disabled.</:row>
</.data_attributes_table>

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:portal} />

### Content

The component that pops out when the dropdown menu is open.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side of the trigger the content rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment against the trigger.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

| CSS variable | Description |
| --- | --- |
| `--radix-dropdown-menu-content-transform-origin` | The `transform-origin` computed from content and arrow positions/offsets |
| `--radix-dropdown-menu-content-available-width` | Remaining width between the trigger and the boundary edge |
| `--radix-dropdown-menu-content-available-height` | Remaining height between the trigger and the boundary edge |
| `--radix-dropdown-menu-trigger-width` | The width of the trigger |
| `--radix-dropdown-menu-trigger-height` | The height of the trigger |

### Item

The component that contains the dropdown menu items.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:item} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Checkbox Item

An item that can be controlled and rendered like a checkbox.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:checkbox_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Radio Group

Used to group multiple `DropdownMenu.radio_item` parts.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:radio_group} />

### Radio Item

An item that can be controlled and rendered like a radio.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:radio_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the selected state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Item Indicator

Renders when the parent `checkbox_item` or `radio_item` is checked. Style directly or wrap an icon.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:item_indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state of the parent item.</:row>
</.data_attributes_table>

### Label

Used to render a label. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:label} />

### Separator

Used to visually separate items in the dropdown menu.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:separator} />

### Group

Used to group multiple `DropdownMenu.item` parts.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:group} />

### Arrow

An optional arrow element rendered alongside the content to visually link the trigger.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:arrow} />

### Sub

Contains all the parts of a submenu.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:sub} />

### Sub Trigger

An item that opens a submenu. Must be rendered inside `DropdownMenu.sub`.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:sub_trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Sub Content

The component that pops out when a submenu is open. Must be rendered inside `DropdownMenu.sub`.

<.props_table module={EssenceUI.Primitives.DropdownMenu} function={:sub_content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side the submenu rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment of the submenu.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the submenu.</:row>
</.data_attributes_table>

## Examples

### With submenus

You can create submenus by using `DropdownMenu.sub` in combination with its parts.

```heex
<DropdownMenu.root id="dropdown-sub">
  <DropdownMenu.trigger id="dropdown-sub-trigger" content_id="dropdown-sub-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-sub-content">
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.sub>
      <DropdownMenu.sub_trigger class="DropdownMenuSubTrigger">Sub menu →</DropdownMenu.sub_trigger>
      <DropdownMenu.sub_content class="DropdownMenuSubContent">
        <DropdownMenu.item class="DropdownMenuItem">Sub menu item</DropdownMenu.item>
        <DropdownMenu.item class="DropdownMenuItem">Sub menu item</DropdownMenu.item>
        <DropdownMenu.arrow class="DropdownMenuArrow" />
      </DropdownMenu.sub_content>
    </DropdownMenu.sub>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### With disabled items

You can add special styles to disabled items via the `data-disabled` attribute.

```heex
<DropdownMenu.root id="dropdown-disabled">
  <DropdownMenu.trigger id="dropdown-disabled-trigger" content_id="dropdown-disabled-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-disabled-content">
    <DropdownMenu.item class="DropdownMenuItem" disabled>…</DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

```css
.DropdownMenuItem[data-disabled] {
  color: gainsboro;
}
```

### With separators

Use the `separator` part to add a separator between items.

```heex
<DropdownMenu.root id="dropdown-separators">
  <DropdownMenu.trigger id="dropdown-separators-trigger" content_id="dropdown-separators-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-separators-content">
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### With labels

Use the `label` part to help label a section.

```heex
<DropdownMenu.root id="dropdown-labels">
  <DropdownMenu.trigger id="dropdown-labels-trigger" content_id="dropdown-labels-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-labels-content">
    <DropdownMenu.label class="DropdownMenuLabel">Label</DropdownMenu.label>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### With checkbox items

Use the `checkbox_item` part to add an item that can be checked. Pass `checked` from LiveView assigns to control state.

```heex
<DropdownMenu.root id="dropdown-checkbox">
  <DropdownMenu.trigger id="dropdown-checkbox-trigger" content_id="dropdown-checkbox-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-checkbox-content">
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">…</DropdownMenu.item>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.checkbox_item checked={@checked} class="DropdownMenuCheckboxItem" text_value="Checkbox item">
      <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">✓</DropdownMenu.item_indicator>
      Checkbox item
    </DropdownMenu.checkbox_item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### With radio items

Use the `radio_group` and `radio_item` parts to add an item that can be checked amongst others.

```heex
<DropdownMenu.root id="dropdown-radio">
  <DropdownMenu.trigger id="dropdown-radio-trigger" content_id="dropdown-radio-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-radio-content">
    <DropdownMenu.radio_group value={@color}>
      <DropdownMenu.radio_item value="red" checked={@color == "red"} class="DropdownMenuRadioItem">
        <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">●</DropdownMenu.item_indicator>
        Red
      </DropdownMenu.radio_item>
      <DropdownMenu.radio_item value="blue" checked={@color == "blue"} class="DropdownMenuRadioItem">
        <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">●</DropdownMenu.item_indicator>
        Blue
      </DropdownMenu.radio_item>
      <DropdownMenu.radio_item value="green" checked={@color == "green"} class="DropdownMenuRadioItem">
        <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">●</DropdownMenu.item_indicator>
        Green
      </DropdownMenu.radio_item>
    </DropdownMenu.radio_group>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### With complex items

You can add extra decorative elements in the `item` parts, such as images.

```heex
<DropdownMenu.root id="dropdown-complex">
  <DropdownMenu.trigger id="dropdown-complex-trigger" content_id="dropdown-complex-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-complex-content">
    <DropdownMenu.item class="DropdownMenuItem">
      <img src="…" alt="" />
      Adolfo Hess
    </DropdownMenu.item>
    <DropdownMenu.item class="DropdownMenuItem">
      <img src="…" alt="" />
      Miyah Myles
    </DropdownMenu.item>
  </DropdownMenu.content>
</DropdownMenu.root>
```

### Constrain the content/sub-content size

You may want to constrain the width of the content (or sub-content) so that it matches the trigger width, or constrain its height to not exceed the viewport.

We expose several CSS custom properties such as `--radix-dropdown-menu-trigger-width` and `--radix-dropdown-menu-content-available-height` to support this. Use them to constrain the content dimensions.

```heex
<DropdownMenu.root id="dropdown-constrain">
  <DropdownMenu.trigger id="dropdown-constrain-trigger" content_id="dropdown-constrain-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-constrain-content" class="DropdownMenuContent" side_offset={5}>
    …
  </DropdownMenu.content>
</DropdownMenu.root>
```

```css
.DropdownMenuContent {
  width: var(--radix-dropdown-menu-trigger-width);
  max-height: var(--radix-dropdown-menu-content-available-height);
}
```

### Origin-aware animations

We expose a CSS custom property `--radix-dropdown-menu-content-transform-origin`. Use it to animate the content from its computed origin based on `side`, `side_offset`, `align`, and any collisions.

```heex
<DropdownMenu.root id="dropdown-origin">
  <DropdownMenu.trigger id="dropdown-origin-trigger" content_id="dropdown-origin-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-origin-content" class="DropdownMenuContent">
    …
  </DropdownMenu.content>
</DropdownMenu.root>
```

```css
.DropdownMenuContent {
  transform-origin: var(--radix-dropdown-menu-content-transform-origin);
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
<DropdownMenu.root id="dropdown-collision">
  <DropdownMenu.trigger id="dropdown-collision-trigger" content_id="dropdown-collision-content">…</DropdownMenu.trigger>
  <DropdownMenu.content id="dropdown-collision-content" class="DropdownMenuContent">
    …
  </DropdownMenu.content>
</DropdownMenu.root>
```

```css
.DropdownMenuContent {
  animation-duration: 0.6s;
  animation-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}
.DropdownMenuContent[data-side="top"] {
  animation-name: slideUp;
}
.DropdownMenuContent[data-side="bottom"] {
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
  <:row keys="Space">When focus is on `DropdownMenu.trigger`, opens the dropdown menu and focuses the first item. When focus is on an item, activates the focused item.</:row>
  <:row keys="Enter">When focus is on `DropdownMenu.trigger`, opens the dropdown menu and focuses the first item. When focus is on an item, activates the focused item.</:row>
  <:row keys="ArrowDown">When focus is on `DropdownMenu.trigger`, opens the dropdown menu. When focus is on an item, moves focus to the next item.</:row>
  <:row keys="ArrowUp">When focus is on an item, moves focus to the previous item.</:row>
  <:row keys="ArrowRight, ArrowLeft">When focus is on `DropdownMenu.sub_trigger`, opens or closes the submenu depending on reading direction.</:row>
  <:row keys="Esc">Closes the dropdown menu and moves focus to `DropdownMenu.trigger`.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by abstracting the primitive parts into your own component.

### Abstract the arrow and item indicators

This example abstracts `DropdownMenu.arrow` and `DropdownMenu.item_indicator`. It also wraps implementation details for `checkbox_item` and `radio_item`.

#### Usage

```heex
<.dropdown_menu id="my-menu">
  <:trigger>DropdownMenu trigger</:trigger>
  <:content>
    <DropdownMenu.item class="DropdownMenuItem">Item</DropdownMenu.item>
    <DropdownMenu.label class="DropdownMenuLabel">Label</DropdownMenu.label>
    <.dropdown_menu_checkbox_item checked={@checked}>Checkbox item</.dropdown_menu_checkbox_item>
    <DropdownMenu.separator class="DropdownMenuSeparator" />
    <DropdownMenu.radio_group value={@color}>
      <.dropdown_menu_radio_item value="a" checked={@color == "a"}>Radio A</.dropdown_menu_radio_item>
      <.dropdown_menu_radio_item value="b" checked={@color == "b"}>Radio B</.dropdown_menu_radio_item>
    </DropdownMenu.radio_group>
  </:content>
</.dropdown_menu>
```

#### Implementation

```elixir
def dropdown_menu(assigns) do
  ~H"""
  <DropdownMenu.root id={@id}>
    <DropdownMenu.trigger id={"#{@id}-trigger"} content_id={"#{@id}-content"}>
      {render_slot(@trigger)}
    </DropdownMenu.trigger>
    <DropdownMenu.content id={"#{@id}-content"} class="DropdownMenuContent">
      {render_slot(@content)}
      <DropdownMenu.arrow class="DropdownMenuArrow" />
    </DropdownMenu.content>
  </DropdownMenu.root>
  """
end

def dropdown_menu_checkbox_item(assigns) do
  ~H"""
  <DropdownMenu.checkbox_item checked={@checked} class="DropdownMenuCheckboxItem" {@rest}>
    {render_slot(@inner_block)}
    <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">✓</DropdownMenu.item_indicator>
  </DropdownMenu.checkbox_item>
  """
end

def dropdown_menu_radio_item(assigns) do
  ~H"""
  <DropdownMenu.radio_item value={@value} checked={@checked} class="DropdownMenuRadioItem" {@rest}>
    {render_slot(@inner_block)}
    <DropdownMenu.item_indicator class="DropdownMenuItemIndicator">●</DropdownMenu.item_indicator>
  </DropdownMenu.radio_item>
  """
end
```
