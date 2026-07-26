---
title: Label
description: Renders an accessible label associated with controls.
---

Renders an accessible label associated with controls.

<.demo variant="primitive" component="label" css={primitive_css("label")}>

  <:heex>
    <div style="display: flex; padding: 0 20px; flex-wrap: wrap; gap: 15px; align-items: center;">
              <Label.label
                id="label-first-name"
                class="LabelRoot"
                for="firstName"
              >
                First Name
              </Label.label>
              <input
                class="Input"
                type="text"
                id="firstName"
                value="Pedro Duarte"
              />
            </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Text selection is prevented when double clicking label.</:item>
  <:item>Supports nested controls.</:item>
</.highlights>

## Anatomy

```heex
<Label.label>
</Label.label>
```

<.anatomy>
  <:part name="Label">The `label` part.</:part>
</.anatomy>

## API Reference

### Label

<.props_table module={EssenceUI.Primitives.Label} function={:label} />

## Examples

See the live demo above and `storybook/primitives/label.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.
