---
title: Select
description: Displays a list of options for the user to pick from—triggered by a button.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/listbox
---

Displays a list of options for the user to pick from—triggered by a button.

<.demo variant="primitive" component="select" css={primitive_css("select")}>

  <:heex>
    <Select.root id="select-primitive">
              <Select.trigger
                class="SelectTrigger"
                aria-label="Food"
              >
                <Select.value placeholder="Select a fruit…" />
                <Select.icon class="SelectIcon">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3.13523 6.15803C3.3241 5.95657 3.64052 5.94637 3.84197 6.13523L7.5 9.56464L11.158 6.13523C11.3595 5.94637 11.6759 5.95657 11.8648 6.15803C12.0536 6.35949 12.0434 6.67591 11.842 6.86477L7.84197 10.6148C7.64964 10.7951 7.35036 10.7951 7.15803 10.6148L3.15803 6.86477C2.95657 6.67591 2.94637 6.35949 3.13523 6.15803Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                </Select.icon>
              </Select.trigger>
              <Select.content
                class="SelectContent"
                id="select-primitive-content"
              >
                <Select.scroll_up_button class="SelectScrollButton">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3.13523 8.84197C3.3241 9.04343 3.64052 9.05363 3.84197 8.86477L7.5 5.43536L11.158 8.86477C11.3595 9.05363 11.6759 9.04343 11.8648 8.84197C12.0536 8.64051 12.0434 8.32409 11.842 8.13523L7.84197 4.38523C7.64964 4.20492 7.35036 4.20492 7.15803 4.38523L3.15803 8.13523C2.95657 8.32409 2.94637 8.64051 3.13523 8.84197Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                </Select.scroll_up_button>
                <Select.viewport class="SelectViewport">
                  <Select.group>
                    <Select.label class="SelectLabel">Fruits</Select.label>
                    <Select.item
                      class="SelectItem"
                      value="apple"
                    >
                      <Select.item_text>Apple</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="banana"
                    >
                      <Select.item_text>Banana</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="blueberry"
                    >
                      <Select.item_text>Blueberry</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="grapes"
                    >
                      <Select.item_text>Grapes</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="pineapple"
                    >
                      <Select.item_text>Pineapple</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="orange"
                    >
                      <Select.item_text>Orange</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                  </Select.group>

                  <Select.separator class="SelectSeparator" />

                  <Select.group>
                    <Select.label class="SelectLabel">Vegetables</Select.label>
                    <Select.item
                      class="SelectItem"
                      value="aubergine"
                    >
                      <Select.item_text>Aubergine</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="broccoli"
                    >
                      <Select.item_text>Broccoli</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="carrot"
                      disabled
                    >
                      <Select.item_text>Carrot</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="courgette"
                    >
                      <Select.item_text>Courgette</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="leek"
                    >
                      <Select.item_text>Leek</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                  </Select.group>

                  <Select.separator class="SelectSeparator" />

                  <Select.group>
                    <Select.label class="SelectLabel">Meat</Select.label>
                    <Select.item
                      class="SelectItem"
                      value="beef"
                    >
                      <Select.item_text>Beef</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="chicken"
                    >
                      <Select.item_text>Chicken</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="lamb"
                    >
                      <Select.item_text>Lamb</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                    <Select.item
                      class="SelectItem"
                      value="pork"
                    >
                      <Select.item_text>Pork</Select.item_text>
                      <Select.item_indicator class="SelectItemIndicator"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></Select.item_indicator>
                    </Select.item>
                  </Select.group>
                </Select.viewport>
                <Select.scroll_down_button class="SelectScrollButton">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3.13523 6.15803C3.3241 5.95657 3.64052 5.94637 3.84197 6.13523L7.5 9.56464L11.158 6.13523C11.3595 5.94637 11.6759 5.95657 11.8648 6.15803C12.0536 6.35949 12.0434 6.67591 11.842 6.86477L7.84197 10.6148C7.64964 10.7951 7.35036 10.7951 7.15803 10.6148L3.15803 6.86477C2.95657 6.67591 2.94637 6.35949 3.13523 6.15803Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                </Select.scroll_down_button>
              </Select.content>
            </Select.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Offers 2 positioning modes.</:item>
  <:item>Supports items, labels, groups of items.</:item>
  <:item>Focus is fully managed.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Supports custom placeholder.</:item>
</.highlights>

## Anatomy

```heex
<Select.root>
  <Select.trigger />
  <Select.value />
  <Select.icon />
  <Select.portal />
  <Select.content />
  <Select.viewport />
  <Select.item />
  <Select.item_text />
  <Select.item_indicator />
  <Select.group />
  <Select.label />
  <Select.separator />
  <Select.scroll_up_button />
  <Select.scroll_down_button />
  <Select.arrow />
</Select.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Value">The `value` part.</:part>
  <:part name="Icon">The `icon` part.</:part>
  <:part name="Portal">The `portal` part.</:part>
  <:part name="Content">The `content` part.</:part>
  <:part name="Viewport">The `viewport` part.</:part>
  <:part name="Item">The `item` part.</:part>
  <:part name="Item Text">The `item_text` part.</:part>
  <:part name="Item Indicator">The `item_indicator` part.</:part>
  <:part name="Group">The `group` part.</:part>
  <:part name="Label">The `label` part.</:part>
  <:part name="Separator">The `separator` part.</:part>
  <:part name="Scroll Up Button">The `scroll_up_button` part.</:part>
  <:part name="Scroll Down Button">The `scroll_down_button` part.</:part>
  <:part name="Arrow">The `arrow` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Select} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.Select} function={:trigger} />

### Value

<.props_table module={EssenceUI.Primitives.Select} function={:value} />

### Icon

<.props_table module={EssenceUI.Primitives.Select} function={:icon} />

### Portal

<.props_table module={EssenceUI.Primitives.Select} function={:portal} />

### Content

<.props_table module={EssenceUI.Primitives.Select} function={:content} />

### Viewport

<.props_table module={EssenceUI.Primitives.Select} function={:viewport} />

### Item

<.props_table module={EssenceUI.Primitives.Select} function={:item} />

### Item Text

<.props_table module={EssenceUI.Primitives.Select} function={:item_text} />

### Item Indicator

<.props_table module={EssenceUI.Primitives.Select} function={:item_indicator} />

### Group

<.props_table module={EssenceUI.Primitives.Select} function={:group} />

### Label

<.props_table module={EssenceUI.Primitives.Select} function={:label} />

### Separator

<.props_table module={EssenceUI.Primitives.Select} function={:separator} />

### Scroll Up Button

<.props_table module={EssenceUI.Primitives.Select} function={:scroll_up_button} />

### Scroll Down Button

<.props_table module={EssenceUI.Primitives.Select} function={:scroll_down_button} />

### Arrow

<.props_table module={EssenceUI.Primitives.Select} function={:arrow} />

## Examples

### Placeholder

```heex
<Select.value placeholder="Select a fruit…" />
```

### Grouped items

Use `Select.group` + `Select.label` to organize long lists.

### With scroll buttons

`scroll_up_button` / `scroll_down_button` appear when the list overflows the viewport.

### Custom item indicator

```heex
<Select.item_indicator class="SelectItemIndicator">✓</Select.item_indicator>
```

See `storybook/primitives/select.story.exs` for a full fruit list demo.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/listbox).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>

## Custom APIs

Wrap the primitive parts into a friendlier abstraction for your design system.

### Usage

```heex
<.my_select … />
```

### Implementation

Compose `Select` parts inside your own function component, encoding classes and defaults once.
