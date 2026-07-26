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
                <label
                  id="airplane-mode-label"
                  for="airplane-mode"
                  class="Label"
                  style="padding-right: 15px;"
                >
                  Airplane mode
                </label>
                <Switch.root
                  id="airplane-mode"
                  class="SwitchRoot"
                  aria-labelledby="airplane-mode-label"
                >
                  <Switch.thumb class="SwitchThumb" />
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

```heex
<Switch.root>
  <Switch.trigger />
  <Switch.thumb />
  <Switch.bubble_input />
</Switch.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Thumb">The `thumb` part.</:part>
  <:part name="Bubble Input">The `bubble_input` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Switch} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.Switch} function={:trigger} />

### Thumb

<.props_table module={EssenceUI.Primitives.Switch} function={:thumb} />

### Bubble Input

<.props_table module={EssenceUI.Primitives.Switch} function={:bubble_input} />

## Examples

See the live demo above and `storybook/primitives/switch.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/switch).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
