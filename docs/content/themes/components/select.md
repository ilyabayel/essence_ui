---
title: Select
description: Displays a list of options for the user to pick from—triggered by a button.
---

<.demo>
  <:heex code={~S|<.select_root id="docs-select-hero" value="apple"><.select_trigger /><.select_content><.select_group><.select_label>Fruits</.select_label><.select_item value="orange">Orange</.select_item><.select_item value="apple">Apple</.select_item><.select_item value="grape" disabled>Grape</.select_item></.select_group><.select_separator /><.select_group><.select_label>Vegetables</.select_label><.select_item value="carrot">Carrot</.select_item><.select_item value="potato">Potato</.select_item></.select_group></.select_content></.select_root>|}>
      <.select_root id="docs-select-hero" value="apple">
        <.select_trigger />
        <.select_content>
          <.select_group>
            <.select_label>Fruits</.select_label>
            <.select_item value="orange">Orange</.select_item>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="grape" disabled>Grape</.select_item>
          </.select_group>
          <.select_separator />
          <.select_group>
            <.select_label>Vegetables</.select_label>
            <.select_item value="carrot">Carrot</.select_item>
            <.select_item value="potato">Potato</.select_item>
          </.select_group>
        </.select_content>
      </.select_root>
  </:heex>
</.demo>

## API Reference

### Root

Contains all the parts of a select. It inherits props from the Select primitive [Root](/primitives/docs/components/select#root) part. Use a controlled `value` (LiveView has no `default_value`).

<.props_table module={EssenceUI.Components.Select} function={:select_root} />

### Trigger

The button that toggles the select. Supports common margin props via shared styling on the trigger surface.

<.props_table module={EssenceUI.Components.Select} function={:select_trigger} />

### Content

The component that pops out when the select is open.

<.props_table module={EssenceUI.Components.Select} function={:select_content} />

### Item

The component that contains the select items.

<.props_table module={EssenceUI.Components.Select} function={:select_item} />

### Group

Used to group multiple items. Use in conjunction with `select_label` for accessibility labelling.

<.props_table module={EssenceUI.Components.Select} function={:select_group} />

### Label

Used to render the label of a group; it isn't focusable using arrow keys.

<.props_table module={EssenceUI.Components.Select} function={:select_label} />

### Separator

Used to visually separate items in the Select.

<.props_table module={EssenceUI.Components.Select} function={:select_separator} />

## Examples

### Size

Use the `size` prop on `select_trigger` and `select_content` to control the size.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center" wrap="wrap"><.select_root id="docs-select-size-1" value="apple"><.select_trigger size="1" /><.select_content size="1"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-size-2" value="apple"><.select_trigger size="2" /><.select_content size="2"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-size-3" value="apple"><.select_trigger size="3" /><.select_content size="3"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root></.flex>|}>
      <.flex gap="3" align="center" wrap="wrap">
        <.select_root id="docs-select-size-1" value="apple">
          <.select_trigger size="1" />
          <.select_content size="1">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-size-2" value="apple">
          <.select_trigger size="2" />
          <.select_content size="2">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-size-3" value="apple">
          <.select_trigger size="3" />
          <.select_content size="3">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop on `select_trigger` to customize the visual style.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center" wrap="wrap"><.select_root id="docs-select-variant-surface" value="apple"><.select_trigger variant="surface" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-variant-classic" value="apple"><.select_trigger variant="classic" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-variant-soft" value="apple"><.select_trigger variant="soft" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root></.flex>|}>
      <.flex gap="3" align="center" wrap="wrap">
        <.select_root id="docs-select-variant-surface" value="apple">
          <.select_trigger variant="surface" />
          <.select_content>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-variant-classic" value="apple">
          <.select_trigger variant="classic" />
          <.select_content>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-variant-soft" value="apple">
          <.select_trigger variant="soft" />
          <.select_content>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
      </.flex>
  </:heex>
</.demo>

#### Ghost

Use the `ghost` trigger variant to render the trigger without a visually containing element. Ghost triggers behave differently in layout as they use a negative margin to optically align themselves against their siblings while maintaining their padded active and hover states.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center" wrap="wrap"><.select_root id="docs-select-ghost-surface" value="apple"><.select_trigger variant="surface" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-ghost" value="apple"><.select_trigger variant="ghost" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root></.flex>|}>
      <.flex gap="3" align="center" wrap="wrap">
        <.select_root id="docs-select-ghost-surface" value="apple">
          <.select_trigger variant="surface" />
          <.select_content>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-ghost" value="apple">
          <.select_trigger variant="ghost" />
          <.select_content>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop on `select_trigger` and `select_content` to assign a specific color value.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.select_root id="docs-select-color-indigo" value="apple"><.select_trigger color="indigo" variant="soft" /><.select_content color="indigo"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-color-cyan" value="apple"><.select_trigger color="cyan" variant="soft" /><.select_content color="cyan"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-color-orange" value="apple"><.select_trigger color="orange" variant="soft" /><.select_content color="orange"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-color-crimson" value="apple"><.select_trigger color="crimson" variant="soft" /><.select_content color="crimson"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.select_root id="docs-select-color-indigo" value="apple">
          <.select_trigger color="indigo" variant="soft" />
          <.select_content color="indigo">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-color-cyan" value="apple">
          <.select_trigger color="cyan" variant="soft" />
          <.select_content color="cyan">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-color-orange" value="apple">
          <.select_trigger color="orange" variant="soft" />
          <.select_content color="orange">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-color-crimson" value="apple">
          <.select_trigger color="crimson" variant="soft" />
          <.select_content color="crimson">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop on `select_content` to increase item contrast.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.select_root id="docs-select-hc-off" value="apple"><.select_trigger color="gray" /><.select_content color="gray" variant="solid"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root><.select_root id="docs-select-hc-on" value="apple"><.select_trigger color="gray" /><.select_content color="gray" variant="solid" high_contrast><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.select_root id="docs-select-hc-off" value="apple">
          <.select_trigger color="gray" />
          <.select_content color="gray" variant="solid">
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
        <.select_root id="docs-select-hc-on" value="apple">
          <.select_trigger color="gray" />
          <.select_content color="gray" variant="solid" high_contrast>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="orange">Orange</.select_item>
          </.select_content>
        </.select_root>
      </.flex>
  </:heex>
