---
title: Text
description: Foundational text primitive.
---

<.demo>
  <:heex code={~S|<.text>The quick brown fox jumps over the lazy dog.</.text>|}>
      <.text>The quick brown fox jumps over the lazy dog.</.text>
  </:heex>
</.demo>

## API Reference

This component is based on the `span` element.

<.props_table module={EssenceUI.Components.Text} function={:text} />

## Examples

### As another element

Use the `as` prop to render text as a `p`, `label`, `div` or `span`. This prop is purely semantic and does not alter visual appearance.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text as="p">This is a <.strong>paragraph</.strong> element.</.text><.text as="label">This is a <.strong>label</.strong> element.</.text><.text as="div">This is a <.strong>div</.strong> element.</.text><.text as="span">This is a <.strong>span</.strong> element.</.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text as="p">This is a <.strong>paragraph</.strong> element.</.text>
        <.text as="label">This is a <.strong>label</.strong> element.</.text>
        <.text as="div">This is a <.strong>div</.strong> element.</.text>
        <.text as="span">This is a <.strong>span</.strong> element.</.text>
      </.flex>
  </:heex>
</.demo>

### Size

Use the `size` prop to control text size. This prop also provides correct line height and corrective letter spacing—as text size increases, the relative line height and letter spacing decrease.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text size="1">The quick brown fox jumps over the lazy dog.</.text><.text size="2">The quick brown fox jumps over the lazy dog.</.text><.text size="3">The quick brown fox jumps over the lazy dog.</.text><.text size="4">The quick brown fox jumps over the lazy dog.</.text><.text size="5">The quick brown fox jumps over the lazy dog.</.text><.text size="6">The quick brown fox jumps over the lazy dog.</.text><.text size="7">The quick brown fox jumps over the lazy dog.</.text><.text size="8">The quick brown fox jumps over the lazy dog.</.text><.text size="9">The quick brown fox jumps over the lazy dog.</.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text size="1">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="2">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="3">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="4">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="5">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="6">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="7">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="8">The quick brown fox jumps over the lazy dog.</.text>
        <.text size="9">The quick brown fox jumps over the lazy dog.</.text>
      </.flex>
  </:heex>
</.demo>

Sizes 2–4 are designed to work well for long-form content.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="5"><.text as="p" size="4">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text><.text as="p" size="3">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text><.text as="p" size="2" color="gray">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text></.flex>|}>
      <.flex direction="column" gap="5">
        <.text as="p" size="4">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text>
        <.text as="p" size="3">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text>
        <.text as="p" size="2" color="gray">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant. The question is: What proportion(s) will give us the best results? The golden ratio is often observed in nature where beauty and utility intersect; perhaps we can use this "divine" proportion to enhance these attributes in our typography.</.text>
      </.flex>
  </:heex>
</.demo>

Sizes 1–3 are designed to work well for UI labels.

<.demo>
  <:heex code={~S|<.grid align="center" columns="2" gap="5" p="3"><.flex direction="column"><.text size="3" weight="bold">Get started</.text><.text color="gray" size="2">Start your next project in minutes</.text></.flex><.flex direction="column"><.text size="2" weight="bold">Get started</.text><.text color="gray" size="2">Start your next project in minutes</.text></.flex><.flex direction="column"><.text size="2" weight="bold">Get started</.text><.text color="gray" size="1">Start your next project in minutes</.text></.flex><.flex direction="column"><.text size="1" weight="bold">Get started</.text><.text color="gray" size="1">Start your next project in minutes</.text></.flex></.grid>|}>
      <.grid align="center" columns="2" gap="5" p="3">
        <.flex direction="column">
          <.text size="3" weight="bold">Get started</.text>
          <.text color="gray" size="2">Start your next project in minutes</.text>
        </.flex>
        <.flex direction="column">
          <.text size="2" weight="bold">Get started</.text>
          <.text color="gray" size="2">Start your next project in minutes</.text>
        </.flex>
        <.flex direction="column">
          <.text size="2" weight="bold">Get started</.text>
          <.text color="gray" size="1">Start your next project in minutes</.text>
        </.flex>
        <.flex direction="column">
          <.text size="1" weight="bold">Get started</.text>
          <.text color="gray" size="1">Start your next project in minutes</.text>
        </.flex>
      </.grid>
  </:heex>
</.demo>

### Weight

Use the `weight` prop to set the text weight.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text weight="regular" as="div">The quick brown fox jumps over the lazy dog.</.text><.text weight="medium" as="div">The quick brown fox jumps over the lazy dog.</.text><.text weight="bold" as="div">The quick brown fox jumps over the lazy dog.</.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text weight="regular" as="div">The quick brown fox jumps over the lazy dog.</.text>
        <.text weight="medium" as="div">The quick brown fox jumps over the lazy dog.</.text>
        <.text weight="bold" as="div">The quick brown fox jumps over the lazy dog.</.text>
      </.flex>
  </:heex>
