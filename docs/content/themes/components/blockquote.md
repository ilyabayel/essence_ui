---
title: Blockquote
description: Block-level quotation from another source.
---

<.demo>
  <:heex code={~S|<.blockquote>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>|}>
      <.blockquote>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
  </:heex>
</.demo>

## API Reference

This component is based on the `blockquote` element.

<.props_table module={EssenceUI.Components.Blockquote} function={:blockquote} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="5"><.box max_width="300px"><.blockquote size="1">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="350px"><.blockquote size="2">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="400px"><.blockquote size="3">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="450px"><.blockquote size="4">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="500px"><.blockquote size="5">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="550px"><.blockquote size="6">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="600px"><.blockquote size="7">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="650px"><.blockquote size="8">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box><.box max_width="1000px"><.blockquote size="9">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box></.flex>|}>
      <.flex direction="column" gap="5">
        <.box max_width="300px"><.blockquote size="1">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="350px"><.blockquote size="2">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="400px"><.blockquote size="3">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="450px"><.blockquote size="4">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="500px"><.blockquote size="5">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="550px"><.blockquote size="6">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="600px"><.blockquote size="7">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="650px"><.blockquote size="8">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
        <.box max_width="1000px"><.blockquote size="9">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.box>
      </.flex>
  </:heex>
</.demo>

### Weight

Use the `weight` prop to set the text weight.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="500px"><.blockquote weight="regular">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote weight="medium">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote weight="bold">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.flex>|}>
      <.flex direction="column" gap="3" max_width="500px">
        <.blockquote weight="regular">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote weight="medium">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote weight="bold">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="500px"><.blockquote color="indigo">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote color="cyan">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote color="orange">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote color="crimson">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.flex>|}>
      <.flex direction="column" gap="3" max_width="500px">
        <.blockquote color="indigo">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote color="cyan">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote color="orange">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote color="crimson">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="500px"><.blockquote color="gray">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote><.blockquote color="gray" high_contrast>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.flex>|}>
      <.flex direction="column" gap="3" max_width="500px">
        <.blockquote color="gray">Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
        <.blockquote color="gray" high_contrast>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
      </.flex>
  </:heex>
</.demo>

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="500px"><.blockquote truncate>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote></.flex>|}>
      <.flex max_width="500px">
        <.blockquote truncate>Perfect typography is certainly the most elusive of all arts. Sculpture in stone alone comes near it in obstinacy.</.blockquote>
      </.flex>
  </:heex>
</.demo>
