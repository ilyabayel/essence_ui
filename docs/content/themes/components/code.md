---
title: Code
description: Marks text to signify a short fragment of computer code.
---

<.demo>
  <:heex code={~S|<.code>console.log()</.code>|}>
      <.code>console.log()</.code>
  </:heex>
</.demo>

## API Reference

This component is based on the `code` element.

<.props_table module={EssenceUI.Components.Code} function={:code} />

## Examples

### Size

Use the `size` prop to control text size. This prop also provides correct line height and corrective letter spacing—as text size increases, the relative line height and letter spacing decrease.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" align="start"><.code size="1">console.log()</.code><.code size="2">console.log()</.code><.code size="3">console.log()</.code><.code size="4">console.log()</.code><.code size="5">console.log()</.code><.code size="6">console.log()</.code><.code size="7">console.log()</.code><.code size="8">console.log()</.code><.code size="9">console.log()</.code></.flex>|}>
      <.flex direction="column" gap="3" align="start">
        <.code size="1">console.log()</.code>
        <.code size="2">console.log()</.code>
        <.code size="3">console.log()</.code>
        <.code size="4">console.log()</.code>
        <.code size="5">console.log()</.code>
        <.code size="6">console.log()</.code>
        <.code size="7">console.log()</.code>
        <.code size="8">console.log()</.code>
        <.code size="9">console.log()</.code>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" align="start" gap="2"><.code variant="solid">console.log()</.code><.code variant="soft">console.log()</.code><.code variant="outline">console.log()</.code><.code variant="ghost">console.log()</.code></.flex>|}>
      <.flex direction="column" align="start" gap="2">
        <.code variant="solid">console.log()</.code>
        <.code variant="soft">console.log()</.code>
        <.code variant="outline">console.log()</.code>
        <.code variant="ghost">console.log()</.code>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color.

<.demo>
  <:heex code={~S|<.flex direction="column" align="start" gap="2"><.code color="indigo">console.log()</.code><.code color="crimson">console.log()</.code><.code color="cyan">console.log()</.code><.code color="orange">console.log()</.code></.flex>|}>
      <.flex direction="column" align="start" gap="2">
        <.code color="indigo">console.log()</.code>
        <.code color="crimson">console.log()</.code>
        <.code color="cyan">console.log()</.code>
        <.code color="orange">console.log()</.code>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex gap="3"><.flex direction="column" align="start" gap="2"><.code color="gray" variant="solid">console.log()</.code><.code color="gray" variant="soft">console.log()</.code><.code color="gray" variant="outline">console.log()</.code><.code color="gray" variant="ghost">console.log()</.code></.flex><.flex direction="column" align="start" gap="2"><.code color="gray" variant="solid" high_contrast>console.log()</.code><.code color="gray" variant="soft" high_contrast>console.log()</.code><.code color="gray" variant="outline" high_contrast>console.log()</.code><.code color="gray" variant="ghost" high_contrast>console.log()</.code></.flex></.flex>|}>
      <.flex gap="3">
        <.flex direction="column" align="start" gap="2">
          <.code color="gray" variant="solid">console.log()</.code>
          <.code color="gray" variant="soft">console.log()</.code>
          <.code color="gray" variant="outline">console.log()</.code>
          <.code color="gray" variant="ghost">console.log()</.code>
        </.flex>
        <.flex direction="column" align="start" gap="2">
          <.code color="gray" variant="solid" high_contrast>console.log()</.code>
          <.code color="gray" variant="soft" high_contrast>console.log()</.code>
          <.code color="gray" variant="outline" high_contrast>console.log()</.code>
          <.code color="gray" variant="ghost" high_contrast>console.log()</.code>
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Weight

Use the `weight` prop to set the text weight.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2" align="start"><.code weight="regular">console.log()</.code><.code weight="bold">console.log()</.code></.flex>|}>
      <.flex direction="column" gap="2" align="start">
        <.code weight="regular">console.log()</.code>
        <.code weight="bold">console.log()</.code>
      </.flex>
  </:heex>
</.demo>

### Truncate

Use the `truncate` prop to truncate text with an ellipsis when it overflows its container.

<.demo>
  <:heex code={~S|<.flex max_width="200px"><.code truncate>linear-gradient(red, orange, yellow, green, blue);</.code></.flex>|}>
      <.flex max_width="200px">
        <.code truncate>linear-gradient(red, orange, yellow, green, blue);</.code>
      </.flex>
  </:heex>
</.demo>
