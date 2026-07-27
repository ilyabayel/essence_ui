---
title: Checkbox Group
description: Set of interactive buttons where multiple options can be selected at a time.
---

<.demo>
  <:heex code={~S|<.checkbox_group default_value={["1"]} name="checkbox-group-hero"><:item value="1">Fun</:item><:item value="2">Serious</:item><:item value="3">Smart</:item></.checkbox_group>|}>
      <.checkbox_group default_value={["1"]} name="checkbox-group-hero">
        <:item value="1">Fun</:item>
        <:item value="2">Serious</:item>
        <:item value="3">Smart</:item>
      </.checkbox_group>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

### Root

Contains all the parts of a checkbox group.

<.props_table module={EssenceUI.Components.CheckboxGroup} function={:checkbox_group_root} />

Slot convenience (same props, maps `<:item>` into root + items):

<.props_table module={EssenceUI.Components.CheckboxGroup} function={:checkbox_group} />

### Item

An item in the group that can be checked.

<.props_table module={EssenceUI.Components.CheckboxGroup} function={:checkbox_group_item} />

```heex
<.checkbox_group_root id="traits" name="traits" default_value={["1"]}>
  <.checkbox_group_item value="1" checked>Fun</.checkbox_group_item>
  <.checkbox_group_item value="2" disabled>Serious</.checkbox_group_item>
</.checkbox_group_root>
```

Or with slots:

```heex
<.checkbox_group name="traits" default_value={["1"]}>
  <:item value="1">Fun</:item>
  <:item value="2" disabled>Serious</:item>
</.checkbox_group>
```

## Examples

### Size

Use the `size` prop to control the checkbox size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="2"><.checkbox_group size="1" default_value={["1"]} name="cg-size-1"><:item value="1"></:item></.checkbox_group><.checkbox_group size="2" default_value={["2"]} name="cg-size-2"><:item value="2"></:item></.checkbox_group><.checkbox_group size="3" default_value={["3"]} name="cg-size-3"><:item value="3"></:item></.checkbox_group></.flex>|}>
      <.flex align="center" gap="2">
        <.checkbox_group size="1" default_value={["1"]} name="cg-size-1">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group size="2" default_value={["2"]} name="cg-size-2">
          <:item value="2"></:item>
        </.checkbox_group>
        <.checkbox_group size="3" default_value={["3"]} name="cg-size-3">
          <:item value="3"></:item>
        </.checkbox_group>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the checkboxes.

