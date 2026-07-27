---
title: Progress
description: Displays a progress bar related to a task.
---

<.demo>
  <:heex code={~S|<.box max_width="300px"><.progress value={50} /></.box>|}>
      <.box max_width="300px">
        <.progress value={50} />
      </.box>
  </:heex>
</.demo>

## API Reference

This component wraps the Progress primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Progress} function={:progress} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.progress value={25} size="1" /><.progress value={50} size="2" /><.progress value={75} size="3" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.progress value={25} size="1" />
        <.progress value={50} size="2" />
        <.progress value={75} size="3" />
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.progress value={25} variant="classic" /><.progress value={50} variant="surface" /><.progress value={75} variant="soft" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.progress value={25} variant="classic" />
        <.progress value={50} variant="surface" />
        <.progress value={75} variant="soft" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.progress value={20} color="indigo" /><.progress value={40} color="cyan" /><.progress value={60} color="orange" /><.progress value={80} color="crimson" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.progress value={20} color="indigo" />
        <.progress value={40} color="cyan" />
        <.progress value={60} color="orange" />
        <.progress value={80} color="crimson" />
      </.flex>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="300px"><.progress value={25} radius="none" /><.progress value={50} radius="small" /><.progress value={75} radius="full" /></.flex>|}>
      <.flex direction="column" gap="4" max_width="300px">
        <.progress value={25} radius="none" />
        <.progress value={50} radius="small" />
        <.progress value={75} radius="full" />
      </.flex>
  </:heex>
</.demo>

### With controlled value

Use the `value` prop to provide a precise indication of the task progress.

<.demo>
  <:heex code={~S|<.progress value={75} />|}>
      <.progress value={75} />
  </:heex>
</.demo>
