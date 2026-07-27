---
title: Select
description: Displays a list of options for the user to pick from—triggered by a button.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/listbox
---

Displays a list of options for the user to pick from—triggered by a button.

<.demo theme="light" variant="primitive" component="select" css={primitive_css("select")}>

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
  <:item>Typeahead support.</:item>
  <:item>Supports Right to Left direction.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Select.root id="…">
  <Select.trigger>
    <Select.value />
    <Select.icon />
  </Select.trigger>
  <Select.portal id="…">
    <Select.content>
      <Select.scroll_up_button />
      <Select.viewport>
        <Select.item>
          <Select.item_text />
          <Select.item_indicator />
        </Select.item>
        <Select.group>
          <Select.label />
          <Select.item>…</Select.item>
        </Select.group>
        <Select.separator />
      </Select.viewport>
      <Select.scroll_down_button />
      <Select.arrow />
    </Select.content>
  </Select.portal>
</Select.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a select. Renders a hidden input when `name` is set.</:part>
  <:part name="Trigger">The button that toggles the select. `Select.content` positions against the trigger.</:part>
  <:part name="Value">Reflects the selected value, or shows a `placeholder` when empty.</:part>
  <:part name="Icon">A decorative affordance beside the value (often a chevron).</:part>
  <:part name="Portal">Portals content into the target (default `body`).</:part>
  <:part name="Content">The listbox that opens when the select is open.</:part>
  <:part name="Viewport">The scrolling viewport that contains all items.</:part>
  <:part name="Item">A selectable option. Requires a unique `value`.</:part>
  <:part name="Item Text">Text shown in the trigger when this item is selected.</:part>
  <:part name="Item Indicator">Renders when the item is selected.</:part>
  <:part name="Group">Groups multiple items; pair with `Select.label`.</:part>
  <:part name="Label">A label for a group (not focusable via arrow keys).</:part>
  <:part name="Separator">Visually separates items or groups.</:part>
  <:part name="Scroll Up Button">Optional affordance to scroll the viewport up.</:part>
  <:part name="Scroll Down Button">Optional affordance to scroll the viewport down.</:part>
  <:part name="Arrow">Optional arrow rendered inside `Select.content`.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a select.

Use `value` with `on_change` for controlled state in LiveView:

```heex
<Select.root id="food-select" value={@food} on_change="food_change">
  …
</Select.root>
```

```elixir
def handle_event("food_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :food, value)}
end
```

Set `name` to include a hidden input for form submission.

<.props_table module={EssenceUI.Primitives.Select} function={:root} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="Present when disabled">Present when the select is disabled.</:row>
</.data_attributes_table>

### Trigger

The button that toggles the select. `Select.content` positions itself against the trigger.

<.props_table module={EssenceUI.Primitives.Select} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the select is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the select is disabled.</:row>
  <:row name="[data-placeholder]" values="Present when has placeholder">Present when no value is selected and a placeholder is shown.</:row>
</.data_attributes_table>

### Value

The part that reflects the selected value. By default the selected item's `item_text` is rendered. Pass slot content for more control. Do not style this part heavily—it affects positioning. Use `placeholder` when the select has no value.

<.props_table module={EssenceUI.Primitives.Select} function={:value} />

### Icon

A small icon often displayed next to the value as a visual affordance that the select can open.

<.props_table module={EssenceUI.Primitives.Select} function={:icon} />

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.Select} function={:portal} />

### Content

The component that pops out when the select is open. Set `data-position="popper"` for popper-style positioning (similar to `Popover`); omit it for the default item-aligned mode.

<.props_table module={EssenceUI.Primitives.Select} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the select is open.</:row>
  <:row name="[data-position]" values={"item-aligned | popper"}>Positioning mode. Defaults to item-aligned.</:row>
</.data_attributes_table>

### Viewport

The scrolling viewport that contains all of the items.

<.props_table module={EssenceUI.Primitives.Select} function={:viewport} />

### Item

The component that contains the select items.

