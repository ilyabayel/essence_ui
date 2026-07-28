---
title: Kbd
description: Represents keyboard input or a hotkey.
---

<.demo>
  <:heex code={~S|<.kbd>Shift + Tab</.kbd>|}>
      <.kbd>Shift + Tab</.kbd>
  </:heex>
</.demo>

## API Reference

This component is based on the `kbd` element.

<.props_table module={EssenceUI.Components.Kbd} function={:kbd} />

## Examples

### Size

Use the `size` prop to control text size.

<.demo>
  <:heex code={~S|<.flex direction="column" align="start" gap="3"><.kbd size="1">Shift + Tab</.kbd><.kbd size="2">Shift + Tab</.kbd><.kbd size="3">Shift + Tab</.kbd><.kbd size="4">Shift + Tab</.kbd><.kbd size="5">Shift + Tab</.kbd><.kbd size="6">Shift + Tab</.kbd><.kbd size="7">Shift + Tab</.kbd><.kbd size="8">Shift + Tab</.kbd><.kbd size="9">Shift + Tab</.kbd></.flex>|}>
      <.flex direction="column" align="start" gap="3">
        <.kbd size="1">Shift + Tab</.kbd>
        <.kbd size="2">Shift + Tab</.kbd>
        <.kbd size="3">Shift + Tab</.kbd>
        <.kbd size="4">Shift + Tab</.kbd>
        <.kbd size="5">Shift + Tab</.kbd>
        <.kbd size="6">Shift + Tab</.kbd>
        <.kbd size="7">Shift + Tab</.kbd>
        <.kbd size="8">Shift + Tab</.kbd>
        <.kbd size="9">Shift + Tab</.kbd>
      </.flex>
  </:heex>
</.demo>
