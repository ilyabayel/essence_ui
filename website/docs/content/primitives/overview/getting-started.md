---
title: Getting started
description: A quick tutorial to get you up and running with Essence UI Primitives.
---

A quick tutorial to get you up and running with Essence UI Primitives.

## Implementing a Popover

In this tutorial we will structure and style the [Popover](/primitives/docs/components/popover) primitive.

### 1. Use the library

Add Essence UI to your Phoenix project:

```elixir
{:essence_ui, "~> 0.2.0"}
```

Register LiveView hooks from `deps/essence_ui/assets/js/essence_ui.js`, then alias the primitive in your LiveView or function component module:

```elixir
alias EssenceUI.Primitives.Popover
```

### 2. Compose the parts

Import and structure the parts. Each primitive is a module with named function components (`root`, `trigger`, `content`, …).

```heex
<Popover.root id="getting-started-popover">
  <Popover.trigger id="getting-started-popover-trigger" content_id="getting-started-popover-content">
    More info
  </Popover.trigger>
  <Popover.content id="getting-started-popover-content" side_offset={5}>
    Some more info…
    <Popover.arrow />
  </Popover.content>
</Popover.root>
```

### 3. Add your styles

Primitives are unstyled. Pass `class` (and write CSS) for presentation. Demo styles live under `assets/css/primitives/`.

<.demo theme="light" variant="primitive" component="popover" css={primitive_css("popover")}>

  <:heex>
    <Popover.root id="docs-gs-popover">
      <Popover.trigger id="docs-gs-popover-trigger" content_id="docs-gs-popover-content" class="DemoIconButton" aria-label="Update dimensions">
        +
      </Popover.trigger>
      <Popover.content id="docs-gs-popover-content" class="DemoPopoverContent" side_offset={5}>
        <p class="DemoText" style="margin-bottom: 10px;">Dimensions</p>
        <Popover.close class="DemoPopoverClose" aria-label="Close">×</Popover.close>
        <Popover.arrow class="DemoPopoverArrow" />
      </Popover.content>
    </Popover.root>
  </:heex>
</.demo>

### 4. Next steps

- Read the [styling](/primitives/docs/guides/styling) guide for `class` and `data-state` patterns
- Browse [components](/primitives/docs/components/dialog) for APIs and examples
- Use [Themes](/themes/docs/overview/getting-started) when you want a styled design system on top of these primitives

## Summary

1. Alias the primitive module
2. Compose `Root` / `Trigger` / `Content` (and other parts) in HEEx
3. Style with your own CSS using classes and data attributes