<.props_table module={EssenceUI.Primitives.Select} function={:item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the item is selected.</:row>
  <:row name="[data-highlighted]" values="Present when highlighted">Present when the item is highlighted.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Item Text

The textual part of the item. It should only contain the text you want in the trigger when that item is selected. Do not style this part heavily—it affects positioning.

<.props_table module={EssenceUI.Primitives.Select} function={:item_text} />

### Item Indicator

Renders when the item is selected. Style this element directly, or use it as a wrapper for an icon.

<.props_table module={EssenceUI.Primitives.Select} function={:item_indicator} />

### Scroll Up Button

An optional button used as an affordance to show viewport overflow and to scroll upwards.

<.props_table module={EssenceUI.Primitives.Select} function={:scroll_up_button} />

### Scroll Down Button

An optional button used as an affordance to show viewport overflow and to scroll downwards.

<.props_table module={EssenceUI.Primitives.Select} function={:scroll_down_button} />

### Group

Used to group multiple items. Use with `Select.label` for accessible labelling.

<.props_table module={EssenceUI.Primitives.Select} function={:group} />

### Label

Used to render the label of a group. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Primitives.Select} function={:label} />

### Separator

Used to visually separate items in the select.

<.props_table module={EssenceUI.Primitives.Select} function={:separator} />

### Arrow

An optional arrow element rendered inside `Select.content` to visually link the trigger with the content.

<.props_table module={EssenceUI.Primitives.Select} function={:arrow} />

## Examples

### Change the positioning mode

By default, `Select` positions content relative to the active item (item-aligned). For popper-style positioning similar to `Popover`, set `data-position="popper"` on `Select.content`:

```heex
<Select.root id="popper-select">
  <Select.trigger class="SelectTrigger">
    <Select.value placeholder="Select a fruit…" />
    <Select.icon class="SelectIcon">…</Select.icon>
  </Select.trigger>
  <Select.portal id="popper-select-portal">
    <Select.content id="popper-select-content" class="SelectContent" data-position="popper">
      <Select.viewport>…</Select.viewport>
    </Select.content>
  </Select.portal>
</Select.root>
```

### With disabled items

Style disabled items via the `data-disabled` attribute:

```heex
<Select.item class="SelectItem" value="carrot" disabled>
  <Select.item_text>Carrot</Select.item_text>
  <Select.item_indicator class="SelectItemIndicator">…</Select.item_indicator>
</Select.item>
```

```css
.SelectItem[data-disabled] {
  color: var(--mauve-8);
  pointer-events: none;
}
```

### With a placeholder

Use the `placeholder` prop on `Select.value` when the select has no value. The trigger gets `data-placeholder` for styling:

```heex
<Select.trigger class="SelectTrigger" aria-label="Food">
  <Select.value placeholder="Pick an option" />
  <Select.icon class="SelectIcon">…</Select.icon>
</Select.trigger>
```

```css
.SelectTrigger[data-placeholder] {
  color: var(--mauve-9);
}
```

### With separators

Use `Select.separator` to add a separator between items:

```heex
<Select.viewport>
  <Select.item value="apple">…</Select.item>
  <Select.item value="banana">…</Select.item>
  <Select.separator class="SelectSeparator" />
  <Select.item value="blueberry">…</Select.item>
</Select.viewport>
```

### With grouped items

Use `Select.group` and `Select.label` to group items in a section:

```heex
<Select.viewport>
  <Select.group>
    <Select.label class="SelectLabel">Fruits</Select.label>
    <Select.item value="apple">…</Select.item>
    <Select.item value="banana">…</Select.item>
  </Select.group>
</Select.viewport>
```

### With complex items

Custom content inside items is supported. Use `text_value` on `Select.item` when typeahead should match something other than visible text:

```heex
<Select.item value="adolfo" text_value="Adolfo Hess">
  <Select.item_text>
    <img src="/avatars/adolfo.png" alt="" width="20" height="20" />
    Adolfo Hess
  </Select.item_text>
  <Select.item_indicator class="SelectItemIndicator">…</Select.item_indicator>
</Select.item>
```

### Controlling the value displayed in the trigger

By default the trigger shows the selected item's `item_text`. For more control, use controlled `value`/`on_change` and pass slot content to `Select.value`:

