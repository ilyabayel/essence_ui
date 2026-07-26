---
title: Checkbox
description: A control that allows the user to toggle between checked and not checked.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/checkbox
---

A control that allows the user to toggle between checked and not checked.

<.demo variant="primitive" component="checkbox" css={primitive_css("checkbox")}>
  <:heex>
    <form>
      <div style="display: flex; align-items: center;">
        <Checkbox.root class="DemoCheckboxRoot" default_checked id="checkbox-primitive">
          <Checkbox.indicator class="DemoCheckboxIndicator">
            <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
          </Checkbox.indicator>
        </Checkbox.root>
        <label class="DemoCheckboxLabel" for="checkbox-primitive">
          Accept terms and conditions.
        </label>
      </div>
    </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports indeterminate state.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Checkbox.root id="…">
  <Checkbox.indicator />
</Checkbox.root>
```

<.anatomy>
  <:part name="Root">Composes `trigger` and `bubble_input` for the default checkbox experience.</:part>
  <:part name="Trigger">The interactive button with `role="checkbox"`.</:part>
  <:part name="Indicator">Renders when the checkbox is checked or indeterminate.</:part>
  <:part name="Bubble Input">The visually hidden native input used for form submission.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a checkbox. Renders a `trigger` and `bubble_input`; a visually hidden `input` is included for form submission.

Use `checked` with `on_checked_change` for controlled state in LiveView:

```heex
<Checkbox.root id="terms" checked={@checked} on_checked_change="checkbox_checked_change">
  <Checkbox.indicator>…</Checkbox.indicator>
</Checkbox.root>
```

```elixir
def handle_event("checkbox_checked_change", %{"checked" => checked}, socket) do
  checked =
    case checked do
      "indeterminate" -> "indeterminate"
      "true" -> true
      "false" -> false
      val -> val
    end

  {:noreply, assign(socket, :checked, checked)}
end
```

<.props_table module={EssenceUI.Primitives.Checkbox} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked | indeterminate"}>Reflects the checked state.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the checkbox is disabled.</:row>
</.data_attributes_table>

### Trigger

The interactive button that toggles the checkbox. Used directly when decoupling from the hidden input.

<.props_table module={EssenceUI.Primitives.Checkbox} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked | indeterminate"}>Reflects the checked state.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the checkbox is disabled.</:row>
</.data_attributes_table>

### Indicator

Renders when the checkbox is in a checked or indeterminate state. Style this element directly, or use it as a wrapper for an icon, or both.

<.props_table module={EssenceUI.Primitives.Checkbox} function={:indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"checked | unchecked | indeterminate"}>Reflects the checked state.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the checkbox is disabled.</:row>
</.data_attributes_table>

### Bubble Input

The visually hidden native checkbox that `Checkbox.root` renders by default. Omit it when you do not need form submission.

<.props_table module={EssenceUI.Primitives.Checkbox} function={:bubble_input} />

## Examples

### Indeterminate

Set the checkbox to indeterminate by controlling its checked state. Pass `"indeterminate"`, `true`, or `false` to `checked`.

```heex
<Checkbox.root
  id="indeterminate-checkbox"
  class="DemoCheckboxRoot"
  checked={@checked}
  on_checked_change="checkbox_checked_change"
>
  <Checkbox.indicator class="DemoCheckboxIndicator">
    <%= if @checked == "indeterminate" do %>
      <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
        <path d="M2 7.5h11" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
    <% else %>
      <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
        <path d="M11.467 3.727a.75.75 0 0 1 1.018 1.018L7.398 11.092a.75.75 0 0 1-1.088.157L3.704 8.712a.75.75 0 1 1 1.09-1.035l1.525 1.443 4.242-6.393Z" fill="currentColor"/>
      </svg>
    <% end %>
  </Checkbox.indicator>
</Checkbox.root>

<button type="button" phx-click="toggle_indeterminate">
  Toggle indeterminate
</button>
```

```elixir
def handle_event("toggle_indeterminate", _params, socket) do
  next =
    case socket.assigns.checked do
      "indeterminate" -> false
      _ -> "indeterminate"
    end

  {:noreply, assign(socket, :checked, next)}
end
```

### Decoupling the hidden input

By default, `Checkbox.root` renders a visually hidden `input` for form submission. To recompose, move, or exclude that input, build the checkbox from `trigger` and `bubble_input` instead.

- `Checkbox.trigger` is the interactive button that wraps `Checkbox.indicator`.
- `Checkbox.bubble_input` is the visually hidden input that `Checkbox.root` renders by default. Omit it when you do not need form submission.

Place `trigger` immediately before `bubble_input` so the hook can sync state between them.

```heex
<Checkbox.trigger id="terms" name="terms" class="DemoCheckboxRoot">
  <Checkbox.indicator class="DemoCheckboxIndicator">
    …
  </Checkbox.indicator>
</Checkbox.trigger>
<Checkbox.bubble_input name="terms" />
```

## Accessibility

Adheres to the [tri-state Checkbox WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/checkbox).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">Checks/unchecks the checkbox.</:row>
</.keyboard_table>
