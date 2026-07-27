---
title: Context Menu
description: Displays a menu located at the pointer, triggered by a right click or a long press.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/menu
---

Displays a menu located at the pointer, triggered by a right click or a long press.

<.demo theme="light" variant="primitive" component="context-menu" css={primitive_css("context-menu")}>

  <:heex>
    <ContextMenu.root id="context-primitive">
              <ContextMenu.trigger
                id="context-trigger"
                content_id="context-content"
                class="ContextMenuTrigger"
              >
                Right-click here.
              </ContextMenu.trigger>
              <ContextMenu.content
                id="context-content"
                class="ContextMenuContent"
              >
                <ContextMenu.item
                  class="ContextMenuItem"
                  text_value="Back"
                >
                  Back <div class="RightSlot">⌘+[</div>
                </ContextMenu.item>
                <ContextMenu.item
                  class="ContextMenuItem"
                  disabled
                  text_value="Forward"
                >
                  Forward <div class="RightSlot">⌘+]</div>
                </ContextMenu.item>
                <ContextMenu.item
                  class="ContextMenuItem"
                  text_value="Reload"
                >
                  Reload <div class="RightSlot">⌘+R</div>
                </ContextMenu.item>
                <ContextMenu.sub>
                  <ContextMenu.sub_trigger
                    class="ContextMenuSubTrigger"
                    text_value="More Tools"
                  >
                    More Tools
                    <div class="RightSlot"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M6.1584 3.13508C6.35985 2.94621 6.67627 2.95642 6.86514 3.15788L10.61514 7.15788C10.7954 7.3502 10.7954 7.64949 10.61514 7.84182L6.86514 11.8418C6.67627 12.0433 6.35985 12.0535 6.1584 11.8646C5.95694 11.6757 5.94673 11.3593 6.1356 11.1579L9.565 7.49985L6.1356 3.84182C5.94673 3.64036 5.95694 3.32394 6.1584 3.13508Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
                  </ContextMenu.sub_trigger>
                  <ContextMenu.sub_content
                    class="ContextMenuSubContent"
                    side_offset={2}
                  >
                    <ContextMenu.item
                      class="ContextMenuItem"
                      text_value="Save Page As"
                    >
                      Save Page As… <div class="RightSlot">⌘+S</div>
                    </ContextMenu.item>
                    <ContextMenu.item
                      class="ContextMenuItem"
                      text_value="Create Shortcut"
                    >
                      Create Shortcut…
                    </ContextMenu.item>
                    <ContextMenu.item
                      class="ContextMenuItem"
                      text_value="Name Window"
                    >
                      Name Window…
                    </ContextMenu.item>
                    <ContextMenu.separator class="ContextMenuSeparator" />
                    <ContextMenu.item
                      class="ContextMenuItem"
                      text_value="Developer Tools"
                    >
                      Developer Tools
                    </ContextMenu.item>
                  </ContextMenu.sub_content>
                </ContextMenu.sub>

                <ContextMenu.separator class="ContextMenuSeparator" />

                <ContextMenu.checkbox_item
                  class="ContextMenuCheckboxItem"
                  checked
                  text_value="Show Bookmarks"
                >
                  <ContextMenu.item_indicator
                    class="ContextMenuItemIndicator"
                    force_mount
                  >
                    <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                  </ContextMenu.item_indicator>
                  Show Bookmarks <div class="RightSlot">⌘+B</div>
                </ContextMenu.checkbox_item>
                <ContextMenu.checkbox_item
                  class="ContextMenuCheckboxItem"
                  text_value="Show Full URLs"
                >
                  <ContextMenu.item_indicator class="ContextMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></ContextMenu.item_indicator>
                  Show Full URLs
                </ContextMenu.checkbox_item>

                <ContextMenu.separator class="ContextMenuSeparator" />

                <ContextMenu.label class="ContextMenuLabel">People</ContextMenu.label>
                <ContextMenu.radio_group value="pedro">
                  <ContextMenu.radio_item
                    class="ContextMenuRadioItem"
                    value="pedro"
                    checked
                  >
                    <ContextMenu.item_indicator
                      class="ContextMenuItemIndicator"
                      force_mount
                    >
                      <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg>
                    </ContextMenu.item_indicator>
                    Pedro Duarte
                  </ContextMenu.radio_item>
                  <ContextMenu.radio_item
                    class="ContextMenuRadioItem"
                    value="colm"
                  >
                    <ContextMenu.item_indicator class="ContextMenuItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z" fill="currentColor"></path></svg></ContextMenu.item_indicator>
                    Colm Tuite
                  </ContextMenu.radio_item>
                </ContextMenu.radio_group>
              </ContextMenu.content>
            </ContextMenu.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports submenus with configurable reading direction.</:item>
  <:item>Supports items, labels, groups of items.</:item>
  <:item>Supports checkable items (single or multiple) with optional indeterminate state.</:item>
  <:item>Supports modal and non-modal modes.</:item>
  <:item>Customize side, alignment, offsets, collision handling.</:item>
  <:item>Focus is fully managed.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Typeahead support.</:item>
  <:item>Dismissing and layering behavior is highly customizable.</:item>
  <:item>Triggers with a long press on touch devices.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<ContextMenu.root id="…">
  <ContextMenu.trigger content_id="…" />
  <ContextMenu.portal>
    <ContextMenu.content id="…">
      <ContextMenu.label />
      <ContextMenu.item />
      <ContextMenu.group>
        <ContextMenu.item />
      </ContextMenu.group>
      <ContextMenu.checkbox_item>
        <ContextMenu.item_indicator />
      </ContextMenu.checkbox_item>
      <ContextMenu.radio_group>
        <ContextMenu.radio_item>
          <ContextMenu.item_indicator />
        </ContextMenu.radio_item>
      </ContextMenu.radio_group>
      <ContextMenu.sub>
        <ContextMenu.sub_trigger />
        <ContextMenu.sub_content />
      </ContextMenu.sub>
      <ContextMenu.separator />
    </ContextMenu.content>
  </ContextMenu.portal>
