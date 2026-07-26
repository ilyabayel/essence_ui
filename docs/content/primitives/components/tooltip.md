---
title: Tooltip
description: A popup that displays information related to an element when it receives focus or is hovered.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/tooltip
---

A popup that displays information related to an element when the element receives keyboard focus or the mouse hovers over it.

<.demo variant="primitive" component="tooltip" css={primitive_css("tooltip")}>

  <:heex>
    <Tooltip.provider delay_duration={100}>
              <Tooltip.root
                id="tooltip-primitive"
                open_delay={100}
                close_delay={0}
              >
                <Tooltip.trigger
                  id="tooltip-trigger"
                  content_id="tooltip-content"
                  class="IconButton"
                  aria-label="Add to library"
                >
                  <svg
                    width="15"
                    height="15"
                    viewBox="0 0 15 15"
                    fill="none"
                    aria-hidden="true"
                  >
                    <path
                      d="M7.5 1v13M1 7.5h13"
                      stroke="currentColor"
                      stroke-width="1.5"
                      stroke-linecap="round"
                    />
                  </svg>
                </Tooltip.trigger>
                <Tooltip.content
                  id="tooltip-content"
                  class="TooltipContent"
                  side_offset={5}
                >
                  Add to library
                  <Tooltip.arrow class="TooltipArrow" />
                </Tooltip.content>
              </Tooltip.root>
            </Tooltip.provider>
  </:heex>
</.demo>

<.highlights>
  <:item>Provider to control display delay globally.</:item>
  <:item>Opens when the trigger is focused or hovered.</:item>
  <:item>Closes when the trigger is activated or when pressing Escape.</:item>
  <:item>Supports custom timings.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Tooltip.provider>
  <Tooltip.root>
    <Tooltip.trigger />
    <Tooltip.content>
      <Tooltip.arrow />
    </Tooltip.content>
  </Tooltip.root>
</Tooltip.provider>
```

<.anatomy>
  <:part name="Provider">Wraps your app to provide global delay defaults.</:part>
  <:part name="Root">Contains all the parts of a tooltip.</:part>
  <:part name="Trigger">The button that toggles the tooltip.</:part>
  <:part name="Portal">Optional portal for content.</:part>
  <:part name="Content">The component that pops out when the tooltip is open.</:part>
  <:part name="Arrow">An optional arrow element.</:part>
</.anatomy>

## API Reference

### Provider

Wraps your app to provide global functionality to your tooltips.

<.props_table module={EssenceUI.Primitives.Tooltip} function={:provider} />

### Root

Contains all the parts of a tooltip.

Use `open` with `on_open_change` for controlled open state in LiveView:

```heex
<Tooltip.root id="info-tooltip" open={@open} on_open_change="tooltip_open_change">
  …
</Tooltip.root>
```

```elixir
def handle_event("tooltip_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open)}
end
```

<.props_table module={EssenceUI.Primitives.Tooltip} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the tooltip is open.</:row>
</.data_attributes_table>

### Trigger

The button that toggles the tooltip. By default, the `Tooltip.content` will position itself against the trigger.

<.props_table module={EssenceUI.Primitives.Tooltip} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the tooltip is open.</:row>
</.data_attributes_table>

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.Tooltip} function={:portal} />

### Content

The component that pops out when the tooltip is open.

<.props_table module={EssenceUI.Primitives.Tooltip} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"closed | delayed-open"}>Reflects whether the tooltip is open. Content uses `delayed-open` when visible.</:row>
  <:row name="[data-side]" values={"top | right | bottom | left"}>Preferred side relative to the trigger.</:row>
  <:row name="[data-align]" values={"start | center | end"}>Alignment along the side.</:row>
</.data_attributes_table>

### Arrow

An optional arrow element to render alongside the tooltip. This can be used to help visually link the trigger with the `Tooltip.content`. Must be rendered inside `Tooltip.content`.

<.props_table module={EssenceUI.Primitives.Tooltip} function={:arrow} />

## Examples

### Configure globally

Use the `Provider` to control `delay_duration` and `skip_delay_duration` globally.

```heex
<Tooltip.provider delay_duration={800} skip_delay_duration={500}>
  <Tooltip.root id="tooltip-a">
    <Tooltip.trigger id="tooltip-a-trigger" content_id="tooltip-a-content">…</Tooltip.trigger>
    <Tooltip.content id="tooltip-a-content">…</Tooltip.content>
  </Tooltip.root>
  <Tooltip.root id="tooltip-b">
    <Tooltip.trigger id="tooltip-b-trigger" content_id="tooltip-b-content">…</Tooltip.trigger>
    <Tooltip.content id="tooltip-b-content">…</Tooltip.content>
  </Tooltip.root>
</Tooltip.provider>
```

### Show instantly

Use the `open_delay` prop to control the time it takes for the tooltip to open.

```heex
<Tooltip.root id="instant-tooltip" open_delay={0}>
  <Tooltip.trigger id="instant-tooltip-trigger" content_id="instant-tooltip-content">…</Tooltip.trigger>
  <Tooltip.content id="instant-tooltip-content">…</Tooltip.content>
</Tooltip.root>
```

### Constrain the content size

You may want to constrain the width of the content. Use standard CSS on the content element:

```css
.TooltipContent {
  max-width: 20ch;
}
```

### Collision-aware animations

Essence exposes `data-side` and `data-align` attributes on content. Their values reflect placement at runtime. Use them to create direction-aware animations:

```heex
<Tooltip.content id="animated-tooltip-content" class="TooltipContent" side_offset={5}>
  …
</Tooltip.content>
```

```css
.TooltipContent {
  animation-duration: 0.6s;
  animation-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}
.TooltipContent[data-side="top"] {
  animation-name: slideUp;
}
.TooltipContent[data-side="bottom"] {
  animation-name: slideDown;
}

@keyframes slideDown {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
```

## Accessibility

Adheres to the [Tooltip WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tooltip).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Tab">Opens/closes the tooltip without delay.</:row>
  <:row keys="Space">If open, closes the tooltip without delay.</:row>
  <:row keys="Enter">If open, closes the tooltip without delay.</:row>
  <:row keys="Escape">If open, closes the tooltip without delay.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by abstracting the primitive parts into your own component.

### Usage

```heex
<.info_tooltip label="Add to library">
  <.icon_button aria-label="Add to library">+</.icon_button>
</.info_tooltip>
```

### Implementation

```elixir
def info_tooltip(assigns) do
  ~H"""
  <Tooltip.root id={@id} open_delay={@open_delay}>
    <Tooltip.trigger id={"#{@id}-trigger"} content_id={"#{@id}-content"} as="div">
      {render_slot(@inner_block)}
    </Tooltip.trigger>
    <Tooltip.content id={"#{@id}-content"} class="TooltipContent" side_offset={5}>
      {@label}
      <Tooltip.arrow class="TooltipArrow" />
    </Tooltip.content>
  </Tooltip.root>
  """
end
```
