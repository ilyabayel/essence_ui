---
title: Switch
description: Toggle switch alternative to the checkbox.
---

<.demo>
  <:heex code={~S|<.switch id="switch-hero" default_checked />|}>
      <.switch id="switch-hero" default_checked />
  </:heex>
</.demo>

## API Reference

This component wraps the Switch primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Switch} function={:switch} />

## Examples

### Size

Use the `size` prop to control the size of the switch.

<.demo>
  <:heex code={~S|<.flex align="center" gap="2"><.switch id="switch-size-1" size="1" default_checked /><.switch id="switch-size-2" size="2" default_checked /><.switch id="switch-size-3" size="3" default_checked /></.flex>|}>
      <.flex align="center" gap="2">
        <.switch id="switch-size-1" size="1" default_checked />
        <.switch id="switch-size-2" size="2" default_checked />
        <.switch id="switch-size-3" size="3" default_checked />
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the switch.

<.demo>
  <:heex code={~S|<.flex gap="2"><.flex direction="column" gap="3"><.switch id="switch-variant-surface-off" variant="surface" /><.switch id="switch-variant-classic-off" variant="classic" /><.switch id="switch-variant-soft-off" variant="soft" /></.flex><.flex direction="column" gap="3"><.switch id="switch-variant-surface-on" variant="surface" default_checked /><.switch id="switch-variant-classic-on" variant="classic" default_checked /><.switch id="switch-variant-soft-on" variant="soft" default_checked /></.flex></.flex>|}>
      <.flex gap="2">
        <.flex direction="column" gap="3">
          <.switch id="switch-variant-surface-off" variant="surface" />
          <.switch id="switch-variant-classic-off" variant="classic" />
          <.switch id="switch-variant-soft-off" variant="soft" />
        </.flex>
        <.flex direction="column" gap="3">
          <.switch id="switch-variant-surface-on" variant="surface" default_checked />
          <.switch id="switch-variant-classic-on" variant="classic" default_checked />
          <.switch id="switch-variant-soft-on" variant="soft" default_checked />
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.switch id="switch-color-indigo" color="indigo" default_checked /><.switch id="switch-color-cyan" color="cyan" default_checked /><.switch id="switch-color-orange" color="orange" default_checked /><.switch id="switch-color-crimson" color="crimson" default_checked /></.flex>|}>
      <.flex gap="2">
        <.switch id="switch-color-indigo" color="indigo" default_checked />
        <.switch id="switch-color-cyan" color="cyan" default_checked />
        <.switch id="switch-color-orange" color="orange" default_checked />
        <.switch id="switch-color-crimson" color="crimson" default_checked />
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast in light mode.

<.demo>
  <:heex code={~S|<.grid rows="2" gap_x="2" gap_y="3" display="inline-grid" flow="column"><.switch id="switch-hc-indigo" color="indigo" default_checked /><.switch id="switch-hc-indigo-contrast" color="indigo" default_checked high_contrast /><.switch id="switch-hc-cyan" color="cyan" default_checked /><.switch id="switch-hc-cyan-contrast" color="cyan" default_checked high_contrast /><.switch id="switch-hc-orange" color="orange" default_checked /><.switch id="switch-hc-orange-contrast" color="orange" default_checked high_contrast /><.switch id="switch-hc-crimson" color="crimson" default_checked /><.switch id="switch-hc-crimson-contrast" color="crimson" default_checked high_contrast /><.switch id="switch-hc-gray" color="gray" default_checked /><.switch id="switch-hc-gray-contrast" color="gray" default_checked high_contrast /></.grid>|}>
      <.grid rows="2" gap_x="2" gap_y="3" display="inline-grid" flow="column">
        <.switch id="switch-hc-indigo" color="indigo" default_checked />
        <.switch id="switch-hc-indigo-contrast" color="indigo" default_checked high_contrast />
        <.switch id="switch-hc-cyan" color="cyan" default_checked />
        <.switch id="switch-hc-cyan-contrast" color="cyan" default_checked high_contrast />
        <.switch id="switch-hc-orange" color="orange" default_checked />
        <.switch id="switch-hc-orange-contrast" color="orange" default_checked high_contrast />
        <.switch id="switch-hc-crimson" color="crimson" default_checked />
        <.switch id="switch-hc-crimson-contrast" color="crimson" default_checked high_contrast />
        <.switch id="switch-hc-gray" color="gray" default_checked />
        <.switch id="switch-hc-gray-contrast" color="gray" default_checked high_contrast />
      </.grid>
  </:heex>
</.demo>

### Alignment

Composing `Switch` within `Text` automatically centers it with the first line of text.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text as="label" size="2"><.flex gap="2"><.switch id="switch-align-1" size="1" default_checked /> Sync settings</.flex></.text><.text as="label" size="3"><.flex gap="2"><.switch id="switch-align-2" size="2" default_checked /> Sync settings</.flex></.text><.text as="label" size="4"><.flex gap="2"><.switch id="switch-align-3" size="3" default_checked /> Sync settings</.flex></.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text as="label" size="2">
          <.flex gap="2">
            <.switch id="switch-align-1" size="1" default_checked /> Sync settings
          </.flex>
        </.text>
        <.text as="label" size="3">
          <.flex gap="2">
            <.switch id="switch-align-2" size="2" default_checked /> Sync settings
          </.flex>
        </.text>
        <.text as="label" size="4">
          <.flex gap="2">
            <.switch id="switch-align-3" size="3" default_checked /> Sync settings
          </.flex>
        </.text>
      </.flex>
  </:heex>
</.demo>

It is automatically well-aligned with multi-line text too.

### Disabled

Use the native `disabled` attribute to create a disabled switch.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.text as="label" size="2"><.flex gap="2"><.switch id="switch-disabled-off" size="1" /> Off</.flex></.text><.text as="label" size="2"><.flex gap="2"><.switch id="switch-disabled-on" size="1" default_checked /> On</.flex></.text><.text as="label" size="2" color="gray"><.flex gap="2"><.switch id="switch-disabled-off-locked" size="1" disabled /> On</.flex></.text><.text as="label" size="2" color="gray"><.flex gap="2"><.switch id="switch-disabled-on-locked" size="1" disabled default_checked /> Off</.flex></.text></.flex>|}>
      <.flex direction="column" gap="2">
        <.text as="label" size="2">
          <.flex gap="2">
            <.switch id="switch-disabled-off" size="1" /> Off
          </.flex>
        </.text>
        <.text as="label" size="2">
          <.flex gap="2">
            <.switch id="switch-disabled-on" size="1" default_checked /> On
          </.flex>
        </.text>
        <.text as="label" size="2" color="gray">
          <.flex gap="2">
            <.switch id="switch-disabled-off-locked" size="1" disabled /> On
          </.flex>
        </.text>
        <.text as="label" size="2" color="gray">
          <.flex gap="2">
            <.switch id="switch-disabled-on-locked" size="1" disabled default_checked /> Off
          </.flex>
        </.text>
      </.flex>
  </:heex>
</.demo>
