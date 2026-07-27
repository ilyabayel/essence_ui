---
title: Tab Nav
description: Navigation menu with links styled as tabs.
---

<.demo>
  <:heex code={~S|<.tab_nav><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav>|}>
      <.tab_nav>
        <.tab_nav_link href="#" active>Account</.tab_nav_link>
        <.tab_nav_link href="#">Documents</.tab_nav_link>
        <.tab_nav_link href="#">Settings</.tab_nav_link>
      </.tab_nav>
  </:heex>
</.demo>

## API Reference

Navigation links styled as tabs. Supports common margin props. Use the `as` prop on `tab_nav_link` to render a different element (for example, a LiveView link component).

### Root

Contains the navigation menu links.

<.props_table module={EssenceUI.Components.TabNav} function={:tab_nav} />

### Link

An individual navigation menu link.

<.props_table module={EssenceUI.Components.TabNav} function={:tab_nav_link} />

## Examples

### Size

Use the `size` prop to control the size of the tabs.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tab_nav size="1"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav><.tab_nav size="2"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav></.flex>|}>
      <.flex direction="column" gap="4">
        <.tab_nav size="1">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        <.tab_nav size="2">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color to the tab list.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tab_nav color="indigo"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav><.tab_nav color="cyan"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav><.tab_nav color="orange"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav><.tab_nav color="crimson"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav></.flex>|}>
      <.flex direction="column" gap="4">
        <.tab_nav color="indigo">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        <.tab_nav color="cyan">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        <.tab_nav color="orange">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        <.tab_nav color="crimson">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tab_nav color="gray"><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav><.tab_nav color="gray" high_contrast><.tab_nav_link href="#" active>Account</.tab_nav_link><.tab_nav_link href="#">Documents</.tab_nav_link><.tab_nav_link href="#">Settings</.tab_nav_link></.tab_nav></.flex>|}>
      <.flex direction="column" gap="4">
        <.tab_nav color="gray">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        <.tab_nav color="gray" high_contrast>
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
      </.flex>
  </:heex>
</.demo>
