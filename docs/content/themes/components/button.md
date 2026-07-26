---
title: Button
description: Trigger an action or event.
---

Buttons allow users to take actions with a single click.

<.demo>
  <:heex code={~S|<.button>Button</.button>|}>
      <.button>Button</.button>
  </:heex>
</.demo>

## Variants

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button variant="classic">Classic</.button><.button variant="solid">Solid</.button><.button variant="soft">Soft</.button><.button variant="surface">Surface</.button><.button variant="outline">Outline</.button><.button variant="ghost">Ghost</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button variant="classic">Classic</.button>
        <.button variant="solid">Solid</.button>
        <.button variant="soft">Soft</.button>
        <.button variant="surface">Surface</.button>
        <.button variant="outline">Outline</.button>
        <.button variant="ghost">Ghost</.button>
      </.flex>
  </:heex>
</.demo>

## Sizes

<.demo>
  <:heex code={~S|<.flex gap="3" align="center" wrap="wrap"><.button size="1">Size 1</.button><.button size="2">Size 2</.button><.button size="3">Size 3</.button><.button size="4">Size 4</.button></.flex>|}>
      <.flex gap="3" align="center" wrap="wrap">
        <.button size="1">Size 1</.button>
        <.button size="2">Size 2</.button>
        <.button size="3">Size 3</.button>
        <.button size="4">Size 4</.button>
      </.flex>
  </:heex>
</.demo>

## Colors

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button color="indigo">Indigo</.button><.button color="cyan">Cyan</.button><.button color="crimson">Crimson</.button><.button color="gray">Gray</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button color="indigo">Indigo</.button>
        <.button color="cyan">Cyan</.button>
        <.button color="crimson">Crimson</.button>
        <.button color="gray">Gray</.button>
      </.flex>
  </:heex>
</.demo>

## API Reference

<.props_table module={EssenceUI.Components.Button} function={:button} />
