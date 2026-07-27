---
title: Visually Hidden
description: Hides content from the screen in an accessible way.
---

Hides content from the screen in an accessible way.

<.demo theme="light" variant="primitive" component="visually-hidden" css={primitive_css("visually-hidden")}>
  <:heex>
    <button class="Button violet" type="button">
      Save
      <VisuallyHidden.visually_hidden> the document</VisuallyHidden.visually_hidden>
    </button>
  </:heex>
</.demo>

<.highlights>
  <:item>Visually hides content while preserving it for assistive technology.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<VisuallyHidden.visually_hidden>
  …
</VisuallyHidden.visually_hidden>
```

<.anatomy>
  <:part name="Visually Hidden">Hides content visually while keeping it available to screen readers.</:part>
</.anatomy>

## Basic example

Use the visually hidden primitive.

```heex
<button type="button">
  Save
  <VisuallyHidden.visually_hidden> the document</VisuallyHidden.visually_hidden>
</button>
```

## API Reference

### Visually Hidden

Anything you put inside this component will be hidden from the screen but will be announced by screen readers.

<.props_table module={EssenceUI.Primitives.VisuallyHidden} function={:visually_hidden} />

## Accessibility

This is useful in certain scenarios as an alternative to traditional labelling with `aria-label` or `aria-labelledby`.
