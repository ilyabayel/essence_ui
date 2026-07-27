---
title: Text Area
description: Captures multi-line user input.
---

<.demo>
  <:heex code={~S|<.text_area placeholder="Reply to comment…" />|}>
      <.text_area placeholder="Reply to comment…" />
  </:heex>
</.demo>

## API Reference

This component is based on the `textarea` element and supports common margin props.

<.props_table module={EssenceUI.Components.TextArea} function={:text_area} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.box max_width="200px"><.text_area size="1" placeholder="Reply to comment…" /></.box><.box max_width="250px"><.text_area size="2" placeholder="Reply to comment…" /></.box><.box max_width="300px"><.text_area size="3" placeholder="Reply to comment…" /></.box></.flex>|}>
      <.flex direction="column" gap="3">
        <.box max_width="200px">
          <.text_area size="1" placeholder="Reply to comment…" />
        </.box>
        <.box max_width="250px">
          <.text_area size="2" placeholder="Reply to comment…" />
        </.box>
        <.box max_width="300px">
          <.text_area size="3" placeholder="Reply to comment…" />
        </.box>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="250px"><.text_area variant="surface" placeholder="Reply to comment…" /><.text_area variant="classic" placeholder="Reply to comment…" /><.text_area variant="soft" placeholder="Reply to comment…" /></.flex>|}>
      <.flex direction="column" gap="3" max_width="250px">
        <.text_area variant="surface" placeholder="Reply to comment…" />
        <.text_area variant="classic" placeholder="Reply to comment…" />
        <.text_area variant="soft" placeholder="Reply to comment…" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="250px"><.text_area color="blue" variant="soft" placeholder="Reply to comment…" /><.text_area color="green" variant="soft" placeholder="Reply to comment…" /><.text_area color="red" variant="soft" placeholder="Reply to comment…" /></.flex>|}>
      <.flex direction="column" gap="3" max_width="250px">
        <.text_area color="blue" variant="soft" placeholder="Reply to comment…" />
        <.text_area color="green" variant="soft" placeholder="Reply to comment…" />
        <.text_area color="red" variant="soft" placeholder="Reply to comment…" />
      </.flex>
  </:heex>
</.demo>

### Resize

Use the `resize` prop to enable resizing on one or both axis.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="250px"><.text_area resize="none" placeholder="Reply to comment…" /><.text_area resize="vertical" placeholder="Reply to comment…" /><.text_area resize="horizontal" placeholder="Reply to comment…" /><.text_area resize="both" placeholder="Reply to comment…" /></.flex>|}>
      <.flex direction="column" gap="3" max_width="250px">
        <.text_area resize="none" placeholder="Reply to comment…" />
        <.text_area resize="vertical" placeholder="Reply to comment…" />
        <.text_area resize="horizontal" placeholder="Reply to comment…" />
        <.text_area resize="both" placeholder="Reply to comment…" />
      </.flex>
  </:heex>
</.demo>
