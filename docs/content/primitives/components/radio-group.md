---
title: Radio Group
description: A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/radio
---

A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.

<.demo theme="light" variant="primitive" component="radio-group" css={primitive_css("radio-group")}>
  <:heex>
    <form>
      <RadioGroup.root id="radio-group-primitive" class="DemoRadioGroupRoot" default_value="default" aria-label="View density">
        <div style="display: flex; align-items: center;">
          <RadioGroup.item class="DemoRadioGroupItem" value="default" id="radio-group-r1">
            <RadioGroup.indicator class="DemoRadioGroupIndicator" />
          </RadioGroup.item>
          <label class="DemoRadioGroupLabel" for="radio-group-r1">Default</label>
        </div>
        <div style="display: flex; align-items: center;">
          <RadioGroup.item class="DemoRadioGroupItem" value="comfortable" id="radio-group-r2">
            <RadioGroup.indicator class="DemoRadioGroupIndicator" />
          </RadioGroup.item>
          <label class="DemoRadioGroupLabel" for="radio-group-r2">Comfortable</label>
        </div>
        <div style="display: flex; align-items: center;">
          <RadioGroup.item class="DemoRadioGroupItem" value="compact" id="radio-group-r3">
            <RadioGroup.indicator class="DemoRadioGroupIndicator" />
          </RadioGroup.item>
          <label class="DemoRadioGroupLabel" for="radio-group-r3">Compact</label>
        </div>
      </RadioGroup.root>
    </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Supports horizontal/vertical orientation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<RadioGroup.root id="…">
  <RadioGroup.item value="…">
    <RadioGroup.indicator />
  </RadioGroup.item>
</RadioGroup.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a radio group.</:part>
  <:part name="Item">An item in the group that can be checked. Renders the interactive button and hidden input together.</:part>
  <:part name="Indicator">Renders when the radio item is checked.</:part>
  <:part name="Bubble Input">The visually hidden native input used for form submission. Available as a standalone part for custom composition.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a radio group.

Use `value` with `on_value_change` for controlled selection in LiveView:

```heex
<RadioGroup.root id="density" value={@value} on_value_change="radio_value_change">
  …
</RadioGroup.root>
```

```elixir
def handle_event("radio_value_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :value, value)}
end
```

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:root} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="Present when disabled">Present when the group is disabled.</:row>
</.data_attributes_table>

### Item

An item in the group that can be checked. Renders an interactive button and a visually hidden `input` for form submission.

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the item is selected.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Indicator

Renders when the radio item is in a checked state. Style this element directly, or use it as a wrapper for an icon, or both.

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the item is selected.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
</.data_attributes_table>

### Bubble Input

The visually hidden native radio input that `RadioGroup.item` renders by default. Use it directly when building items from lower-level parts.

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:bubble_input} />

## Examples

### Decoupling the hidden input

By default, `RadioGroup.item` renders a visually hidden `input` for form submission. To recompose, move, or exclude that input, build each item from a button with `data-radix-radio-group-item` and a separate `RadioGroup.bubble_input`.

Place each `bubble_input` immediately after its button so the hook can sync checked state. Set `name` on the root; the hook propagates it to inputs.

```heex
<RadioGroup.root id="options" name="option" default_value="one">
  <button type="button" role="radio" id="option-one" data-radix-radio-group-item data-value="one" class="DemoRadioGroupItem">
    <RadioGroup.indicator class="DemoRadioGroupIndicator" />
  </button>
  <RadioGroup.bubble_input value="one" name="option" />

  <button type="button" role="radio" id="option-two" data-radix-radio-group-item data-value="two" class="DemoRadioGroupItem">
    <RadioGroup.indicator class="DemoRadioGroupIndicator" />
  </button>
  <RadioGroup.bubble_input value="two" name="option" />

  <button type="button" role="radio" id="option-three" data-radix-radio-group-item data-value="three" class="DemoRadioGroupItem">
    <RadioGroup.indicator class="DemoRadioGroupIndicator" />
  </button>
  <RadioGroup.bubble_input value="three" name="option" />
</RadioGroup.root>
```

Omit `RadioGroup.bubble_input` when you do not need form submission.

## Accessibility

Adheres to the [Radio Group WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/radio) and uses [roving tabindex](https://www.w3.org/WAI/ARIA/apg/patterns/radio/examples/radio) to manage focus movement among radio items.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Tab">Moves focus to either the checked radio item or the first radio item in the group.</:row>
  <:row keys="Space">When focus is on an unchecked radio item, checks it.</:row>
  <:row keys="ArrowDown">Moves focus and checks the next radio item in the group.</:row>
  <:row keys="ArrowRight">Moves focus and checks the next radio item in the group.</:row>
  <:row keys="ArrowUp">Moves focus to the previous radio item in the group.</:row>
  <:row keys="ArrowLeft">Moves focus to the previous radio item in the group.</:row>
</.keyboard_table>
