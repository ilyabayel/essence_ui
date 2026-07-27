---
title: Styling
description: Primitives are unstyled—compatible with any styling solution—giving you complete control.
---

Essence UI Primitives are unstyled and compatible with any styling solution, giving you complete control over styling.

## Styling overview

### Functional styles

You are in control of all aspects of styling, including functional styles. For example—by default—a [Dialog Overlay](/primitives/docs/components/dialog) won't cover the entire viewport. You're responsible for adding those styles, plus any presentation styles.

### Classes

All parts accept a `class` attribute (and other global HTML attrs via `rest`). The class is passed through to the DOM element. You can use it in CSS as expected.

### Data attributes

When components are stateful, their state is exposed in a `data-state` attribute. For example, when an [Accordion Item](/primitives/docs/components/accordion) is opened, it includes `data-state="open"`.

## Styling with CSS

### Styling a part

Style a component part by targeting the `class` you provide.

```heex
<Accordion.item class="DemoAccordionItem" value="item-1">
  …
</Accordion.item>
```

```css
.DemoAccordionItem {
  border-bottom: 1px solid var(--border);
}
```

### Styling a state

Style a component state by targeting its `data-state` attribute.

```css
.DemoAccordionItem[data-state="open"] {
  background: var(--accent-subtle);
}

.DemoAccordionItem[data-state="closed"] {
  background: transparent;
}
```

### Extending a primitive

You typically wrap parts in your own function components to encode design-system styles once, then reuse them across the app. See the [composition](/primitives/docs/guides/composition) guide.

## With Themes

If you want opinionated styles out of the box, pair primitives with [Essence UI Themes](/themes/docs/overview/getting-started)—or use Themes components that already sit on top of these patterns.
