---
title: Toggle
description: A two-state button that can be either on or off.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/button
---

A two-state button that can be either on or off.

<.demo variant="primitive" component="toggle" css={primitive_css("toggle")}>

  <:heex>
    <Toggle.root
              id="toggle-italic"
              class="Toggle"
              aria-label="Toggle italic"
            >
              <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M5.67494 3.50001C5.67494 3.27615 5.85646 3.09463 6.08032 3.09463H10.4197C10.6435 3.09463 10.8251 3.27615 10.8251 3.50001C10.8251 3.72387 10.6435 3.90539 10.4197 3.90539H8.56935L6.23062 11.0946H7.9197C8.14355 11.0946 8.32508 11.2762 8.32508 11.5C8.32508 11.7239 8.14355 11.9054 7.9197 11.9054H3.58032C3.35646 11.9054 3.17494 11.7239 3.17494 11.5C3.17494 11.2762 3.35646 11.0946 3.58032 11.0946H5.43066L7.76939 3.90539H6.08032C5.85646 3.90539 5.67494 3.72387 5.67494 3.50001Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
            </Toggle.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

```heex
<Toggle.root>
</Toggle.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Toggle} function={:root} />

## Examples

See the live demo above and `storybook/primitives/toggle.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/button).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