</ContextMenu.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a context menu.</:part>
  <:part name="Trigger">The area that opens the context menu on right-click or long press.</:part>
  <:part name="Portal">Portals the content into the document (default `body`).</:part>
  <:part name="Content">The component that pops out in an open context menu.</:part>
  <:part name="Item">An actionable menu item.</:part>
  <:part name="Checkbox Item">An item that can be checked or unchecked.</:part>
  <:part name="Radio Group">Groups mutually exclusive `radio_item` parts.</:part>
  <:part name="Radio Item">An item that can be selected among a radio group.</:part>
  <:part name="Item Indicator">Renders when a checkbox or radio item is checked.</:part>
  <:part name="Label">A non-focusable section label.</:part>
  <:part name="Separator">Visually separates groups of items.</:part>
  <:part name="Group">Groups multiple items.</:part>
  <:part name="Arrow">Optional pointer for submenu positioning.</:part>
  <:part name="Sub">Contains all the parts of a submenu.</:part>
  <:part name="Sub Trigger">An item that opens a submenu.</:part>
  <:part name="Sub Content">The submenu panel.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a context menu.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:root} />

### Trigger

The area that opens the context menu. Wrap it around the target you want the menu to open from when right-clicking (or using the relevant keyboard shortcuts).

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
</.data_attributes_table>

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:portal} />

### Content

The component that pops out in an open context menu.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the menu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side the content rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment of the content.</:row>
</.data_attributes_table>

| CSS variable | Description |
| --- | --- |
| `--radix-context-menu-content-transform-origin` | The `transform-origin` computed from content and arrow positions/offsets |
| `--radix-context-menu-content-available-width` | Remaining width between the trigger and the boundary edge |
| `--radix-context-menu-content-available-height` | Remaining height between the trigger and the boundary edge |
| `--radix-context-menu-trigger-width` | The width of the trigger |
| `--radix-context-menu-trigger-height` | The height of the trigger |

### Item

The component that contains the context menu items.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:item} />

<.data_attributes_table>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Checkbox Item

An item that can be controlled and rendered like a checkbox.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:checkbox_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Radio Group

Used to group multiple `ContextMenu.radio_item` parts.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:radio_group} />

### Radio Item

