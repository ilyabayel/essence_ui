---
title: Separator
description: Visually or semantically separates content.
---

<.demo>
  <:heex code={~S|<.text size="2">Tools for building high-quality, accessible UI.<.separator my="3" size="4" /><.flex gap="3" align="center">Themes<.separator orientation="vertical" />Primitives<.separator orientation="vertical" />Icons<.separator orientation="vertical" />Colors</.flex></.text>|}>
      <.text size="2">
        Tools for building high-quality, accessible UI.
        <.separator my="3" size="4" />
        <.flex gap="3" align="center">
          Themes
          <.separator orientation="vertical" />
          Primitives
          <.separator orientation="vertical" />
          Icons
          <.separator orientation="vertical" />
          Colors
        </.flex>
      </.text>
  </:heex>
</.demo>

## API Reference

This component wraps the Separator primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Separator} function={:separator} />

## Examples

### Size

Use the `size` prop to control the size of the separator. The largest step takes full width or height of the container.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.separator orientation="horizontal" size="1" /><.separator orientation="horizontal" size="2" /><.separator orientation="horizontal" size="3" /><.separator orientation="horizontal" size="4" /></.flex>|}>
      <.flex direction="column" gap="4">
        <.separator orientation="horizontal" size="1" />
        <.separator orientation="horizontal" size="2" />
        <.separator orientation="horizontal" size="3" />
        <.separator orientation="horizontal" size="4" />
      </.flex>
  </:heex>
</.demo>

<.demo>
  <:heex code={~S|<.flex align="center" gap="4" height="96px"><.separator orientation="vertical" size="1" /><.separator orientation="vertical" size="2" /><.separator orientation="vertical" size="3" /><.separator orientation="vertical" size="4" /></.flex>|}>
      <.flex align="center" gap="4" height="96px">
        <.separator orientation="vertical" size="1" />
        <.separator orientation="vertical" size="2" />
        <.separator orientation="vertical" size="3" />
        <.separator orientation="vertical" size="4" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.separator color="indigo" size="4" /><.separator color="cyan" size="4" /><.separator color="orange" size="4" /><.separator color="crimson" size="4" /></.flex>|}>
      <.flex direction="column" gap="3">
        <.separator color="indigo" size="4" />
        <.separator color="cyan" size="4" />
        <.separator color="orange" size="4" />
        <.separator color="crimson" size="4" />
      </.flex>
  </:heex>
</.demo>

### Orientation

Use the `orientation` prop to control whether the separator is horizontal or vertical.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.separator orientation="horizontal" /><.separator orientation="vertical" /></.flex>|}>
      <.flex align="center" gap="4">
        <.separator orientation="horizontal" />
        <.separator orientation="vertical" />
      </.flex>
  </:heex>
</.demo>
