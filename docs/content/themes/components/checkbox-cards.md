---
title: Checkbox Cards
description: Set of interactive cards where multiple options can be selected at a time.
---

<.demo>
  <:heex code={~S|<.box max_width="600px"><.checkbox_cards_root id="checkbox-cards-hero" default_value={["1"]} columns="3"><.checkbox_cards_item value="1"><.flex direction="column" width="100%"><.text weight="bold">A1 Keyboard</.text><.text>US Layout</.text></.flex></.checkbox_cards_item><.checkbox_cards_item value="2"><.flex direction="column" width="100%"><.text weight="bold">Pro Mouse</.text><.text>Zero-lag wireless</.text></.flex></.checkbox_cards_item><.checkbox_cards_item value="3"><.flex direction="column" width="100%"><.text weight="bold">Lightning Mat</.text><.text>Wireless charging</.text></.flex></.checkbox_cards_item></.checkbox_cards_root></.box>|}>
      <.box max_width="600px">
        <.checkbox_cards_root id="checkbox-cards-hero" default_value={["1"]} columns="3">
          <.checkbox_cards_item value="1">
            <.flex direction="column" width="100%">
              <.text weight="bold">A1 Keyboard</.text>
              <.text>US Layout</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="2">
            <.flex direction="column" width="100%">
              <.text weight="bold">Pro Mouse</.text>
              <.text>Zero-lag wireless</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="3">
            <.flex direction="column" width="100%">
              <.text weight="bold">Lightning Mat</.text>
              <.text>Wireless charging</.text>
            </.flex>
          </.checkbox_cards_item>
        </.checkbox_cards_root>
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

### Root

<.props_table module={EssenceUI.Components.CheckboxCards} function={:checkbox_cards_root} />

### Item

An item in the group that can be checked.

<.props_table module={EssenceUI.Components.CheckboxCards} function={:checkbox_cards_item} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="3"><.checkbox_cards_root id="checkbox-cards-size-1" default_value={["1"]} size="1"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-size-2" default_value={["1"]} size="2"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-size-3" default_value={["1"]} size="3"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root></.flex>|}>
      <.flex align="center" gap="3">
        <.checkbox_cards_root id="checkbox-cards-size-1" default_value={["1"]} size="1">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-size-2" default_value={["1"]} size="2">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-size-3" default_value={["1"]} size="3">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="200px"><.checkbox_cards_root id="checkbox-cards-variant-surface" default_value={["1"]} variant="surface"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-variant-classic" default_value={["1"]} variant="classic"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root></.flex>|}>
      <.flex direction="column" gap="3" max_width="200px">
        <.checkbox_cards_root id="checkbox-cards-variant-surface" default_value={["1"]} variant="surface">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-variant-classic" default_value={["1"]} variant="classic">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="200px"><.checkbox_cards_root id="checkbox-cards-color-indigo" default_value={["1"]} color="indigo"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-color-cyan" default_value={["1"]} color="cyan"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-color-orange" default_value={["1"]} color="orange"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-color-crimson" default_value={["1"]} color="crimson"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root></.flex>|}>
      <.flex direction="column" gap="3" max_width="200px">
        <.checkbox_cards_root id="checkbox-cards-color-indigo" default_value={["1"]} color="indigo">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-color-cyan" default_value={["1"]} color="cyan">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-color-orange" default_value={["1"]} color="orange">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-color-crimson" default_value={["1"]} color="crimson">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3" display="inline-grid"><.checkbox_cards_root id="checkbox-cards-hc-indigo" default_value={["1"]} color="indigo"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-indigo-contrast" default_value={["1"]} color="indigo" high_contrast><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-cyan" default_value={["1"]} color="cyan"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-cyan-contrast" default_value={["1"]} color="cyan" high_contrast><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-orange" default_value={["1"]} color="orange"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-orange-contrast" default_value={["1"]} color="orange" high_contrast><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-crimson" default_value={["1"]} color="crimson"><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-hc-crimson-contrast" default_value={["1"]} color="crimson" high_contrast><.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item></.checkbox_cards_root></.grid>|}>
      <.grid columns="2" gap="3" display="inline-grid">
        <.checkbox_cards_root id="checkbox-cards-hc-indigo" default_value={["1"]} color="indigo">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-indigo-contrast" default_value={["1"]} color="indigo" high_contrast>
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-cyan" default_value={["1"]} color="cyan">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-cyan-contrast" default_value={["1"]} color="cyan" high_contrast>
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-orange" default_value={["1"]} color="orange">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-orange-contrast" default_value={["1"]} color="orange" high_contrast>
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-crimson" default_value={["1"]} color="crimson">
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-hc-crimson-contrast" default_value={["1"]} color="crimson" high_contrast>
          <.checkbox_cards_item value="1">Agree to Terms</.checkbox_cards_item>
        </.checkbox_cards_root>
      </.grid>
  </:heex>
</.demo>

### Disabled

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="450px"><.checkbox_cards_root id="checkbox-cards-disabled-on" columns="2" default_value={["2"]}><.checkbox_cards_item value="1">Off</.checkbox_cards_item><.checkbox_cards_item value="2">On</.checkbox_cards_item></.checkbox_cards_root><.checkbox_cards_root id="checkbox-cards-disabled-all" columns="2" default_value={["2"]}><.checkbox_cards_item value="1" disabled>Off</.checkbox_cards_item><.checkbox_cards_item value="2" disabled>On</.checkbox_cards_item></.checkbox_cards_root></.flex>|}>
      <.flex direction="column" gap="4" max_width="450px">
        <.checkbox_cards_root id="checkbox-cards-disabled-on" columns="2" default_value={["2"]}>
          <.checkbox_cards_item value="1">Off</.checkbox_cards_item>
          <.checkbox_cards_item value="2">On</.checkbox_cards_item>
        </.checkbox_cards_root>
        <.checkbox_cards_root id="checkbox-cards-disabled-all" columns="2" default_value={["2"]}>
          <.checkbox_cards_item value="1" disabled>Off</.checkbox_cards_item>
          <.checkbox_cards_item value="2" disabled>On</.checkbox_cards_item>
        </.checkbox_cards_root>
      </.flex>
  </:heex>
</.demo>
