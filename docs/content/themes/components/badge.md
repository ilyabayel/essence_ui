---
title: Badge
description: Stylized badge element.
---

<.demo>
  <:heex code={~S|<.flex gap="2"><.badge color="orange">In progress</.badge><.badge color="blue">In review</.badge><.badge color="green">Complete</.badge></.flex>|}>
      <.flex gap="2">
        <.badge color="orange">In progress</.badge>
        <.badge color="blue">In review</.badge>
        <.badge color="green">Complete</.badge>
      </.flex>
  </:heex>
</.demo>

## API Reference

This component is based on the `span` element and supports common margin props.

<.props_table module={EssenceUI.Components.Badge} function={:badge} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="2"><.badge size="1" color="indigo">New</.badge><.badge size="2" color="indigo">New</.badge><.badge size="3" color="indigo">New</.badge></.flex>|}>
      <.flex align="center" gap="2">
        <.badge size="1" color="indigo">New</.badge>
        <.badge size="2" color="indigo">New</.badge>
        <.badge size="3" color="indigo">New</.badge>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex gap="2"><.badge variant="solid" color="indigo">New</.badge><.badge variant="soft" color="indigo">New</.badge><.badge variant="surface" color="indigo">New</.badge><.badge variant="outline" color="indigo">New</.badge></.flex>|}>
      <.flex gap="2">
        <.badge variant="solid" color="indigo">New</.badge>
        <.badge variant="soft" color="indigo">New</.badge>
        <.badge variant="surface" color="indigo">New</.badge>
        <.badge variant="outline" color="indigo">New</.badge>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.badge color="indigo">New</.badge><.badge color="cyan">New</.badge><.badge color="orange">New</.badge><.badge color="crimson">New</.badge></.flex>|}>
      <.flex gap="2">
        <.badge color="indigo">New</.badge>
        <.badge color="cyan">New</.badge>
        <.badge color="orange">New</.badge>
        <.badge color="crimson">New</.badge>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.flex gap="2"><.badge color="gray" variant="solid">New</.badge><.badge color="gray" variant="soft">New</.badge><.badge color="gray" variant="surface">New</.badge><.badge color="gray" variant="outline">New</.badge></.flex><.flex gap="2"><.badge color="gray" variant="solid" high_contrast>New</.badge><.badge color="gray" variant="soft" high_contrast>New</.badge><.badge color="gray" variant="surface" high_contrast>New</.badge><.badge color="gray" variant="outline" high_contrast>New</.badge></.flex></.flex>|}>
      <.flex direction="column" gap="2">
        <.flex gap="2">
          <.badge color="gray" variant="solid">New</.badge>
          <.badge color="gray" variant="soft">New</.badge>
          <.badge color="gray" variant="surface">New</.badge>
          <.badge color="gray" variant="outline">New</.badge>
        </.flex>
        <.flex gap="2">
          <.badge color="gray" variant="solid" high_contrast>New</.badge>
          <.badge color="gray" variant="soft" high_contrast>New</.badge>
          <.badge color="gray" variant="surface" high_contrast>New</.badge>
          <.badge color="gray" variant="outline" high_contrast>New</.badge>
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex gap="2"><.badge variant="solid" radius="none" color="indigo">New</.badge><.badge variant="solid" radius="large" color="indigo">New</.badge><.badge variant="solid" radius="full" color="indigo">New</.badge></.flex>|}>
      <.flex gap="2">
        <.badge variant="solid" radius="none" color="indigo">New</.badge>
        <.badge variant="solid" radius="large" color="indigo">New</.badge>
        <.badge variant="solid" radius="full" color="indigo">New</.badge>
      </.flex>
  </:heex>
</.demo>
