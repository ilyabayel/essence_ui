---
title: Progress
description: Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/meter
---

Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.

<.demo theme="light" variant="primitive" component="progress" css={primitive_css("progress")}>
  <:heex>
    <Progress.root class="ProgressRoot" value={66} aria-label="Progress">
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

Import all parts and piece them together.

```heex
<Progress.root>
  <Progress.indicator />
</Progress.root>
```

<.anatomy>
  <:part name="Root">Contains all of the progress parts.</:part>
  <:part name="Indicator">Shows progress visually and exposes it to assistive technologies.</:part>
</.anatomy>

## API Reference

### Root

Contains all of the progress parts.

<.props_table module={EssenceUI.Primitives.Progress} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"complete | indeterminate | loading"}>Reflects progress state.</:row>
  <:row name="[data-value]" values="The current value">Present when a value is set.</:row>
  <:row name="[data-max]" values="The max value">Present when max is set.</:row>
</.data_attributes_table>

### Indicator

Used to show the progress visually. It also makes progress accessible to assistive technologies.

<.props_table module={EssenceUI.Primitives.Progress} function={:indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"complete | indeterminate | loading"}>Reflects progress state.</:row>
  <:row name="[data-value]" values="The current value">Present when a value is set.</:row>
  <:row name="[data-max]" values="The max value">Present when max is set.</:row>
</.data_attributes_table>

## Accessibility

Adheres to the [`progressbar` role requirements](https://www.w3.org/WAI/ARIA/apg/patterns/meter).
