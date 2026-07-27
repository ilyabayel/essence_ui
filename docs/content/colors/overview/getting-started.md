---
title: Getting started
description: Use Essence color scales with Themes.
---

Essence Colors ship as 12-step color scales (inspired by [Radix Colors](https://www.radix-ui.com/colors)), as CSS custom properties consumed by Themes via `accent_color` and `gray_color`.

## Import

Color tokens ship with Essence UI styles:

```css
@import "essence-ui/styles.css";
```

## Use with Theme

```heex
<.theme accent_color="indigo" gray_color="slate">
  <.button>Indigo accent</.button>
</.theme>
```

## CSS variables

Each scale exposes steps `1`–`12`, for example `var(--indigo-9)` or `var(--slate-a6)` for alpha steps when available.

Browse the visual scales on the [Colors home](/colors).