```heex
<Select.root id="country-select" value={@country} on_change="country_change">
  <Select.trigger class="SelectTrigger" aria-label="Country">
    <Select.value aria-label={@country}>
      {Map.get(@country_flags, @country)}
    </Select.value>
    <Select.icon class="SelectIcon">…</Select.icon>
  </Select.trigger>
  <Select.portal id="country-select-portal">
    <Select.content id="country-select-content" class="SelectContent">
      <Select.viewport>
        <Select.item value="france">
          <Select.item_text>France</Select.item_text>
          <Select.item_indicator class="SelectItemIndicator">…</Select.item_indicator>
        </Select.item>
        <Select.item value="united-kingdom">
          <Select.item_text>United Kingdom</Select.item_text>
          <Select.item_indicator class="SelectItemIndicator">…</Select.item_indicator>
        </Select.item>
      </Select.viewport>
    </Select.content>
  </Select.portal>
</Select.root>
```

```elixir
def handle_event("country_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :country, value)}
end
```

## Accessibility

Adheres to the [ListBox WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/listbox).

See the W3C [Select-Only Combobox](https://www.w3.org/TR/wai-aria-practices/examples/combobox/combobox-select-only.html) example for more information.

### Labelling

Use the [Label](/primitives/docs/components/label) primitive to offer a visual and accessible label for the select:

```heex
<Label>
  Country
  <Select.root id="labelled-select">…</Select.root>
</Label>

<%!-- or --%>

<Label for="labelled-select-trigger">Country</Label>
<Select.root id="labelled-select">
  <Select.trigger id="labelled-select-trigger" class="SelectTrigger">…</Select.trigger>
  …
</Select.root>
```

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">When focus is on `Select.trigger`, opens the select and focuses the selected item. When focus is on an item, selects the focused item.</:row>
  <:row keys="Enter">When focus is on `Select.trigger`, opens the select and focuses the first item. When focus is on an item, selects the focused item.</:row>
  <:row keys="ArrowDown">When focus is on `Select.trigger`, opens the select. When focus is on an item, moves focus to the next item.</:row>
  <:row keys="ArrowUp">When focus is on `Select.trigger`, opens the select. When focus is on an item, moves focus to the previous item.</:row>
  <:row keys="Escape">Closes the select and moves focus to `Select.trigger`.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by abstracting the primitive parts into your own component.

### Abstract down to `Select` and `SelectItem`

This example abstracts most of the parts.

#### Usage

```heex
<.select id="my-select" value={@value} on_change="select_change">
  <:item value="1">Item 1</:item>
  <:item value="2">Item 2</:item>
  <:item value="3">Item 3</:item>
</.select>
```

#### Implementation

```elixir
attr :id, :string, required: true
attr :value, :string, default: nil
attr :on_change, :string, default: nil
attr :placeholder, :string, default: "Select…"
attr :class, :string, default: nil
slot :item, required: true do
  attr :value, :string, required: true
end

def select(assigns) do
  ~H"""
  <Select.root id={@id} value={@value} on_change={@on_change}>
    <Select.trigger class={@class || "SelectTrigger"}>
      <Select.value placeholder={@placeholder} />
      <Select.icon class="SelectIcon">
        <svg width="15" height="15" viewBox="0 0 15 15" aria-hidden="true">…</svg>
      </Select.icon>
    </Select.trigger>
    <Select.portal id={"#{@id}-portal"}>
      <Select.content id={"#{@id}-content"} class="SelectContent">
        <Select.scroll_up_button class="SelectScrollButton">…</Select.scroll_up_button>
        <Select.viewport>
          <Select.item :for={item <- @item} class="SelectItem" value={item.value}>
            <Select.item_text>{render_slot(item)}</Select.item_text>
            <Select.item_indicator class="SelectItemIndicator">…</Select.item_indicator>
          </Select.item>
        </Select.viewport>
        <Select.scroll_down_button class="SelectScrollButton">…</Select.scroll_down_button>
      </Select.content>
    </Select.portal>
  </Select.root>
  """
end
```
