---
title: Checkbox
description: Base input element to toggle an option on and off.
---

<.demo>
  <:heex code={~S|<.text as="label" size="2"><.flex gap="2"><.checkbox default_checked />Agree to Terms and Conditions</.flex></.text>|}>
      <.text as="label" size="2">
        <.flex gap="2">
          <.checkbox default_checked />
          Agree to Terms and Conditions
        </.flex>
      </.text>
  </:heex>
</.demo>

## API Reference

This component wraps the Checkbox primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Checkbox} function={:checkbox} />

## Examples

### Size

Use the `size` prop to control the size of the checkbox.

<.demo>
  <:heex code={~S|<.flex align="center" gap="2"><.checkbox size="1" default_checked /><.checkbox size="2" default_checked /><.checkbox size="3" default_checked /></.flex>|}>
      <.flex align="center" gap="2">
        <.checkbox size="1" default_checked />
        <.checkbox size="2" default_checked />
        <.checkbox size="3" default_checked />
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the checkbox.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.flex gap="2"><.checkbox variant="surface" default_checked /><.checkbox variant="surface" /></.flex><.flex gap="2"><.checkbox variant="classic" default_checked /><.checkbox variant="classic" /></.flex><.flex gap="2"><.checkbox variant="soft" default_checked /><.checkbox variant="soft" /></.flex></.flex>|}>
      <.flex align="center" gap="4">
        <.flex gap="2">
          <.checkbox variant="surface" default_checked />
          <.checkbox variant="surface" />
        </.flex>
        <.flex gap="2">
          <.checkbox variant="classic" default_checked />
          <.checkbox variant="classic" />
        </.flex>
        <.flex gap="2">
          <.checkbox variant="soft" default_checked />
          <.checkbox variant="soft" />
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.checkbox color="indigo" default_checked /><.checkbox color="cyan" default_checked /><.checkbox color="orange" default_checked /><.checkbox color="crimson" default_checked /></.flex>|}>
      <.flex gap="2">
        <.checkbox color="indigo" default_checked />
        <.checkbox color="cyan" default_checked />
        <.checkbox color="orange" default_checked />
        <.checkbox color="crimson" default_checked />
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="5" display="inline-grid" gap="2"><.checkbox color="indigo" default_checked /><.checkbox color="cyan" default_checked /><.checkbox color="orange" default_checked /><.checkbox color="crimson" default_checked /><.checkbox color="gray" default_checked /><.checkbox color="indigo" default_checked high_contrast /><.checkbox color="cyan" default_checked high_contrast /><.checkbox color="orange" default_checked high_contrast /><.checkbox color="crimson" default_checked high_contrast /><.checkbox color="gray" default_checked high_contrast /></.grid>|}>
      <.grid columns="5" display="inline-grid" gap="2">
        <.checkbox color="indigo" default_checked />
        <.checkbox color="cyan" default_checked />
        <.checkbox color="orange" default_checked />
        <.checkbox color="crimson" default_checked />
        <.checkbox color="gray" default_checked />
        <.checkbox color="indigo" default_checked high_contrast />
        <.checkbox color="cyan" default_checked high_contrast />
        <.checkbox color="orange" default_checked high_contrast />
        <.checkbox color="crimson" default_checked high_contrast />
        <.checkbox color="gray" default_checked high_contrast />
      </.grid>
  </:heex>
</.demo>

### Alignment

Composing `checkbox` within `text` automatically centers it with the first line of text.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text as="label" size="2"><.flex gap="2"><.checkbox size="1" default_checked /> Agree to Terms and Conditions</.flex></.text><.text as="label" size="3"><.flex gap="2"><.checkbox size="2" default_checked /> Agree to Terms and Conditions</.flex></.text><.text as="label" size="4"><.flex gap="2"><.checkbox size="3" default_checked /> Agree to Terms and Conditions</.flex></.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text as="label" size="2">
          <.flex gap="2">
            <.checkbox size="1" default_checked /> Agree to Terms and Conditions
          </.flex>
        </.text>
        <.text as="label" size="3">
          <.flex gap="2">
            <.checkbox size="2" default_checked /> Agree to Terms and Conditions
          </.flex>
        </.text>
        <.text as="label" size="4">
          <.flex gap="2">
            <.checkbox size="3" default_checked /> Agree to Terms and Conditions
          </.flex>
        </.text>
      </.flex>
  </:heex>
</.demo>

It is automatically well-aligned with multi-line text too.

<.demo>
  <:heex code={~S|<.box max_width="300px"><.text as="label" size="3"><.flex gap="2"><.checkbox default_checked /> I understand that these documents are confidential and cannot be shared with a third party.</.flex></.text></.box>|}>
      <.box max_width="300px">
        <.text as="label" size="3">
          <.flex gap="2">
            <.checkbox default_checked /> I understand that these documents are confidential and cannot be shared with a third party.
          </.flex>
        </.text>
      </.box>
  </:heex>
</.demo>

### Disabled

Use the native `disabled` attribute to create a disabled checkbox.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.text as="label" size="2"><.flex gap="2"><.checkbox /> Not checked</.flex></.text><.text as="label" size="2"><.flex gap="2"><.checkbox default_checked /> Checked</.flex></.text><.text as="label" size="2" color="gray"><.flex gap="2"><.checkbox disabled /> Not checked</.flex></.text><.text as="label" size="2" color="gray"><.flex gap="2"><.checkbox disabled default_checked /> Checked</.flex></.text></.flex>|}>
      <.flex direction="column" gap="2">
        <.text as="label" size="2">
          <.flex gap="2">
            <.checkbox /> Not checked
          </.flex>
        </.text>
        <.text as="label" size="2">
          <.flex gap="2">
            <.checkbox default_checked /> Checked
          </.flex>
        </.text>
        <.text as="label" size="2" color="gray">
          <.flex gap="2">
            <.checkbox disabled /> Not checked
          </.flex>
        </.text>
        <.text as="label" size="2" color="gray">
          <.flex gap="2">
            <.checkbox disabled default_checked /> Checked
          </.flex>
        </.text>
      </.flex>
  </:heex>
</.demo>

### Indeterminate

Use the `"indeterminate"` value to create an indeterminate checkbox.

<.demo>
  <:heex code={~S|<.flex gap="2"><.checkbox default_checked="indeterminate" /><.checkbox checked="indeterminate" /></.flex>|}>
      <.flex gap="2">
        <.checkbox default_checked="indeterminate" />
        <.checkbox checked="indeterminate" />
      </.flex>
  </:heex>
</.demo>
