---
title: Progress
description: Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/meter
---

Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.

<.demo variant="primitive" component="progress" css={primitive_css("progress")}>

  <:heex>
    <Progress.root
              class="ProgressRoot"
              value={66}
              aria-label="Progress"
            >
              <Progress.indicator
                class="ProgressIndicator"
                value={66}
                style="transform: translateX(-34%);"
              />
            </Progress.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Provides context for assistive technology to read the progress of a task.</:item>
</.highlights>

## Anatomy

```heex
<Progress.root>
  <Progress.indicator />
</Progress.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Indicator">The `indicator` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Progress} function={:root} />

### Indicator

<.props_table module={EssenceUI.Primitives.Progress} function={:indicator} />

## Examples

See the live demo above and `storybook/primitives/progress.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/meter).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
