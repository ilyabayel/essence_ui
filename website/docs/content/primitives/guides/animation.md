---
title: Animation
description: Animate primitives with CSS keyframes or transitions keyed off data-state.
---

Adding animation to Essence UI Primitives should feel similar to any other component. Prefer CSS keyed off `data-state` for mount and unmount phases.

## Animating with CSS

The simplest way to animate primitives is with CSS. Stateful parts expose `data-state` values such as `open` / `closed` or `checked` / `unchecked`.

```css
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes fadeOut {
  from { opacity: 1; }
  to { opacity: 0; }
}

.DemoDialogOverlay[data-state="open"],
.DemoDialogContent[data-state="open"] {
  animation: fadeIn 300ms ease-out;
}

.DemoDialogOverlay[data-state="closed"],
.DemoDialogContent[data-state="closed"] {
  animation: fadeOut 300ms ease-in;
}
```

You can also use transitions:

```css
.DemoCollapsibleContent {
  overflow: hidden;
  transition: height 300ms ease;
}
```

## JavaScript animation libraries

Essence LiveView primitives keep parts in the DOM and toggle visibility/`data-state` via hooks. Animate with CSS against `data-state`, or drive controlled `open` from LiveView assign updates coordinated with your preferred JS.

When you need custom exit timing, keep the part mounted while `data-state="closed"` animations run, then sync `open={false}` from the client hook or LiveView after the animation ends.
