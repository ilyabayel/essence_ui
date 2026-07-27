---
title: Separator
description: Visually or semantically separates content.
aria: https://www.w3.org/TR/wai-aria-1.2/#separator
---

Visually or semantically separates content.

<.demo variant="primitive" component="separator" css={primitive_css("separator")}>
  <:heex>
    <div style="width: 100%; max-width: 300px; margin: 0 15px;">
      <div class="DemoSeparatorText" style="font-weight: 500;">Essence UI</div>
      <div class="DemoSeparatorText">An open-source UI component library.</div>
      <Separator.separator class="DemoSeparatorRoot" style="margin: 15px 0;" />
      <div style="display: flex; height: 20px; align-items: center;">
        <div class="DemoSeparatorText">Blog</div>
        <Separator.separator class="DemoSeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
        <div class="DemoSeparatorText">Docs</div>
        <Separator.separator class="DemoSeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
        <div class="DemoSeparatorText">Source</div>
      </div>
    </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports horizontal and vertical orientations.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<Separator.separator />
```

<.anatomy>
  <:part name="Separator">The separator.</:part>
</.anatomy>

## API Reference

### Separator

The separator.

<.props_table module={EssenceUI.Primitives.Separator} function={:separator} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the separator.</:row>
</.data_attributes_table>

## Accessibility

Adheres to the [`separator` role requirements](https://www.w3.org/TR/wai-aria-1.2/#separator).
