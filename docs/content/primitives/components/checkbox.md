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
                <Checkbox.root
                  class="CheckboxRoot"
                  default_checked
                  id="c1"
                >
                  <Checkbox.indicator class="CheckboxIndicator">
                    <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                  </Checkbox.indicator>
                </Checkbox.root>
                <label
                  class="Label"
                  for="c1"
                >
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

```heex
<Checkbox.root>
  <Checkbox.trigger />
  <Checkbox.indicator />
  <Checkbox.bubble_input />
</Checkbox.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Indicator">The `indicator` part.</:part>
  <:part name="Bubble Input">The `bubble_input` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Checkbox} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.Checkbox} function={:trigger} />

### Indicator

<.props_table module={EssenceUI.Primitives.Checkbox} function={:indicator} />

### Bubble Input

<.props_table module={EssenceUI.Primitives.Checkbox} function={:bubble_input} />

## Examples

See the live demo above and `storybook/primitives/checkbox.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/checkbox).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
