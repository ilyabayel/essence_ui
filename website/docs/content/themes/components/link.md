---
title: Link
description: Semantic element for navigation between pages.
---

<.demo>
  <:heex code={~S|<.es_link href="#">Sign up</.es_link>|}>
      <.es_link href="#">Sign up</.es_link>
  </:heex>
</.demo>

## API Reference

This component is based on the `a` element. Use `navigate` or `patch` for LiveView client-side navigation.

<.props_table module={EssenceUI.Components.Link} function={:es_link} />

## Examples

### Color

Use the `color` prop to assign a specific color.

<.demo>
  <:heex code={~S|<.flex direction="column"><.es_link href="#" color="indigo">Sign up</.es_link><.es_link href="#" color="cyan">Sign up</.es_link><.es_link href="#" color="orange">Sign up</.es_link><.es_link href="#" color="crimson">Sign up</.es_link></.flex>|}>
      <.flex direction="column">
        <.es_link href="#" color="indigo">Sign up</.es_link>
        <.es_link href="#" color="cyan">Sign up</.es_link>
        <.es_link href="#" color="orange">Sign up</.es_link>
        <.es_link href="#" color="crimson">Sign up</.es_link>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column"><.es_link href="#" color="gray">Sign up</.es_link><.es_link href="#" color="gray" high_contrast>Sign up</.es_link></.flex>|}>
      <.flex direction="column">
        <.es_link href="#" color="gray">Sign up</.es_link>
        <.es_link href="#" color="gray" high_contrast>Sign up</.es_link>
      </.flex>
  </:heex>
</.demo>

### Underline

Use the `underline` prop to manage the visibility of the underline affordance.

<.demo>
  <:heex code={~S|<.flex direction="column"><.es_link href="#" underline="hover">Sign up</.es_link><.es_link href="#" underline="always">Sign up</.es_link></.flex>|}>
      <.flex direction="column">
        <.es_link href="#" underline="hover">Sign up</.es_link>
        <.es_link href="#" underline="always">Sign up</.es_link>
      </.flex>
  </:heex>
</.demo>
