---
title: Heading
description: Semantic heading element.
---

<.demo>
  <:heex code={~S|<.heading>The quick brown fox jumps over the lazy dog</.heading>|}>
      <.heading>The quick brown fox jumps over the lazy dog</.heading>
  </:heex>
</.demo>

## API Reference

This component is based on the `h1` element and supports common margin props.

<.props_table module={EssenceUI.Components.Heading} function={:heading} />

## Examples

### As another element

Use the `as` prop to change the heading level. This prop is purely semantic and does not change the visual appearance.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.heading as="h1">Level 1</.heading><.heading as="h2">Level 2</.heading><.heading as="h3">Level 3</.heading></.flex>|}>
      <.flex direction="column" gap="2">
        <.heading as="h1">Level 1</.heading>
        <.heading as="h2">Level 2</.heading>
        <.heading as="h3">Level 3</.heading>
      </.flex>
  </:heex>
</.demo>

### Size

Use the `size` prop to control the size of the heading. The prop also provides correct line height and corrective letter spacing—as text size increases, the relative line height and letter spacing decrease.

Heading sizes match [Text](/themes/docs/components/text) sizes. However, the line heights are set a bit tighter as headings tend to be shorter than running text.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.heading size="1">The quick brown fox jumps over the lazy dog</.heading><.heading size="2">The quick brown fox jumps over the lazy dog</.heading><.heading size="3">The quick brown fox jumps over the lazy dog</.heading><.heading size="4">The quick brown fox jumps over the lazy dog</.heading><.heading size="5">The quick brown fox jumps over the lazy dog</.heading><.heading size="6">The quick brown fox jumps over the lazy dog</.heading><.heading size="7">The quick brown fox jumps over the lazy dog</.heading><.heading size="8">The quick brown fox jumps over the lazy dog</.heading><.heading size="9">The quick brown fox jumps over the lazy dog</.heading></.flex>|}>
      <.flex direction="column" gap="3">
        <.heading size="1">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="2">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="3">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="4">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="5">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="6">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="7">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="8">The quick brown fox jumps over the lazy dog</.heading>
        <.heading size="9">The quick brown fox jumps over the lazy dog</.heading>
      </.flex>
  </:heex>
</.demo>

### Weight

Use the `weight` prop to set the text weight.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.heading weight="regular">The quick brown fox jumps over the lazy dog.</.heading><.heading weight="medium">The quick brown fox jumps over the lazy dog.</.heading><.heading weight="bold">The quick brown fox jumps over the lazy dog.</.heading></.flex>|}>
      <.flex direction="column" gap="3">
        <.heading weight="regular">The quick brown fox jumps over the lazy dog.</.heading>
        <.heading weight="medium">The quick brown fox jumps over the lazy dog.</.heading>
        <.heading weight="bold">The quick brown fox jumps over the lazy dog.</.heading>
      </.flex>
  </:heex>
</.demo>

### Align

Use the `align` prop to set text alignment.

<.demo>
  <:heex code={~S|<.box width="100%"><.heading align="left">Left-aligned</.heading><.heading align="center">Center-aligned</.heading><.heading align="right">Right-aligned</.heading></.box>|}>
      <.box width="100%">
        <.heading align="left">Left-aligned</.heading>
        <.heading align="center">Center-aligned</.heading>
        <.heading align="right">Right-aligned</.heading>
      </.box>
  </:heex>
</.demo>

### Trim

Use the `trim` prop to trim the leading space at the start, end, or both sides of the text box.

The prop works similarly to the upcoming [half-leading control](https://www.w3.org/TR/css-inline-3/#leading-trim) spec, but uses a common [negative margin workaround](https://seek-oss.github.io/capsize/) under the hood for cross-browser support.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.heading trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">Without trim</.heading><.heading trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">With trim</.heading></.flex>|}>
      <.flex direction="column" gap="3">
        <.heading trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">Without trim</.heading>
        <.heading trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">With trim</.heading>
      </.flex>
  </:heex>
</.demo>

Trimming the leading is useful when dialing in vertical spacing in cards or other "boxy" components. Otherwise, padding looks larger on top and bottom than on the sides.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.box p="4" style="background: var(--gray-a2); border: 1px dashed var(--gray-a7);"><.heading mb="1" size="3">Without trim</.heading><.text>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text></.box><.box p="4" style="background: var(--gray-a2); border: 1px dashed var(--gray-a7);"><.heading mb="1" size="3" trim="start">With trim</.heading><.text trim="end">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text></.box></.flex>|}>
      <.flex direction="column" gap="3">
        <.box p="4" style="background: var(--gray-a2); border: 1px dashed var(--gray-a7);">
          <.heading mb="1" size="3">Without trim</.heading>
          <.text>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
        </.box>
        <.box p="4" style="background: var(--gray-a2); border: 1px dashed var(--gray-a7);">
          <.heading mb="1" size="3" trim="start">With trim</.heading>
          <.text trim="end">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
        </.box>
      </.flex>
  </:heex>
</.demo>

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="300px"><.heading truncate>The quick brown fox jumps over the lazy dog</.heading></.flex>|}>
      <.flex max_width="300px">
        <.heading truncate>The quick brown fox jumps over the lazy dog</.heading>
      </.flex>
  </:heex>
</.demo>

### Wrap

Use the `wrap` prop to control text wrapping.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="300px"><.heading wrap="nowrap">The quick brown fox jumps over the lazy dog</.heading><.heading wrap="balance">The quick brown fox jumps over the lazy dog</.heading><.heading wrap="pretty">The quick brown fox jumps over the lazy dog</.heading></.flex>|}>
      <.flex direction="column" gap="3" max_width="300px">
        <.heading wrap="nowrap">The quick brown fox jumps over the lazy dog</.heading>
        <.heading wrap="balance">The quick brown fox jumps over the lazy dog</.heading>
        <.heading wrap="pretty">The quick brown fox jumps over the lazy dog</.heading>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color. The text colors are designed to achieve at least Lc 60 APCA contrast over common background colors.

<.demo>
  <:heex code={~S|<.flex direction="column"><.heading color="indigo">The quick brown fox jumps over the lazy dog</.heading><.heading color="cyan">The quick brown fox jumps over the lazy dog</.heading><.heading color="orange">The quick brown fox jumps over the lazy dog</.heading><.heading color="crimson">The quick brown fox jumps over the lazy dog</.heading></.flex>|}>
      <.flex direction="column">
        <.heading color="indigo">The quick brown fox jumps over the lazy dog</.heading>
        <.heading color="cyan">The quick brown fox jumps over the lazy dog</.heading>
        <.heading color="orange">The quick brown fox jumps over the lazy dog</.heading>
        <.heading color="crimson">The quick brown fox jumps over the lazy dog</.heading>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column"><.heading color="gray">The quick brown fox jumps over the lazy dog.</.heading><.heading color="gray" high_contrast>The quick brown fox jumps over the lazy dog.</.heading></.flex>|}>
      <.flex direction="column">
        <.heading color="gray">The quick brown fox jumps over the lazy dog.</.heading>
        <.heading color="gray" high_contrast>The quick brown fox jumps over the lazy dog.</.heading>
      </.flex>
  </:heex>
</.demo>
