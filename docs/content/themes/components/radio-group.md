---
title: Radio Group
description: Set of interactive radio buttons where only one can be selected at a time.
---

<.demo>
  <:heex code={~S|<.radio_group_root id="radio-group-hero" default_value="1" name="radio-group-hero"><.radio_group_item value="1">Default</.radio_group_item><.radio_group_item value="2">Comfortable</.radio_group_item><.radio_group_item value="3">Compact</.radio_group_item></.radio_group_root>|}>
      <.radio_group_root id="radio-group-hero" default_value="1" name="radio-group-hero">
        <.radio_group_item value="1">Default</.radio_group_item>
        <.radio_group_item value="2">Comfortable</.radio_group_item>
        <.radio_group_item value="3">Compact</.radio_group_item>
      </.radio_group_root>
  </:heex>
</.demo>

## API Reference

This component wraps the Radio Group primitive and supports common margin props.

### Root

Contains all the parts of a radio group.

<.props_table module={EssenceUI.Components.RadioGroup} function={:radio_group_root} />

### Item

An item in the group that can be checked.

<.props_table module={EssenceUI.Components.RadioGroup} function={:radio_group_item} />

## Examples

### Size

Use the `size` prop to control the radiobutton size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="2"><.radio_group_root id="radio-group-size-1" size="1" default_value="1"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-size-2" size="2" default_value="1"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-size-3" size="3" default_value="1"><.radio_group_item value="1" /></.radio_group_root></.flex>|}>
      <.flex align="center" gap="2">
        <.radio_group_root id="radio-group-size-1" size="1" default_value="1">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-size-2" size="2" default_value="1">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-size-3" size="3" default_value="1">
          <.radio_group_item value="1" />
        </.radio_group_root>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the radio buttons.

<.demo>
  <:heex code={~S|<.flex gap="2"><.radio_group_root id="radio-group-variant-surface" variant="surface" default_value="1" name="rg-variant-surface"><.radio_group_item value="1" /><.radio_group_item value="2" /></.radio_group_root><.radio_group_root id="radio-group-variant-classic" variant="classic" default_value="1" name="rg-variant-classic"><.radio_group_item value="1" /><.radio_group_item value="2" /></.radio_group_root><.radio_group_root id="radio-group-variant-soft" variant="soft" default_value="1" name="rg-variant-soft"><.radio_group_item value="1" /><.radio_group_item value="2" /></.radio_group_root></.flex>|}>
      <.flex gap="2">
        <.radio_group_root id="radio-group-variant-surface" variant="surface" default_value="1" name="rg-variant-surface">
          <.radio_group_item value="1" />
          <.radio_group_item value="2" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-variant-classic" variant="classic" default_value="1" name="rg-variant-classic">
          <.radio_group_item value="1" />
          <.radio_group_item value="2" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-variant-soft" variant="soft" default_value="1" name="rg-variant-soft">
          <.radio_group_item value="1" />
          <.radio_group_item value="2" />
        </.radio_group_root>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.radio_group_root id="radio-group-color-indigo" color="indigo" default_value="1" name="rg-color-indigo"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-color-cyan" color="cyan" default_value="1" name="rg-color-cyan"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-color-orange" color="orange" default_value="1" name="rg-color-orange"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-color-crimson" color="crimson" default_value="1" name="rg-color-crimson"><.radio_group_item value="1" /></.radio_group_root></.flex>|}>
      <.flex gap="2">
        <.radio_group_root id="radio-group-color-indigo" color="indigo" default_value="1" name="rg-color-indigo">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-color-cyan" color="cyan" default_value="1" name="rg-color-cyan">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-color-orange" color="orange" default_value="1" name="rg-color-orange">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-color-crimson" color="crimson" default_value="1" name="rg-color-crimson">
          <.radio_group_item value="1" />
        </.radio_group_root>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid rows="2" gap="2" display="inline-grid" flow="column"><.radio_group_root id="radio-group-hc-indigo" color="indigo" default_value="1" name="rg-hc-indigo"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-indigo-contrast" color="indigo" default_value="1" high_contrast name="rg-hc-indigo-contrast"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-cyan" color="cyan" default_value="1" name="rg-hc-cyan"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-cyan-contrast" color="cyan" default_value="1" high_contrast name="rg-hc-cyan-contrast"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-orange" color="orange" default_value="1" name="rg-hc-orange"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-orange-contrast" color="orange" default_value="1" high_contrast name="rg-hc-orange-contrast"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-crimson" color="crimson" default_value="1" name="rg-hc-crimson"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-crimson-contrast" color="crimson" default_value="1" high_contrast name="rg-hc-crimson-contrast"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-gray" color="gray" default_value="1" name="rg-hc-gray"><.radio_group_item value="1" /></.radio_group_root><.radio_group_root id="radio-group-hc-gray-contrast" color="gray" default_value="1" high_contrast name="rg-hc-gray-contrast"><.radio_group_item value="1" /></.radio_group_root></.grid>|}>
      <.grid rows="2" gap="2" display="inline-grid" flow="column">
        <.radio_group_root id="radio-group-hc-indigo" color="indigo" default_value="1" name="rg-hc-indigo">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-indigo-contrast" color="indigo" default_value="1" high_contrast name="rg-hc-indigo-contrast">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-cyan" color="cyan" default_value="1" name="rg-hc-cyan">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-cyan-contrast" color="cyan" default_value="1" high_contrast name="rg-hc-cyan-contrast">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-orange" color="orange" default_value="1" name="rg-hc-orange">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-orange-contrast" color="orange" default_value="1" high_contrast name="rg-hc-orange-contrast">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-crimson" color="crimson" default_value="1" name="rg-hc-crimson">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-crimson-contrast" color="crimson" default_value="1" high_contrast name="rg-hc-crimson-contrast">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-gray" color="gray" default_value="1" name="rg-hc-gray">
          <.radio_group_item value="1" />
        </.radio_group_root>
        <.radio_group_root id="radio-group-hc-gray-contrast" color="gray" default_value="1" high_contrast name="rg-hc-gray-contrast">
          <.radio_group_item value="1" />
        </.radio_group_root>
      </.grid>
  </:heex>
</.demo>

### Disabled

Use the native `disabled` attribute to create a disabled radiobutton.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.radio_group_root id="radio-group-disabled-enabled" default_value="2" name="rg-disabled-enabled"><.radio_group_item value="1">Off</.radio_group_item><.radio_group_item value="2">On</.radio_group_item></.radio_group_root><.radio_group_root id="radio-group-disabled-items" default_value="2" name="rg-disabled-items"><.radio_group_item value="1" disabled>Off</.radio_group_item><.radio_group_item value="2" disabled>On</.radio_group_item></.radio_group_root></.flex>|}>
      <.flex direction="column" gap="2">
        <.radio_group_root id="radio-group-disabled-enabled" default_value="2" name="rg-disabled-enabled">
          <.radio_group_item value="1">Off</.radio_group_item>
          <.radio_group_item value="2">On</.radio_group_item>
        </.radio_group_root>
        <.radio_group_root id="radio-group-disabled-items" default_value="2" name="rg-disabled-items">
          <.radio_group_item value="1" disabled>Off</.radio_group_item>
          <.radio_group_item value="2" disabled>On</.radio_group_item>
        </.radio_group_root>
      </.flex>
  </:heex>
</.demo>