<.demo>
  <:heex code={~S|<.flex gap="2"><.checkbox_group variant="surface" default_value={["1"]} name="cg-variant-surface"><:item value="1"></:item><:item value="2"></:item></.checkbox_group><.checkbox_group variant="classic" default_value={["1"]} name="cg-variant-classic"><:item value="1"></:item><:item value="2"></:item></.checkbox_group><.checkbox_group variant="soft" default_value={["1"]} name="cg-variant-soft"><:item value="1"></:item><:item value="2"></:item></.checkbox_group></.flex>|}>
      <.flex gap="2">
        <.checkbox_group variant="surface" default_value={["1"]} name="cg-variant-surface">
          <:item value="1"></:item>
          <:item value="2"></:item>
        </.checkbox_group>
        <.checkbox_group variant="classic" default_value={["1"]} name="cg-variant-classic">
          <:item value="1"></:item>
          <:item value="2"></:item>
        </.checkbox_group>
        <.checkbox_group variant="soft" default_value={["1"]} name="cg-variant-soft">
          <:item value="1"></:item>
          <:item value="2"></:item>
        </.checkbox_group>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.checkbox_group color="indigo" default_value={["1"]} name="cg-color-indigo"><:item value="1"></:item></.checkbox_group><.checkbox_group color="cyan" default_value={["1"]} name="cg-color-cyan"><:item value="1"></:item></.checkbox_group><.checkbox_group color="orange" default_value={["1"]} name="cg-color-orange"><:item value="1"></:item></.checkbox_group><.checkbox_group color="crimson" default_value={["1"]} name="cg-color-crimson"><:item value="1"></:item></.checkbox_group></.flex>|}>
      <.flex gap="2">
        <.checkbox_group color="indigo" default_value={["1"]} name="cg-color-indigo">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="cyan" default_value={["1"]} name="cg-color-cyan">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="orange" default_value={["1"]} name="cg-color-orange">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="crimson" default_value={["1"]} name="cg-color-crimson">
          <:item value="1"></:item>
        </.checkbox_group>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid rows="2" gap="2" display="inline-grid" flow="column"><.checkbox_group color="indigo" default_value={["1"]} name="cg-hc-indigo"><:item value="1"></:item></.checkbox_group><.checkbox_group color="indigo" default_value={["1"]} high_contrast name="cg-hc-indigo-contrast"><:item value="1"></:item></.checkbox_group><.checkbox_group color="cyan" default_value={["1"]} name="cg-hc-cyan"><:item value="1"></:item></.checkbox_group><.checkbox_group color="cyan" default_value={["1"]} high_contrast name="cg-hc-cyan-contrast"><:item value="1"></:item></.checkbox_group><.checkbox_group color="orange" default_value={["1"]} name="cg-hc-orange"><:item value="1"></:item></.checkbox_group><.checkbox_group color="orange" default_value={["1"]} high_contrast name="cg-hc-orange-contrast"><:item value="1"></:item></.checkbox_group><.checkbox_group color="crimson" default_value={["1"]} name="cg-hc-crimson"><:item value="1"></:item></.checkbox_group><.checkbox_group color="crimson" default_value={["1"]} high_contrast name="cg-hc-crimson-contrast"><:item value="1"></:item></.checkbox_group><.checkbox_group color="gray" default_value={["1"]} name="cg-hc-gray"><:item value="1"></:item></.checkbox_group><.checkbox_group color="gray" default_value={["1"]} high_contrast name="cg-hc-gray-contrast"><:item value="1"></:item></.checkbox_group></.grid>|}>
      <.grid rows="2" gap="2" display="inline-grid" flow="column">
        <.checkbox_group color="indigo" default_value={["1"]} name="cg-hc-indigo">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="indigo" default_value={["1"]} high_contrast name="cg-hc-indigo-contrast">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="cyan" default_value={["1"]} name="cg-hc-cyan">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="cyan" default_value={["1"]} high_contrast name="cg-hc-cyan-contrast">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="orange" default_value={["1"]} name="cg-hc-orange">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="orange" default_value={["1"]} high_contrast name="cg-hc-orange-contrast">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="crimson" default_value={["1"]} name="cg-hc-crimson">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="crimson" default_value={["1"]} high_contrast name="cg-hc-crimson-contrast">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="gray" default_value={["1"]} name="cg-hc-gray">
          <:item value="1"></:item>
        </.checkbox_group>
        <.checkbox_group color="gray" default_value={["1"]} high_contrast name="cg-hc-gray-contrast">
          <:item value="1"></:item>
        </.checkbox_group>
      </.grid>
  </:heex>
</.demo>

### Disabled

Use the native `disabled` attribute to create a disabled checkbox.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.checkbox_group default_value={["2"]} name="cg-disabled-enabled"><:item value="1">Off</:item><:item value="2">On</:item></.checkbox_group><.checkbox_group default_value={["2"]} name="cg-disabled-items"><:item value="1" disabled>Off</:item><:item value="2" disabled>On</:item></.checkbox_group></.flex>|}>
      <.flex direction="column" gap="2">
        <.checkbox_group default_value={["2"]} name="cg-disabled-enabled">
          <:item value="1">Off</:item>
          <:item value="2">On</:item>
        </.checkbox_group>
        <.checkbox_group default_value={["2"]} name="cg-disabled-items">
          <:item value="1" disabled>Off</:item>
          <:item value="2" disabled>On</:item>
        </.checkbox_group>
      </.flex>
  </:heex>
</.demo>
