---
title: Collapsible
description: An interactive component which expands/collapses a panel.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/disclosure
---

An interactive component which expands/collapses a panel.

<.demo theme="light" variant="primitive" component="collapsible" css={primitive_css("collapsible")}>
  <:heex>
    <Collapsible.root id="collapsible-primitive" class="DemoCollapsibleRoot">
      <div style="display: flex; align-items: center; justify-content: space-between;">
        <span class="DemoText" style="color: white;">
          @peduarte starred 3 repositories
        </span>
        <Collapsible.trigger id="collapsible-trigger" content_id="collapsible-content" class="DemoIconButton" aria-label="Toggle">
          <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
            <path d="M3.5 5.5h8M3.5 9.5h8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
          </svg>
        </Collapsible.trigger>
      </div>

      <div class="DemoRepository">
        <span class="DemoText">@radix-themes/primitives</span>
      </div>

      <Collapsible.content id="collapsible-content">
        <div class="DemoRepository">
          <span class="DemoText">@radix-themes/colors</span>
        </div>
        <div class="DemoRepository">
          <span class="DemoText">@radix-themes/themes</span>
        </div>
      </Collapsible.content>
    </Collapsible.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import the components and piece the parts together.

```heex
<Collapsible.root id="…">
  <Collapsible.trigger content_id="…" />
  <Collapsible.content id="…" />
</Collapsible.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a collapsible.</:part>
  <:part name="Trigger">The button that toggles the collapsible.</:part>
  <:part name="Content">The component that contains the collapsible content.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a collapsible.

Use `open` with `on_open_change` for controlled open state in LiveView:

```heex
<Collapsible.root id="repos" open={@open} on_open_change="collapsible_open_change">
  …
</Collapsible.root>
```

```elixir
def handle_event("collapsible_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open == "true" or open == true)}
end
```

<.props_table module={EssenceUI.Primitives.Collapsible} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the collapsible is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the collapsible is disabled.</:row>
</.data_attributes_table>

### Trigger

The button that toggles the collapsible. Pass `content_id` matching the `id` on `Collapsible.content`.

<.props_table module={EssenceUI.Primitives.Collapsible} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the collapsible is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the collapsible is disabled.</:row>
</.data_attributes_table>

### Content

The component that contains the collapsible content.

<.props_table module={EssenceUI.Primitives.Collapsible} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the collapsible is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the collapsible is disabled.</:row>
</.data_attributes_table>

Essence exposes CSS variables on content for size animations:

| CSS variable | Description |
| --- | --- |
| `--radix-collapsible-content-width` | The width of the content when it opens/closes |
| `--radix-collapsible-content-height` | The height of the content when it opens/closes |

## Examples

### Animating content size

Use the `--radix-collapsible-content-width` and/or `--radix-collapsible-content-height` CSS variables to animate the size of the content when it opens/closes:

```heex
<Collapsible.content id="collapsible-animated-content" class="DemoCollapsibleContent">
  …
</Collapsible.content>
```

```css
.DemoCollapsibleContent {
  overflow: hidden;
}
.DemoCollapsibleContent[data-state="open"] {
  animation: demoCollapsibleSlideDown 300ms ease-out;
}
.DemoCollapsibleContent[data-state="closed"] {
  animation: demoCollapsibleSlideUp 300ms ease-out;
}

@keyframes demoCollapsibleSlideDown {
  from { height: 0; }
  to { height: var(--radix-collapsible-content-height); }
}

@keyframes demoCollapsibleSlideUp {
  from { height: var(--radix-collapsible-content-height); }
  to { height: 0; }
}
```

## Accessibility

Adheres to the [Disclosure WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">Opens/closes the collapsible.</:row>
  <:row keys="Enter">Opens/closes the collapsible.</:row>
</.keyboard_table>
