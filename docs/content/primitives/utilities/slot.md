---
title: Slot
description: Merges its props onto its immediate child.
---

Merges its props onto its immediate child.

<.demo variant="primitive" component="slot" css={primitive_css("slot")}>

  <:heex>
    <Slot.slot
              as="button"
              class="Button violet"
            >
              Composed Button
            </Slot.slot>
  </:heex>
</.demo>

<.highlights>
  <:item>Slot utility primitive.</:item>
</.highlights>

## Anatomy

```heex
<Slot.slot>
</Slot.slot>
```

<.anatomy>
  <:part name="Slot">The `slot` part.</:part>
</.anatomy>

## API Reference

### Slot

<.props_table module={EssenceUI.Primitives.Slot} function={:slot} />