</.demo>

### Placeholder

Use the `placeholder` prop to create a trigger that doesn't need an initial value.

<.demo>
  <:heex code={~S|<.select_root id="docs-select-placeholder"><.select_trigger placeholder="Pick a fruit" /><.select_content><.select_group><.select_label>Fruits</.select_label><.select_item value="orange">Orange</.select_item><.select_item value="apple">Apple</.select_item><.select_item value="grape" disabled>Grape</.select_item></.select_group><.select_separator /><.select_group><.select_label>Vegetables</.select_label><.select_item value="carrot">Carrot</.select_item><.select_item value="potato">Potato</.select_item></.select_group></.select_content></.select_root>|}>
      <.select_root id="docs-select-placeholder">
        <.select_trigger placeholder="Pick a fruit" />
        <.select_content>
          <.select_group>
            <.select_label>Fruits</.select_label>
            <.select_item value="orange">Orange</.select_item>
            <.select_item value="apple">Apple</.select_item>
            <.select_item value="grape" disabled>Grape</.select_item>
          </.select_group>
          <.select_separator />
          <.select_group>
            <.select_label>Vegetables</.select_label>
            <.select_item value="carrot">Carrot</.select_item>
            <.select_item value="potato">Potato</.select_item>
          </.select_group>
        </.select_content>
      </.select_root>
  </:heex>
</.demo>

### Position

Set `position="popper"` on content to position the select menu below the trigger.

<.demo>
  <:heex code={~S|<.select_root id="docs-select-popper" value="apple"><.select_trigger /><.select_content position="popper"><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root>|}>
      <.select_root id="docs-select-popper" value="apple">
        <.select_trigger />
        <.select_content position="popper">
          <.select_item value="apple">Apple</.select_item>
          <.select_item value="orange">Orange</.select_item>
        </.select_content>
      </.select_root>
  </:heex>
</.demo>
