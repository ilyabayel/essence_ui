---
title: Slot
description: Merges its props onto its immediate child.
---

Merges its props onto its immediate child.

<.demo theme="light" variant="primitive" component="slot" css={primitive_css("slot")}>
  <:heex>
    <Slot.slot as="button" class="Button violet" type="button">
      Composed Button
    </Slot.slot>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be used to support your own polymorphic component API.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<Slot.slot>
  …
</Slot.slot>
```

<.anatomy>
  <:part name="Slot">Renders a chosen HTML tag with merged attributes.</:part>
</.anatomy>

## API Reference

### Slot

Renders the element specified by `as` with merged attributes and content.

<.props_table module={EssenceUI.Primitives.Slot} function={:slot} />

## Basic example

Use to create polymorphic components that can render as different HTML elements.

When your component should render as a specific tag, pass `as` and any shared attributes:

```heex
<Slot.slot as="button" class="Button violet" type="button">
  Click me
</Slot.slot>
```

Use additional HTML attributes through global assigns (for example `type`, `href`, or `phx-click`):

```heex
<Slot.slot as="a" class="Button violet" href="/contact">
  Contact
</Slot.slot>
```

See the [Composition guide](/primitives/docs/guides/composition) for how Slot fits into Essence UI patterns.
