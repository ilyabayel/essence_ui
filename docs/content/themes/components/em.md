---
title: Em
description: Marks text to stress emphasis.
---

<.demo>
  <:heex code={~S|<.text>We <.em>had</.em> to do something about it.</.text>|}>
      <.text>We <.em>had</.em> to do something about it.</.text>
  </:heex>
</.demo>

## API Reference

This component is based on the `em` element.

<.props_table module={EssenceUI.Components.Em} function={:em} />

## Examples

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="300px"><.em truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.em></.flex>|}>
      <.flex max_width="300px">
        <.em truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.em>
      </.flex>
  </:heex>
</.demo>