An item that can be controlled and rendered like a radio.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:radio_item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the selected state.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Item Indicator

Renders when the parent `checkbox_item` or `radio_item` is checked.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:item_indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects the checked state of the parent item.</:row>
</.data_attributes_table>

### Label

Used to render a label. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:label} />

### Separator

Used to visually separate items in the context menu.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:separator} />

### Group

Used to group multiple `ContextMenu.item` parts.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:group} />

### Arrow

An optional arrow element rendered alongside a submenu.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:arrow} />

### Sub

Contains all the parts of a submenu.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub} />

### Sub Trigger

An item that opens a submenu. Must be rendered inside `ContextMenu.sub`.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub_trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Sub Content

The component that pops out when a submenu is open. Must be rendered inside `ContextMenu.sub`.

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub_content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the submenu is open.</:row>
  <:row name="[data-side]" values={"left | right | bottom | top"}>The side the submenu rendered against.</:row>
  <:row name="[data-align]" values={"start | end | center"}>The alignment of the submenu.</:row>
</.data_attributes_table>

## Examples

### With submenus

You can create submenus by using `ContextMenu.sub` in combination with its parts.

```heex
<ContextMenu.root id="context-sub">
  <ContextMenu.trigger id="context-sub-trigger" content_id="context-sub-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-sub-content">
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.separator class="ContextMenuSeparator" />
    <ContextMenu.sub>
      <ContextMenu.sub_trigger class="ContextMenuSubTrigger">Sub menu →</ContextMenu.sub_trigger>
      <ContextMenu.sub_content class="ContextMenuSubContent">
        <ContextMenu.item class="ContextMenuItem">Sub menu item</ContextMenu.item>
        <ContextMenu.item class="ContextMenuItem">Sub menu item</ContextMenu.item>
        <ContextMenu.arrow class="ContextMenuArrow" />
      </ContextMenu.sub_content>
    </ContextMenu.sub>
    <ContextMenu.separator class="ContextMenuSeparator" />
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
  </ContextMenu.content>
</ContextMenu.root>
```

### With disabled items

You can add special styles to disabled items via the `data-disabled` attribute.

```heex
<ContextMenu.root id="context-disabled">
  <ContextMenu.trigger id="context-disabled-trigger" content_id="context-disabled-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-disabled-content">
    <ContextMenu.item class="ContextMenuItem" disabled>…</ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
  </ContextMenu.content>
</ContextMenu.root>
```

```css
.ContextMenuItem[data-disabled] {
  color: gainsboro;
}
```

### With separators

Use the `separator` part to add a separator between items.

```heex
<ContextMenu.root id="context-separators">
  <ContextMenu.trigger id="context-separators-trigger" content_id="context-separators-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-separators-content">
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.separator class="ContextMenuSeparator" />
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.separator class="ContextMenuSeparator" />
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
  </ContextMenu.content>
</ContextMenu.root>
```

### With labels

Use the `label` part to help label a section.

```heex
<ContextMenu.root id="context-labels">
  <ContextMenu.trigger id="context-labels-trigger" content_id="context-labels-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-labels-content">
    <ContextMenu.label class="ContextMenuLabel">Label</ContextMenu.label>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
  </ContextMenu.content>
</ContextMenu.root>
```

### With checkbox items

Use the `checkbox_item` part to add an item that can be checked. Pass `checked` from LiveView assigns to control state.

```heex
<ContextMenu.root id="context-checkbox">
  <ContextMenu.trigger id="context-checkbox-trigger" content_id="context-checkbox-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-checkbox-content">
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">…</ContextMenu.item>
    <ContextMenu.separator class="ContextMenuSeparator" />
    <ContextMenu.checkbox_item checked={@checked} class="ContextMenuCheckboxItem" text_value="Checkbox item">
      <ContextMenu.item_indicator class="ContextMenuItemIndicator">✓</ContextMenu.item_indicator>
      Checkbox item
    </ContextMenu.checkbox_item>
  </ContextMenu.content>
</ContextMenu.root>
```

### With radio items

Use the `radio_group` and `radio_item` parts to add an item that can be checked amongst others.

