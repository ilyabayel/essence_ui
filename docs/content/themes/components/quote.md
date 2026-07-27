---
title: Quote
description: Short inline quotation.
---

<.demo>
  <:heex code={~S|<.text>His famous quote, <.es_quote>Styles come and go. Good design is a language, not a style</.es_quote>, elegantly sums up Massimo's philosophy of design.</.text>|}>
      <.text>His famous quote, <.es_quote>Styles come and go. Good design is a language, not a style</.es_quote>, elegantly sums up Massimo's philosophy of design.</.text>
  </:heex>
</.demo>

## API Reference

This component is based on the `q` element.

<.props_table module={EssenceUI.Components.Quote} function={:es_quote} />

## Examples

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="300px"><.es_quote truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.es_quote></.flex>|}>
      <.flex max_width="300px">
        <.es_quote truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.es_quote>
      </.flex>
  </:heex>
</.demo>
