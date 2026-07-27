---
title: Spinner
description: Displays an animated loading indicator.
---

<.demo>
  <:heex code={~S|<.spinner />|}>
      <.spinner />
  </:heex>
</.demo>

## API Reference

This component is based on the `span` element and supports common margin props.

<.props_table module={EssenceUI.Components.Spinner} function={:spinner} />

## Examples

### Size

Use the `size` prop to control the size of the spinner.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.spinner size="1" /><.spinner size="2" /><.spinner size="3" /></.flex>|}>
      <.flex align="center" gap="4">
        <.spinner size="1" />
        <.spinner size="2" />
        <.spinner size="3" />
      </.flex>
  </:heex>
</.demo>

### With buttons

[Buttons](/themes/docs/components/button) have their own `loading` prop that automatically composes a spinner.

<.demo>
  <:heex code={~S|<.button loading>Bookmark</.button>|}>
      <.button loading>Bookmark</.button>
  </:heex>
</.demo>
