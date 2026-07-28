---
title: Skeleton
description: Replaces content with same shape placeholder that indicates a loading state.
---

<.demo>
  <:heex code={~S|<.skeleton>Loading</.skeleton>|}>
      <.skeleton>Loading</.skeleton>
  </:heex>
</.demo>

## API Reference

This component is based on the `span` element and supports common margin props.

<.props_table module={EssenceUI.Components.Skeleton} function={:skeleton} />

## Examples

### Size

Use the width and height props to manually control the size of the skeleton.

<.demo>
  <:heex code={~S|<.skeleton width="48px" height="48px" />|}>
      <.skeleton width="48px" height="48px" />
  </:heex>
</.demo>

### With children

Use the `loading` prop to control whether the skeleton or its children are displayed. Skeleton preserves the dimensions of children when they are hidden and disables interactive elements.

<.demo>
  <:heex code={~S|<.flex gap="4"><.skeleton loading={true}><.switch id="skeleton-switch-loading" default_checked /></.skeleton><.skeleton loading={false}><.switch id="skeleton-switch-loaded" default_checked /></.skeleton></.flex>|}>
      <.flex gap="4">
        <.skeleton loading={true}>
          <.switch id="skeleton-switch-loading" default_checked />
        </.skeleton>
        <.skeleton loading={false}>
          <.switch id="skeleton-switch-loaded" default_checked />
        </.skeleton>
      </.flex>
  </:heex>
</.demo>

### With text

When using Skeleton with text, you'd usually wrap the text node itself rather than the parent element. This ensures that the text is replaced with a placeholder of the same size:

<.demo>
  <:heex code={~S|<.container size="1"><.flex direction="column" gap="2"><.text><.skeleton>Lorem ipsum dolor sit amet.</.skeleton></.text><.skeleton><.text>Lorem ipsum dolor sit amet</.text></.skeleton></.flex></.container>|}>
      <.container size="1">
        <.flex direction="column" gap="2">
          <.text>
            <.skeleton>Lorem ipsum dolor sit amet.</.skeleton>
          </.text>
          <.skeleton>
            <.text>Lorem ipsum dolor sit amet</.text>
          </.skeleton>
        </.flex>
      </.container>
  </:heex>
</.demo>

The difference is especially noticeable when wrapping longer paragraphs:

<.demo>
  <:heex code={~S|<.container size="1"><.flex direction="column" gap="3"><.text><.skeleton>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque felis tellus, efficitur id convallis a, viverra eget libero. Nam magna erat, fringilla sed commodo sed, aliquet nec magna.</.skeleton></.text><.skeleton><.text>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque felis tellus, efficitur id convallis a, viverra eget libero. Nam magna erat, fringilla sed commodo sed, aliquet nec magna.</.text></.skeleton></.flex></.container>|}>
      <.container size="1">
        <.flex direction="column" gap="3">
          <.text>
            <.skeleton>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque felis tellus, efficitur id convallis a, viverra eget libero. Nam magna erat, fringilla sed commodo sed, aliquet nec magna.
            </.skeleton>
          </.text>
          <.skeleton>
            <.text>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque felis tellus, efficitur id convallis a, viverra eget libero. Nam magna erat, fringilla sed commodo sed, aliquet nec magna.
            </.text>
          </.skeleton>
        </.flex>
      </.container>
  </:heex>
</.demo>