```heex
<ContextMenu.root id="context-radio">
  <ContextMenu.trigger id="context-radio-trigger" content_id="context-radio-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-radio-content">
    <ContextMenu.radio_group value={@color}>
      <ContextMenu.radio_item value="red" checked={@color == "red"} class="ContextMenuRadioItem">
        <ContextMenu.item_indicator class="ContextMenuItemIndicator">●</ContextMenu.item_indicator>
        Red
      </ContextMenu.radio_item>
      <ContextMenu.radio_item value="blue" checked={@color == "blue"} class="ContextMenuRadioItem">
        <ContextMenu.item_indicator class="ContextMenuItemIndicator">●</ContextMenu.item_indicator>
        Blue
      </ContextMenu.radio_item>
      <ContextMenu.radio_item value="green" checked={@color == "green"} class="ContextMenuRadioItem">
        <ContextMenu.item_indicator class="ContextMenuItemIndicator">●</ContextMenu.item_indicator>
        Green
      </ContextMenu.radio_item>
    </ContextMenu.radio_group>
  </ContextMenu.content>
</ContextMenu.root>
```

### With complex items

You can add extra decorative elements in the `item` parts, such as images.

```heex
<ContextMenu.root id="context-complex">
  <ContextMenu.trigger id="context-complex-trigger" content_id="context-complex-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-complex-content">
    <ContextMenu.item class="ContextMenuItem">
      <img src="…" alt="" />
      Adolfo Hess
    </ContextMenu.item>
    <ContextMenu.item class="ContextMenuItem">
      <img src="…" alt="" />
      Miyah Myles
    </ContextMenu.item>
  </ContextMenu.content>
</ContextMenu.root>
```

### Constrain the content/sub-content size

You may want to constrain the width of the content (or sub-content) so that it matches the trigger width, or constrain its height to not exceed the viewport.

We expose several CSS custom properties such as `--radix-context-menu-trigger-width` and `--radix-context-menu-content-available-height` to support this. Use them to constrain the content dimensions.

```heex
<ContextMenu.root id="context-constrain">
  <ContextMenu.trigger id="context-constrain-trigger" content_id="context-constrain-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-constrain-content" class="ContextMenuContent">
    …
  </ContextMenu.content>
</ContextMenu.root>
```

```css
.ContextMenuContent {
  width: var(--radix-context-menu-trigger-width);
  max-height: var(--radix-context-menu-content-available-height);
}
```

### Origin-aware animations

We expose a CSS custom property `--radix-context-menu-content-transform-origin`. Use it to animate the content from its computed origin based on positioning and any collisions.

```heex
<ContextMenu.root id="context-origin">
  <ContextMenu.trigger id="context-origin-trigger" content_id="context-origin-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-origin-content" class="ContextMenuContent">
    …
  </ContextMenu.content>
</ContextMenu.root>
```

```css
.ContextMenuContent {
  transform-origin: var(--radix-context-menu-content-transform-origin);
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
<ContextMenu.root id="context-collision">
  <ContextMenu.trigger id="context-collision-trigger" content_id="context-collision-content">…</ContextMenu.trigger>
  <ContextMenu.content id="context-collision-content" class="ContextMenuContent">
    …
  </ContextMenu.content>
</ContextMenu.root>
```

```css
.ContextMenuContent {
  animation-duration: 0.6s;
  animation-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}
.ContextMenuContent[data-side="top"] {
  animation-name: slideUp;
}
.ContextMenuContent[data-side="bottom"] {
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

Adheres to the [Menu WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/menu) and uses [roving tabindex](https://www.w3.org/WAI/ARIA/apg/practices/keyboard-interface/#kbd_roving_tabindex) to manage focus movement among menu items.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">Activates the focused item.</:row>
  <:row keys="Enter">Activates the focused item.</:row>
  <:row keys="ArrowDown">Moves focus to the next item.</:row>
  <:row keys="ArrowUp">Moves focus to the previous item.</:row>
  <:row keys="ArrowRight, ArrowLeft">When focus is on `ContextMenu.sub_trigger`, opens or closes the submenu depending on reading direction.</:row>
  <:row keys="Esc">Closes the context menu.</:row>
</.keyboard_table>
