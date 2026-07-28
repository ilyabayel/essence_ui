---
title: Slider
description: Provides user selection from a range of values.
---

<.demo>
  <:heex code={~S|<.slider id="slider-hero" default_value={[50]} />|}>
      <.slider id="slider-hero" default_value={[50]} />
  </:heex>
</.demo>

## API Reference

This component wraps the Slider primitive and supports common margin props. Use `default_value` for uncontrolled sliders and `value` for controlled state.

<.props_table module={EssenceUI.Components.Slider} function={:slider} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.slider id="slider-size-1" default_value={[25]} size="1" /><.slider id="slider-size-2" default_value={[50]} size="2" /><.slider id="slider-size-3" default_value={[75]} size="3" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.slider id="slider-size-1" default_value={[25]} size="1" />
        <.slider id="slider-size-2" default_value={[50]} size="2" />
        <.slider id="slider-size-3" default_value={[75]} size="3" />
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.slider id="slider-variant-surface" default_value={[25]} variant="surface" /><.slider id="slider-variant-classic" default_value={[50]} variant="classic" /><.slider id="slider-variant-soft" default_value={[75]} variant="soft" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.slider id="slider-variant-surface" default_value={[25]} variant="surface" />
        <.slider id="slider-variant-classic" default_value={[50]} variant="classic" />
        <.slider id="slider-variant-soft" default_value={[75]} variant="soft" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.slider id="slider-color-indigo" default_value={[20]} color="indigo" /><.slider id="slider-color-cyan" default_value={[40]} color="cyan" /><.slider id="slider-color-orange" default_value={[60]} color="orange" /><.slider id="slider-color-crimson" default_value={[80]} color="crimson" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.slider id="slider-color-indigo" default_value={[20]} color="indigo" />
        <.slider id="slider-color-cyan" default_value={[40]} color="cyan" />
        <.slider id="slider-color-orange" default_value={[60]} color="orange" />
        <.slider id="slider-color-crimson" default_value={[80]} color="crimson" />
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast in light mode.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="4"><.slider id="slider-hc-indigo" default_value={[10]} color="indigo" /><.slider id="slider-hc-indigo-contrast" default_value={[10]} color="indigo" high_contrast /><.slider id="slider-hc-cyan" default_value={[30]} color="cyan" /><.slider id="slider-hc-cyan-contrast" default_value={[30]} color="cyan" high_contrast /><.slider id="slider-hc-orange" default_value={[50]} color="orange" /><.slider id="slider-hc-orange-contrast" default_value={[50]} color="orange" high_contrast /><.slider id="slider-hc-crimson" default_value={[70]} color="crimson" /><.slider id="slider-hc-crimson-contrast" default_value={[70]} color="crimson" high_contrast /><.slider id="slider-hc-gray" default_value={[90]} color="gray" /><.slider id="slider-hc-gray-contrast" default_value={[90]} color="gray" high_contrast /></.grid>|}>
      <.grid columns="2" gap="4">
        <.slider id="slider-hc-indigo" default_value={[10]} color="indigo" />
        <.slider id="slider-hc-indigo-contrast" default_value={[10]} color="indigo" high_contrast />
        <.slider id="slider-hc-cyan" default_value={[30]} color="cyan" />
        <.slider id="slider-hc-cyan-contrast" default_value={[30]} color="cyan" high_contrast />
        <.slider id="slider-hc-orange" default_value={[50]} color="orange" />
        <.slider id="slider-hc-orange-contrast" default_value={[50]} color="orange" high_contrast />
        <.slider id="slider-hc-crimson" default_value={[70]} color="crimson" />
        <.slider id="slider-hc-crimson-contrast" default_value={[70]} color="crimson" high_contrast />
        <.slider id="slider-hc-gray" default_value={[90]} color="gray" />
        <.slider id="slider-hc-gray-contrast" default_value={[90]} color="gray" high_contrast />
      </.grid>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.slider id="slider-radius-none" default_value={[25]} radius="none" /><.slider id="slider-radius-small" default_value={[50]} radius="small" /><.slider id="slider-radius-full" default_value={[75]} radius="full" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.slider id="slider-radius-none" default_value={[25]} radius="none" />
        <.slider id="slider-radius-small" default_value={[50]} radius="small" />
        <.slider id="slider-radius-full" default_value={[75]} radius="full" />
      </.flex>
  </:heex>
</.demo>

### Range

Provide multiple values to create a range slider.

<.demo>
  <:heex code={~S|<.slider id="slider-range" default_value={[25, 75]} />|}>
      <.slider id="slider-range" default_value={[25, 75]} />
  </:heex>
</.demo>
