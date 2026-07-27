---
title: Label
description: Renders an accessible label associated with controls.
---

Renders an accessible label associated with controls.

<.demo theme="light" variant="primitive" component="label" css={primitive_css("label")}>
  <:heex>
    <div style="display: flex; padding: 0 20px; flex-wrap: wrap; gap: 15px; align-items: center;">
      <Label.label class="LabelRoot" for="firstName">
        First Name
      </Label.label>
      <input class="Input" type="text" id="firstName" value="Pedro Duarte" />
    </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Text selection is prevented when double clicking label.</:item>
  <:item>Supports nested controls.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<Label.label />
```

<.anatomy>
  <:part name="Label">Contains the content for the label.</:part>
</.anatomy>

## API Reference

### Label

Contains the content for the label. Use `for` to associate with a control.

<.props_table module={EssenceUI.Primitives.Label} function={:label} />

## Accessibility

This component is based on the native `label` element. It applies the correct labelling when wrapping controls or using the `for` attribute. For custom controls to work correctly, ensure they use native elements such as `button` or `input` as a base.