</.demo>

### Align

Use the `align` prop to set text alignment.

<.demo>
  <:heex code={~S|<.box width="100%"><.text align="left" as="div">Left-aligned</.text><.text align="center" as="div">Center-aligned</.text><.text align="right" as="div">Right-aligned</.text></.box>|}>
      <.box width="100%">
        <.text align="left" as="div">Left-aligned</.text>
        <.text align="center" as="div">Center-aligned</.text>
        <.text align="right" as="div">Right-aligned</.text>
      </.box>
  </:heex>
</.demo>

### Trim

Use the `trim` prop to trim the leading space at the start, end, or both sides of the text box.

The prop works similarly to the upcoming [half-leading control](https://www.w3.org/TR/css-inline-3/#leading-trim) spec, but uses a common [negative margin workaround](https://seek-oss.github.io/capsize/) under the hood for cross-browser support.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.text trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">Without trim</.text><.text trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">With trim</.text></.flex>|}>
      <.flex direction="column" gap="3">
        <.text trim="normal" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">Without trim</.text>
        <.text trim="both" style="background: var(--gray-a2); border-top: 1px dashed var(--gray-a7); border-bottom: 1px dashed var(--gray-a7);">With trim</.text>
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
  <:heex code={~S|<.flex max_width="300px"><.text truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text></.flex>|}>
      <.flex max_width="300px">
        <.text truncate>The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
      </.flex>
  </:heex>
</.demo>

### Wrap

Use the `wrap` prop to control text wrapping.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="270px"><.text wrap="nowrap">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text><.text wrap="balance">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text><.text wrap="pretty">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text></.flex>|}>
      <.flex direction="column" gap="3" max_width="270px">
        <.text wrap="nowrap">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
        <.text wrap="balance">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
        <.text wrap="pretty">The goal of typography is to relate font size, line height, and line width in a proportional way that maximizes beauty and makes reading easier and more pleasant.</.text>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color. The text colors are designed to achieve at least Lc 60 APCA contrast over common background colors.

<.demo>
  <:heex code={~S|<.flex direction="column"><.text color="indigo">The quick brown fox jumps over the lazy dog.</.text><.text color="cyan">The quick brown fox jumps over the lazy dog.</.text><.text color="orange">The quick brown fox jumps over the lazy dog.</.text><.text color="crimson">The quick brown fox jumps over the lazy dog.</.text></.flex>|}>
      <.flex direction="column">
        <.text color="indigo">The quick brown fox jumps over the lazy dog.</.text>
        <.text color="cyan">The quick brown fox jumps over the lazy dog.</.text>
        <.text color="orange">The quick brown fox jumps over the lazy dog.</.text>
        <.text color="crimson">The quick brown fox jumps over the lazy dog.</.text>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column"><.text color="gray">The quick brown fox jumps over the lazy dog.</.text><.text color="gray" high_contrast>The quick brown fox jumps over the lazy dog.</.text></.flex>|}>
      <.flex direction="column">
        <.text color="gray">The quick brown fox jumps over the lazy dog.</.text>
        <.text color="gray" high_contrast>The quick brown fox jumps over the lazy dog.</.text>
      </.flex>
  </:heex>
</.demo>

### With formatting

Compose `Text` with formatting components to add emphasis and structure to content.

<.demo>
  <:heex code={~S|<.text as="p">Look, such a helpful <.es_link href="#">link</.es_link>, an <.em>italic emphasis</.em>, a piece of computer <.code>code</.code>, and even a hotkey combination <.kbd>⇧⌘A</.kbd> within the text.</.text>|}>
      <.text as="p">
        Look, such a helpful <.es_link href="#">link</.es_link>, an <.em>italic emphasis</.em>, a piece of computer <.code>code</.code>, and even a hotkey combination <.kbd>⇧⌘A</.kbd> within the text.
      </.text>
  </:heex>
</.demo>

### With form controls

Composing `Text` with a form control like `Checkbox`, `RadioGroup`, or `Switch` automatically centers the control with the first line of text, even when the text is multi-line.

<.demo>
  <:heex code={~S|<.box max_width="300px"><.text as="label" size="3"><.flex gap="2"><input type="checkbox" checked /> I understand that these documents are confidential and cannot be shared with a third party.</.flex></.text></.box>|}>
      <.box max_width="300px">
        <.text as="label" size="3">
          <.flex gap="2">
            <input type="checkbox" checked />
            I understand that these documents are confidential and cannot be shared with a third party.
          </.flex>
        </.text>
      </.box>
  </:heex>
</.demo>
