---
title: Switch
description: A control that allows the user to toggle between checked and not checked.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/switch
---

A control that allows the user to toggle between checked and not checked.

<.demo variant="primitive" component="switch" css={primitive_css("switch")}>
  <:heex>
    <form>
      <div style="display: flex; align-items: center;">
        <label id="switch-airplane-label" for="switch-airplane-mode" class="DemoSwitchLabel" style="padding-right: 15px;">
          Airplane mode
        </label>
        <Switch.root id="switch-airplane-mode" class="DemoSwitchRoot" aria-labelledby="switch-airplane-label">
          <Switch.thumb class="DemoSwitchThumb" />
        </Switch.root>
      </div>
    </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Switch.root id="…">
  <Switch.thumb />
</Switch.root>
```

<.anatomy>
  <:part name="Root">Composes `trigger` and `bubble_input` for the default switch experience.</:part>
  <:part name="Trigger">The interactive button with `role="switch"`.</:part>
  <:part name="Thumb">The thumb that visually indicates whether the switch is on or off.</:part>
  <:part name="Bubble Input">The visually hidden native input used for form submission.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a switch. Renders a `trigger` and `bubble_input`; a visually hidden `input` is included for form submission.

Use `checked` with `on_checked_change` for controlled state in LiveView:

```heex
<Switch.root id="airplane-mode" checked={@checked} on_checked_change="switch_checked_change">
  <Switch.thumb class="DemoSwitchThumb" />
</Switch.root>
```

```elixir
def handle_event("switch_checked_change", %{"checked" => checked}, socket) do
  {:noreply, assign(socket, :checked, checked == "true" or checked == true)}
end
```

<.props_table module={EssenceUI.Primitives.Switch} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the switch is on or off.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the switch is disabled.</:row>
</.data_attributes_table>

### Trigger

The clickable button that toggles the switch state. Used directly when decoupling from the hidden input.

<.props_table module={EssenceUI.Primitives.Switch} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the switch is on or off.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the switch is disabled.</:row>
</.data_attributes_table>

### Thumb

The thumb that is used to visually indicate whether the switch is on or off.

<.props_table module={EssenceUI.Primitives.Switch} function={:thumb} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked"}>Reflects whether the switch is on or off.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the switch is disabled.</:row>
</.data_attributes_table>

### Bubble Input

The visually hidden native input that `Switch.root` renders by default. Omit it when you do not need form submission.

<.props_table module={EssenceUI.Primitives.Switch} function={:bubble_input} />

## Examples

### Decoupling the hidden input

By default, `Switch.root` renders a visually hidden `input` for form submission. To recompose, move, or exclude that input, build the switch from `trigger` and `bubble_input` instead.

- `Switch.trigger` is the interactive button that wraps `Switch.thumb`.
- `Switch.bubble_input` is the visually hidden input that `Switch.root` renders by default. Omit it when you do not need form submission.

Place `trigger` immediately before `bubble_input` so the hook can sync state between them.

```heex
<Switch.trigger id="airplane-mode" name="airplane-mode" class="DemoSwitchRoot">
  <Switch.thumb class="DemoSwitchThumb" />
</Switch.trigger>
<Switch.bubble_input name="airplane-mode" />
```

## Accessibility

Adheres to the [`switch` role requirements](https://www.w3.org/WAI/ARIA/apg/patterns/switch).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">Toggles the component's state.</:row>
  <:row keys="Enter">Toggles the component's state.</:row>
</.keyboard_table>
