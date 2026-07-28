---
title: Checkbox Group
description: A set of checkboxes that can be used to select multiple options.
---

A set of checkboxes that can be used to select multiple options.

<.demo theme="light" variant="primitive" component="checkbox-group" css={primitive_css("checkbox")}>
  <:heex>
    <form>
      <CheckboxGroup.root
        id="checkbox-group-primitive"
        class="DemoCheckboxGroupRoot"
        default_value={["fun"]}
        name="traits"
        aria-label="Personality traits"
      >
        <div style="display: flex; align-items: center;">
          <CheckboxGroup.item class="DemoCheckboxGroupItem" value="fun" id="cg1" checked>
            <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" checked>✓</CheckboxGroup.indicator>
          </CheckboxGroup.item>
          <label class="DemoLabel" for="cg1">Fun</label>
        </div>
        <div style="display: flex; align-items: center;">
          <CheckboxGroup.item class="DemoCheckboxGroupItem" value="serious" id="cg2">
            <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" />
          </CheckboxGroup.item>
          <label class="DemoLabel" for="cg2">Serious</label>
        </div>
        <div style="display: flex; align-items: center;">
          <CheckboxGroup.item class="DemoCheckboxGroupItem" value="smart" id="cg3">
            <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" />
          </CheckboxGroup.item>
          <label class="DemoLabel" for="cg3">Smart</label>
        </div>
      </CheckboxGroup.root>
    </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports multi-select.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<CheckboxGroup.root>
  <CheckboxGroup.item>
    <CheckboxGroup.indicator />
  </CheckboxGroup.item>
</CheckboxGroup.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a checkbox group.</:part>
  <:part name="Item">An item in the group that can be checked.</:part>
  <:part name="Indicator">Renders when the item is checked.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a checkbox group.

<.props_table module={EssenceUI.Primitives.CheckboxGroup} function={:root} />

### Item

An item in the group that can be checked.

<.props_table module={EssenceUI.Primitives.CheckboxGroup} function={:item} />

### Indicator

Renders when the item is checked.

<.props_table module={EssenceUI.Primitives.CheckboxGroup} function={:indicator} />
