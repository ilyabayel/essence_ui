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

<.props_table module={EssenceUI.Primitives.Tooltip} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the tooltip is open.</:row>
</.data_attributes_table>

### Trigger

The button that toggles the tooltip. Content positions against the trigger.

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
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the tooltip is open.</:row>
  <:row name="[data-side]" values={"top | right | bottom | left"}>Preferred side relative to the trigger.</:row>
  <:row name="[data-align]" values={"start | center | end"}>Alignment along the side.</:row>
</.data_attributes_table>

### Arrow

An optional arrow element to render alongside the content.

<.props_table module={EssenceUI.Primitives.Tooltip} function={:arrow} />

## Examples

### Configure globally

Use `Provider` once near the root of your LiveView or layout:

```heex
<Tooltip.provider delay_duration={200} skip_delay_duration={100}>
  {@inner_content}
</Tooltip.provider>
```

### Instant open

Override delay on a single tooltip:

```heex
<Tooltip.root id="instant" open_delay={0}>
  …
</Tooltip.root>
```

### Constrain size

```css
.TooltipContent {
  max-width: 20ch;
}
```

### Animations

Animate with CSS against `data-state` (see the [animation](/primitives/docs/guides/animation) guide):

```css
.TooltipContent[data-state="open"] {
  animation: fadeIn 150ms ease-out;
}
```

## Accessibility

Adheres to the [Tooltip WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tooltip).

<.keyboard_table>
  <:row keys="Tab">Opens/closes the tooltip when focus moves to/from the trigger.</:row>
  <:row keys="Space">If open, closes the tooltip when activating the trigger.</:row>
  <:row keys="Enter">If open, closes the tooltip when activating the trigger.</:row>
  <:row keys="Escape">Closes the tooltip and returns focus if needed.</:row>
</.keyboard_table>

## Custom APIs

Wrap Provider + Root + Trigger + Content into a single component for your design system.

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
    <Tooltip.trigger id={"#{@id}-trigger"} content_id={"#{@id}-content"}>
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
