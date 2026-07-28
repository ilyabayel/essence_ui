---
title: Text Field
description: Captures user input with an optional slot for buttons and icons.
---

<.demo>
  <:heex code={~S|<.text_field placeholder="Search the docs…"><:slot><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg></:slot></.text_field>|}>
      <.text_field placeholder="Search the docs…">
        <:slot>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
        </:slot>
      </.text_field>
  </:heex>
</.demo>

## API Reference

### Root

Groups slot adornments and the input. This component is based on the `div` element and supports common margin props.

<.props_table module={EssenceUI.Components.TextField} function={:text_field} />

### Slot

Contains icons or buttons associated with the input. Pass one or more `<:slot>` entries; use `side="left"` (default) or `side="right"`.

```heex
<.text_field placeholder="Amount">
  <:slot>$</:slot>
  <:slot side="right">USD</:slot>
</.text_field>
```

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.box max_width="200px"><.text_field size="1" placeholder="Search the docs…" /></.box><.box max_width="250px"><.text_field size="2" placeholder="Search the docs…" /></.box><.box max_width="300px"><.text_field size="3" placeholder="Search the docs…" /></.box></.flex>|}>
      <.flex direction="column" gap="3">
        <.box max_width="200px">
          <.text_field size="1" placeholder="Search the docs…" />
        </.box>
        <.box max_width="250px">
          <.text_field size="2" placeholder="Search the docs…" />
        </.box>
        <.box max_width="300px">
          <.text_field size="3" placeholder="Search the docs…" />
        </.box>
      </.flex>
  </:heex>
</.demo>

Use matching component sizes when composing Text Field with buttons. However, don't use size 1 inputs with buttons—at this size, there is not enough vertical space to nest other interactive elements.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="400px"><.box max_width="200px"><.text_field placeholder="Search the docs…" size="1"><:slot><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg></:slot></.text_field></.box><.box max_width="250px"><.text_field placeholder="Search the docs…" size="2"><:slot><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg></:slot><:slot side="right"><.icon_button size="1" variant="ghost"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg></.icon_button></:slot></.text_field></.box><.box max_width="300px"><.text_field placeholder="Search the docs…" size="3"><:slot><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg></:slot><:slot side="right"><.icon_button size="2" variant="ghost"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg></.icon_button></:slot></.text_field></.box></.flex>|}>
      <.flex direction="column" gap="3" max_width="400px">
        <.box max_width="200px">
          <.text_field placeholder="Search the docs…" size="1">
            <:slot>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
            </:slot>
          </.text_field>
        </.box>
        <.box max_width="250px">
          <.text_field placeholder="Search the docs…" size="2">
            <:slot>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
            </:slot>
            <:slot side="right">
              <.icon_button size="1" variant="ghost">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg>
              </.icon_button>
            </:slot>
          </.text_field>
        </.box>
        <.box max_width="300px">
          <.text_field placeholder="Search the docs…" size="3">
            <:slot>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
            </:slot>
            <:slot side="right">
              <.icon_button size="2" variant="ghost">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg>
              </.icon_button>
            </:slot>
          </.text_field>
        </.box>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="250px"><.text_field variant="surface" placeholder="Search the docs…" /><.text_field variant="classic" placeholder="Search the docs…" /><.text_field variant="soft" placeholder="Search the docs…" /></.flex>|}>
      <.flex direction="column" gap="3" max_width="250px">
        <.text_field variant="surface" placeholder="Search the docs…" />
        <.text_field variant="classic" placeholder="Search the docs…" />
        <.text_field variant="soft" placeholder="Search the docs…" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="250px"><.text_field color="indigo" variant="soft" placeholder="Search the docs…" /><.text_field color="green" variant="soft" placeholder="Search the docs…" /><.text_field color="red" variant="soft" placeholder="Search the docs…" /></.flex>|}>
      <.flex direction="column" gap="3" max_width="250px">
        <.text_field color="indigo" variant="soft" placeholder="Search the docs…" />
        <.text_field color="green" variant="soft" placeholder="Search the docs…" />
        <.text_field color="red" variant="soft" placeholder="Search the docs…" />
      </.flex>
  </:heex>
</.demo>
