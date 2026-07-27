---
title: Button
description: Trigger an action or event, such as submitting a form or displaying a dialog.
---

<.demo>
  <:heex code={~S|<.button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button>|}>
      <.button>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
        Bookmark
      </.button>
  </:heex>
</.demo>

## API Reference

This component is based on the `button` element and supports common margin props.

<.props_table module={EssenceUI.Components.Button} function={:button} />

## Examples

### Size

Use the `size` prop to control the size of the button.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center"><.button size="1" variant="soft">Edit profile</.button><.button size="2" variant="soft">Edit profile</.button><.button size="3" variant="soft">Edit profile</.button></.flex>|}>
      <.flex gap="3" align="center">
        <.button size="1" variant="soft">Edit profile</.button>
        <.button size="2" variant="soft">Edit profile</.button>
        <.button size="3" variant="soft">Edit profile</.button>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the button.

<.demo>
  <:heex code={~S|<.flex align="center" gap="3" wrap="wrap"><.button variant="classic">Edit profile</.button><.button variant="solid">Edit profile</.button><.button variant="soft">Edit profile</.button><.button variant="surface">Edit profile</.button><.button variant="outline">Edit profile</.button></.flex>|}>
      <.flex align="center" gap="3" wrap="wrap">
        <.button variant="classic">Edit profile</.button>
        <.button variant="solid">Edit profile</.button>
        <.button variant="soft">Edit profile</.button>
        <.button variant="surface">Edit profile</.button>
        <.button variant="outline">Edit profile</.button>
      </.flex>
  </:heex>
</.demo>

#### Ghost

Use the `ghost` variant to display a button without chrome. Ghost buttons behave like text in layout, as they use a negative margin to optically align themselves against their siblings while maintaining the padding in active and hover states.

<.demo>
  <:heex code={~S|<.button variant="ghost">Edit profile</.button>|}>
      <.button variant="ghost">Edit profile</.button>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button color="indigo" variant="soft">Edit profile</.button><.button color="cyan" variant="soft">Edit profile</.button><.button color="orange" variant="soft">Edit profile</.button><.button color="crimson" variant="soft">Edit profile</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button color="indigo" variant="soft">Edit profile</.button>
        <.button color="cyan" variant="soft">Edit profile</.button>
        <.button color="orange" variant="soft">Edit profile</.button>
        <.button color="crimson" variant="soft">Edit profile</.button>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.flex gap="3" wrap="wrap"><.button color="gray" variant="classic">Edit profile</.button><.button color="gray" variant="solid">Edit profile</.button><.button color="gray" variant="soft">Edit profile</.button><.button color="gray" variant="surface">Edit profile</.button><.button color="gray" variant="outline">Edit profile</.button></.flex><.flex gap="3" wrap="wrap"><.button color="gray" variant="classic" high_contrast>Edit profile</.button><.button color="gray" variant="solid" high_contrast>Edit profile</.button><.button color="gray" variant="soft" high_contrast>Edit profile</.button><.button color="gray" variant="surface" high_contrast>Edit profile</.button><.button color="gray" variant="outline" high_contrast>Edit profile</.button></.flex></.flex>|}>
      <.flex direction="column" gap="3">
        <.flex gap="3" wrap="wrap">
          <.button color="gray" variant="classic">Edit profile</.button>
          <.button color="gray" variant="solid">Edit profile</.button>
          <.button color="gray" variant="soft">Edit profile</.button>
          <.button color="gray" variant="surface">Edit profile</.button>
          <.button color="gray" variant="outline">Edit profile</.button>
        </.flex>
        <.flex gap="3" wrap="wrap">
          <.button color="gray" variant="classic" high_contrast>Edit profile</.button>
          <.button color="gray" variant="solid" high_contrast>Edit profile</.button>
          <.button color="gray" variant="soft" high_contrast>Edit profile</.button>
          <.button color="gray" variant="surface" high_contrast>Edit profile</.button>
          <.button color="gray" variant="outline" high_contrast>Edit profile</.button>
        </.flex>
      </.flex>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button radius="none" variant="soft">Edit profile</.button><.button radius="large" variant="soft">Edit profile</.button><.button radius="full" variant="soft">Edit profile</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button radius="none" variant="soft">Edit profile</.button>
        <.button radius="large" variant="soft">Edit profile</.button>
        <.button radius="full" variant="soft">Edit profile</.button>
      </.flex>
  </:heex>
</.demo>

### With icons

You can nest icons directly inside the button. An appropriate gap is provided automatically.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button variant="classic"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button><.button variant="solid"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button><.button variant="soft"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button><.button variant="surface"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button><.button variant="outline"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg> Bookmark</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button variant="classic">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
          Bookmark
        </.button>
        <.button variant="solid">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
          Bookmark
        </.button>
        <.button variant="soft">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
          Bookmark
        </.button>
        <.button variant="surface">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
          Bookmark
        </.button>
        <.button variant="outline">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>
          Bookmark
        </.button>
      </.flex>
  </:heex>
</.demo>

### Loading

Use the `loading` prop to display a loading spinner in place of button content, preserving the original size of the button in its normal state. The button will be disabled while loading.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.button loading variant="classic">Bookmark</.button><.button loading variant="solid">Bookmark</.button><.button loading variant="soft">Bookmark</.button><.button loading variant="surface">Bookmark</.button><.button loading variant="outline">Bookmark</.button></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.button loading variant="classic">Bookmark</.button>
        <.button loading variant="solid">Bookmark</.button>
        <.button loading variant="soft">Bookmark</.button>
        <.button loading variant="surface">Bookmark</.button>
        <.button loading variant="outline">Bookmark</.button>
      </.flex>
  </:heex>
</.demo>
