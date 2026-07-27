---
title: Strong
description: Marks text to signify strong importance.
---

<.demo>
  <:heex code={~S|<.text>The most important thing to remember is, <.strong>stay positive</.strong>.</.text>|}>
      <.text>The most important thing to remember is, <.strong>stay positive</.strong>.</.text>
  </:heex>
</.demo>

## API Reference

This component is based on the `strong` element.

<.props_table module={EssenceUI.Components.Strong} function={:strong} />

## Examples

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="300px"><.strong truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.strong></.flex>|}>
      <.flex max_width="300px">
        <.strong truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.strong>
      </.flex>
  </:heex>
</.demo>
