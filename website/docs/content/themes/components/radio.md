---
title: Radio
description: Standalone radio button that can be used in any layout.
---

<.demo>
  <:heex code={~S|<.flex align="start" direction="column" gap="1"><.text as="label" size="2"><.flex gap="2"><.radio name="radio-hero" value="1" default_checked />Default</.flex></.text><.text as="label" size="2"><.flex gap="2"><.radio name="radio-hero" value="2" />Comfortable</.flex></.text><.text as="label" size="2"><.flex gap="2"><.radio name="radio-hero" value="3" />Compact</.flex></.text></.flex>|}>
      <.flex align="start" direction="column" gap="1">
        <.text as="label" size="2">
          <.flex gap="2">
            <.radio name="radio-hero" value="1" default_checked />
            Default
          </.flex>
        </.text>
        <.text as="label" size="2">
          <.flex gap="2">
            <.radio name="radio-hero" value="2" />
            Comfortable
          </.flex>
        </.text>
        <.text as="label" size="2">
          <.flex gap="2">
            <.radio name="radio-hero" value="3" />
            Compact
          </.flex>
        </.text>
      </.flex>
  </:heex>
</.demo>

## API Reference

This component is based on the `input` element and supports common margin props.

<.props_table module={EssenceUI.Components.Radio} function={:radio} />

## Examples

### Size

Use the `size` prop to control the radio button size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.flex gap="2"><.radio size="1" name="radio-size-1" value="1" default_checked /><.radio size="1" name="radio-size-1" value="2" /></.flex><.flex gap="2"><.radio size="2" name="radio-size-2" value="1" default_checked /><.radio size="2" name="radio-size-2" value="2" /></.flex><.flex gap="2"><.radio size="3" name="radio-size-3" value="1" default_checked /><.radio size="3" name="radio-size-3" value="2" /></.flex></.flex>|}>
      <.flex align="center" gap="4">
        <.flex gap="2">
          <.radio size="1" name="radio-size-1" value="1" default_checked />
          <.radio size="1" name="radio-size-1" value="2" />
        </.flex>
        <.flex gap="2">
          <.radio size="2" name="radio-size-2" value="1" default_checked />
          <.radio size="2" name="radio-size-2" value="2" />
        </.flex>
        <.flex gap="2">
          <.radio size="3" name="radio-size-3" value="1" default_checked />
          <.radio size="3" name="radio-size-3" value="2" />
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the radio buttons.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.flex gap="2"><.radio variant="surface" name="radio-variant-surface" value="1" default_checked /><.radio variant="surface" name="radio-variant-surface" value="2" /></.flex><.flex gap="2"><.radio variant="classic" name="radio-variant-classic" value="1" default_checked /><.radio variant="classic" name="radio-variant-classic" value="2" /></.flex><.flex gap="2"><.radio variant="soft" name="radio-variant-soft" value="1" default_checked /><.radio variant="soft" name="radio-variant-soft" value="2" /></.flex></.flex>|}>
      <.flex align="center" gap="4">
        <.flex gap="2">
          <.radio variant="surface" name="radio-variant-surface" value="1" default_checked />
          <.radio variant="surface" name="radio-variant-surface" value="2" />
        </.flex>
        <.flex gap="2">
          <.radio variant="classic" name="radio-variant-classic" value="1" default_checked />
          <.radio variant="classic" name="radio-variant-classic" value="2" />
        </.flex>
        <.flex gap="2">
          <.radio variant="soft" name="radio-variant-soft" value="1" default_checked />
          <.radio variant="soft" name="radio-variant-soft" value="2" />
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.radio color="indigo" name="radio-color-indigo" value="1" default_checked /><.radio color="cyan" name="radio-color-cyan" value="1" default_checked /><.radio color="orange" name="radio-color-orange" value="1" default_checked /><.radio color="crimson" name="radio-color-crimson" value="1" default_checked /></.flex>|}>
      <.flex gap="2">
        <.radio color="indigo" name="radio-color-indigo" value="1" default_checked />
        <.radio color="cyan" name="radio-color-cyan" value="1" default_checked />
        <.radio color="orange" name="radio-color-orange" value="1" default_checked />
        <.radio color="crimson" name="radio-color-crimson" value="1" default_checked />
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="5" display="inline-grid" gap="2"><.radio color="indigo" name="radio-hc-indigo" value="1" default_checked /><.radio color="cyan" name="radio-hc-cyan" value="1" default_checked /><.radio color="orange" name="radio-hc-orange" value="1" default_checked /><.radio color="crimson" name="radio-hc-crimson" value="1" default_checked /><.radio color="gray" name="radio-hc-gray" value="1" default_checked /><.radio color="indigo" name="radio-hc-indigo-contrast" value="1" default_checked high_contrast /><.radio color="cyan" name="radio-hc-cyan-contrast" value="1" default_checked high_contrast /><.radio color="orange" name="radio-hc-orange-contrast" value="1" default_checked high_contrast /><.radio color="crimson" name="radio-hc-crimson-contrast" value="1" default_checked high_contrast /><.radio color="gray" name="radio-hc-gray-contrast" value="1" default_checked high_contrast /></.grid>|}>
      <.grid columns="5" display="inline-grid" gap="2">
        <.radio color="indigo" name="radio-hc-indigo" value="1" default_checked />
        <.radio color="cyan" name="radio-hc-cyan" value="1" default_checked />
        <.radio color="orange" name="radio-hc-orange" value="1" default_checked />
        <.radio color="crimson" name="radio-hc-crimson" value="1" default_checked />
        <.radio color="gray" name="radio-hc-gray" value="1" default_checked />
        <.radio color="indigo" name="radio-hc-indigo-contrast" value="1" default_checked high_contrast />
        <.radio color="cyan" name="radio-hc-cyan-contrast" value="1" default_checked high_contrast />
        <.radio color="orange" name="radio-hc-orange-contrast" value="1" default_checked high_contrast />
        <.radio color="crimson" name="radio-hc-crimson-contrast" value="1" default_checked high_contrast />
        <.radio color="gray" name="radio-hc-gray-contrast" value="1" default_checked high_contrast />
      </.grid>
  </:heex>
