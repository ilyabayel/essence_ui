---
title: Introduction
description: Unstyled, accessible Phoenix LiveView primitives for building design systems and web apps.
---

Essence UI Primitives is a low-level UI component library for Phoenix LiveView with a focus on accessibility, customization, and developer experience. Use these components as the base layer of your design system, or adopt them incrementally. The API and patterns are inspired by [Radix Primitives](https://www.radix-ui.com/primitives).

## Vision

Most of us share similar definitions for common UI patterns like accordion, checkbox, dialog, dropdown, select, slider, and tooltip. These UI patterns are [documented by WAI-ARIA](https://www.w3.org/WAI/ARIA/apg/) and generally understood by the community.

However, the implementations provided by the web platform are often inadequate—non-existent, lacking functionality, or hard to customize. Developers are forced to build custom components, which is difficult. As a result, many components on the web are inaccessible or missing important features.

Our goal is an open-source component library the community can use to build accessible design systems on Phoenix LiveView.

## Key Features

### Accessible

Components adhere to the [WAI-ARIA design patterns](https://www.w3.org/WAI/ARIA/apg/) where possible. We handle many of the difficult implementation details related to accessibility, including aria and role attributes, focus management, and keyboard navigation. Learn more in our [accessibility](/primitives/docs/overview/accessibility) overview.

### Unstyled

Components ship without styles, giving you complete control over the look and feel. Style with plain CSS, CSS modules, Tailwind, or pair with [Essence UI Themes](/themes/docs/overview/getting-started) for a ready-made visual layer.

### Opened

Primitives are designed to be customized. The open component architecture gives you granular access to each part, so you can wrap them and add your own attributes, events, or LiveView bindings.

### Uncontrolled

Where applicable, components are uncontrolled by default but can also be controlled. Behavior wiring is handled internally via hooks, so you can get up and running without managing every bit of local state yourself.

### Developer experience

All primitives share a similar compound API (`Root`, `Trigger`, `Content`, …), creating a consistent and predictable experience in HEEx.

### Incremental adoption

Import only the primitives you need from `EssenceUI.Primitives`. Adopt one component at a time—for example start with Dialog, then add Tooltip—without committing to Themes.

```elixir
alias EssenceUI.Primitives.Dialog
alias EssenceUI.Primitives.Tooltip
```

When you want styled, opinionated components on top of the same patterns, use [Themes](/themes/docs/overview/getting-started).
