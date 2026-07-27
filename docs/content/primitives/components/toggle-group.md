---
title: Toggle Group
description: A set of two-state buttons that can be toggled on or off.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/button
---

A set of two-state buttons that can be toggled on or off.

<.demo theme="light" variant="primitive" component="toggle-group" css={primitive_css("toggle-group")}>
  <:heex>
    <ToggleGroup.root id="toggle-group-primitive" type="single" value="center" class="DemoToggleGroup" aria-label="Text alignment">
      <ToggleGroup.item class="DemoToggleGroupItem" value="left" aria-label="Left aligned">
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM2 7.5C2 7.22386 2.22386 7 2.5 7H7.5C7.77614 7 8 7.22386 8 7.5C8 7.77614 7.77614 8 7.5 8H2.5C2.22386 8 2 7.77614 2 7.5ZM2 10.5C2 10.2239 2.22386 10 2.5 10H10.5C10.7761 10 11 10.2239 11 10.5C11 10.7761 10.7761 11 10.5 11H2.5C2.22386 11 2 10.7761 2 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
      </ToggleGroup.item>
      <ToggleGroup.item class="DemoToggleGroupItem" value="center" aria-label="Center aligned">
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM4 7.5C4 7.22386 4.22386 7 4.5 7H10.5C10.7761 7 11 7.22386 11 7.5C11 7.77614 10.7761 8 10.5 8H4.5C4.22386 8 4 7.77614 4 7.5ZM3 10.5C3 10.2239 3.22386 10 3.5 10H11.5C11.7761 10 12 10.2239 12 10.5C12 10.7761 11.7761 11 11.5 11H3.5C3.22386 11 3 10.7761 3 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
      </ToggleGroup.item>
      <ToggleGroup.item class="DemoToggleGroupItem" value="right" aria-label="Right aligned">
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM7 7.5C7 7.22386 7.22386 7 7.5 7H12.5C12.7761 7 13 7.22386 13 7.5C13 7.77614 12.7761 8 12.5 8H7.5C7.22386 8 7 7.77614 7 7.5ZM4 10.5C4 10.2239 4.22386 10 4.5 10H12.5C12.7761 10 13 10.2239 13 10.5C13 10.7761 12.7761 11 12.5 11H4.5C4.22386 11 4 10.7761 4 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
      </ToggleGroup.item>
    </ToggleGroup.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Supports horizontal/vertical orientation.</:item>
  <:item>Support single and multiple pressed buttons.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<ToggleGroup.root id="…" type="single">
  <ToggleGroup.item value="…" />
</ToggleGroup.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a toggle group.</:part>
  <:part name="Item">An item in the group.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a toggle group.

When `type` is `"single"`, pass a string to `value`. When `type` is `"multiple"`, pass a list of strings.

Use `value` with `on_value_change` for controlled state in LiveView:

```heex
<ToggleGroup.root id="alignment" type="single" value={@value} on_value_change="toggle_group_value_change">
  …
</ToggleGroup.root>
```

```elixir
def handle_event("toggle_group_value_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :value, value)}
end
```

For `type="multiple"`, the event payload is `%{"value" => values}` where `values` is a list of strings.

<.props_table module={EssenceUI.Primitives.ToggleGroup} function={:root} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the toggle group.</:row>
</.data_attributes_table>

### Item

An item in the group.

<.props_table module={EssenceUI.Primitives.ToggleGroup} function={:item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"on | off"}>Reflects whether the item is pressed.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the toggle group.</:row>
</.data_attributes_table>

## Examples

### Ensuring there is always a value

Control the component in LiveView and ignore deselection events so a value is always selected. In single mode, clicking the active item would otherwise clear the selection.

```heex
<ToggleGroup.root
  id="alignment-controlled"
  type="single"
  value={@value}
  on_value_change="toggle_group_value_change"
  class="DemoToggleGroup"
>
  <ToggleGroup.item class="DemoToggleGroupItem" value="left" aria-label="Left aligned">…</ToggleGroup.item>
  <ToggleGroup.item class="DemoToggleGroupItem" value="center" aria-label="Center aligned">…</ToggleGroup.item>
  <ToggleGroup.item class="DemoToggleGroupItem" value="right" aria-label="Right aligned">…</ToggleGroup.item>
</ToggleGroup.root>
```

```elixir
def handle_event("toggle_group_value_change", %{"value" => value}, socket) do
  if value do
    {:noreply, assign(socket, :value, value)}
  else
    {:noreply, socket}
  end
end
```

## Accessibility

Uses [roving tabindex](https://www.w3.org/TR/wai-aria-practices-1.2/examples/radio/radio.html) to manage focus movement among items.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Tab">Moves focus to either the pressed item or the first item in the group.</:row>
  <:row keys="Space">Activates/deactivates the item.</:row>
  <:row keys="Enter">Activates/deactivates the item.</:row>
  <:row keys="ArrowDown">Moves focus to the next item in the group.</:row>
  <:row keys="ArrowRight">Moves focus to the next item in the group.</:row>
  <:row keys="ArrowUp">Moves focus to the previous item in the group.</:row>
  <:row keys="ArrowLeft">Moves focus to the previous item in the group.</:row>
  <:row keys="Home">Moves focus to the first item.</:row>
  <:row keys="End">Moves focus to the last item.</:row>
</.keyboard_table>