</.demo>

### Alignment

Composing `radio` within `text` automatically centers it with the first line of text. It is automatically well-aligned with multi-line text too.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.flex align="start" direction="column" gap="1"><.text as="label" size="2"><.flex gap="2"><.radio size="1" name="radio-align-1" value="1" default_checked />Default</.flex></.text><.text as="label" size="2"><.flex gap="2"><.radio size="1" name="radio-align-1" value="2" />Compact</.flex></.text></.flex><.flex align="start" direction="column" gap="1"><.text as="label" size="3"><.flex gap="2"><.radio size="2" name="radio-align-2" value="1" default_checked />Default</.flex></.text><.text as="label" size="3"><.flex gap="2"><.radio size="2" name="radio-align-2" value="2" />Compact</.flex></.text></.flex><.flex align="start" direction="column" gap="1"><.text as="label" size="4"><.flex gap="2"><.radio size="3" name="radio-align-3" value="1" default_checked />Default</.flex></.text><.text as="label" size="4"><.flex gap="2"><.radio size="3" name="radio-align-3" value="2" />Compact</.flex></.text></.flex></.flex>|}>
      <.flex direction="column" gap="3">
        <.flex align="start" direction="column" gap="1">
          <.text as="label" size="2">
            <.flex gap="2">
              <.radio size="1" name="radio-align-1" value="1" default_checked />
              Default
            </.flex>
          </.text>
          <.text as="label" size="2">
            <.flex gap="2">
              <.radio size="1" name="radio-align-1" value="2" />
              Compact
            </.flex>
          </.text>
        </.flex>
        <.flex align="start" direction="column" gap="1">
          <.text as="label" size="3">
            <.flex gap="2">
              <.radio size="2" name="radio-align-2" value="1" default_checked />
              Default
            </.flex>
          </.text>
          <.text as="label" size="3">
            <.flex gap="2">
              <.radio size="2" name="radio-align-2" value="2" />
              Compact
            </.flex>
          </.text>
        </.flex>
        <.flex align="start" direction="column" gap="1">
          <.text as="label" size="4">
            <.flex gap="2">
              <.radio size="3" name="radio-align-3" value="1" default_checked />
              Default
            </.flex>
          </.text>
          <.text as="label" size="4">
            <.flex gap="2">
              <.radio size="3" name="radio-align-3" value="2" />
              Compact
            </.flex>
          </.text>
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Disabled

Use the native `disabled` attribute to create a disabled radio button.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.flex align="start" direction="column" gap="1"><.text as="label" size="2"><.flex gap="2"><.radio name="radio-enabled" value="1" default_checked />On</.flex></.text><.text as="label" size="2"><.flex gap="2"><.radio name="radio-enabled" value="2" />Off</.flex></.text></.flex><.flex align="start" direction="column" gap="1"><.text as="label" size="2" color="gray"><.flex gap="2"><.radio disabled name="radio-disabled" value="1" default_checked />On</.flex></.text><.text as="label" size="2" color="gray"><.flex gap="2"><.radio disabled name="radio-disabled" value="2" />Off</.flex></.text></.flex></.flex>|}>
      <.flex direction="column" gap="3">
        <.flex align="start" direction="column" gap="1">
          <.text as="label" size="2">
            <.flex gap="2">
              <.radio name="radio-enabled" value="1" default_checked />
              On
            </.flex>
          </.text>
          <.text as="label" size="2">
            <.flex gap="2">
              <.radio name="radio-enabled" value="2" />
              Off
            </.flex>
          </.text>
        </.flex>
        <.flex align="start" direction="column" gap="1">
          <.text as="label" size="2" color="gray">
            <.flex gap="2">
              <.radio disabled name="radio-disabled" value="1" default_checked />
              On
            </.flex>
          </.text>
          <.text as="label" size="2" color="gray">
            <.flex gap="2">
              <.radio disabled name="radio-disabled" value="2" />
              Off
            </.flex>
          </.text>
        </.flex>
      </.flex>
  </:heex>
</.demo>
