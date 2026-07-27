---
title: Direction Provider
description: Wraps your app to provide global reading direction.
---

Wraps your app to provide global reading direction.

<.demo theme="light" variant="primitive" component="direction-provider" css={primitive_css("direction-provider")}>
  <:heex>
    <DirectionProvider.direction_provider
      dir="rtl"
      style="background: white; color: var(--mauve-12); padding: 20px; border-radius: 6px; width: 260px;"
    >
      <p style="margin: 0 0 10px; font-weight: 500;">من اليمين إلى اليسار</p>
      <div class="SeparatorRoot" style="background: var(--violet-6); height: 1px; margin: 12px 0;"></div>
      <p style="margin: 0; font-size: 14px; color: var(--mauve-11);">Right-to-left reading direction.</p>
    </DirectionProvider.direction_provider>
  </:heex>
</.demo>

<.highlights>
  <:item>Enables all primitives to inherit global reading direction.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<DirectionProvider.direction_provider>
  …
</DirectionProvider.direction_provider>
```

<.anatomy>
  <:part name="Direction Provider">Provides global reading direction to descendants.</:part>
</.anatomy>

## API Reference

### Direction Provider

When creating localized apps that require right-to-left (RTL) reading direction, wrap your application with `DirectionProvider.direction_provider` so primitives adjust their behavior based on the `dir` attribute.

<.props_table module={EssenceUI.Primitives.DirectionProvider} function={:direction_provider} />

## Example

Use the direction provider.

```heex
<DirectionProvider.direction_provider dir="rtl">
  …your app…
</DirectionProvider.direction_provider>
```
