---
title: Context Menu
description: Displays a menu located at the pointer, triggered by a right click or a long press.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/menu
---

Displays a menu located at the pointer, triggered by a right click or a long press.

<.demo variant="primitive" component="context-menu" css={primitive_css("context-menu")}>

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
</.highlights>

## Anatomy

```heex
<ContextMenu.root>
  <ContextMenu.trigger />
  <ContextMenu.portal />
  <ContextMenu.content />
  <ContextMenu.item />
  <ContextMenu.checkbox_item />
  <ContextMenu.radio_group />
  <ContextMenu.radio_item />
  <ContextMenu.item_indicator />
  <ContextMenu.label />
  <ContextMenu.separator />
  <ContextMenu.group />
  <ContextMenu.arrow />
  <ContextMenu.sub />
  <ContextMenu.sub_trigger />
  <ContextMenu.sub_content />
</ContextMenu.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Portal">The `portal` part.</:part>
  <:part name="Content">The `content` part.</:part>
  <:part name="Item">The `item` part.</:part>
  <:part name="Checkbox Item">The `checkbox_item` part.</:part>
  <:part name="Radio Group">The `radio_group` part.</:part>
  <:part name="Radio Item">The `radio_item` part.</:part>
  <:part name="Item Indicator">The `item_indicator` part.</:part>
  <:part name="Label">The `label` part.</:part>
  <:part name="Separator">The `separator` part.</:part>
  <:part name="Group">The `group` part.</:part>
  <:part name="Arrow">The `arrow` part.</:part>
  <:part name="Sub">The `sub` part.</:part>
  <:part name="Sub Trigger">The `sub_trigger` part.</:part>
  <:part name="Sub Content">The `sub_content` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:trigger} />

### Portal

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:portal} />

### Content

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:content} />

### Item

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:item} />

### Checkbox Item

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:checkbox_item} />

### Radio Group

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:radio_group} />

### Radio Item

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:radio_item} />

### Item Indicator

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:item_indicator} />

### Label

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:label} />

### Separator

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:separator} />

### Group

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:group} />

### Arrow

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:arrow} />

### Sub

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub} />

### Sub Trigger

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub_trigger} />

### Sub Content

<.props_table module={EssenceUI.Primitives.ContextMenu} function={:sub_content} />

## Examples

See the live demo above and `storybook/primitives/context_menu.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/menu).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
