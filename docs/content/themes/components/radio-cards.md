---
title: Radio Cards
description: Set of interactive cards where only one can be selected at a time.
---

<.demo>
  <:heex code={~S|<.box max_width="600px"><.radio_cards_root id="radio-cards-hero" default_value="1" columns="3"><.radio_cards_item value="1"><.flex direction="column" width="100%"><.text weight="bold">8-core CPU</.text><.text>32 GB RAM</.text></.flex></.radio_cards_item><.radio_cards_item value="2"><.flex direction="column" width="100%"><.text weight="bold">6-core CPU</.text><.text>24 GB RAM</.text></.flex></.radio_cards_item><.radio_cards_item value="3"><.flex direction="column" width="100%"><.text weight="bold">4-core CPU</.text><.text>16 GB RAM</.text></.flex></.radio_cards_item></.radio_cards_root></.box>|}>
      <.box max_width="600px">
        <.radio_cards_root id="radio-cards-hero" default_value="1" columns="3">
          <.radio_cards_item value="1">
            <.flex direction="column" width="100%">
              <.text weight="bold">8-core CPU</.text>
              <.text>32 GB RAM</.text>
            </.flex>
          </.radio_cards_item>
          <.radio_cards_item value="2">
            <.flex direction="column" width="100%">
              <.text weight="bold">6-core CPU</.text>
              <.text>24 GB RAM</.text>
            </.flex>
          </.radio_cards_item>
          <.radio_cards_item value="3">
            <.flex direction="column" width="100%">
              <.text weight="bold">4-core CPU</.text>
              <.text>16 GB RAM</.text>
            </.flex>
          </.radio_cards_item>
        </.radio_cards_root>
      </.box>
  </:heex>
</.demo>

## API Reference

This component supports common margin props.

### Root

<.props_table module={EssenceUI.Components.RadioCards} function={:radio_cards_root} />

### Item

An item in the group that can be checked.

<.props_table module={EssenceUI.Components.RadioCards} function={:radio_cards_item} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex align="center" gap="3"><.radio_cards_root id="radio-cards-size-1" size="1" default_value="1"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-size-2" size="2" default_value="1"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-size-3" size="3" default_value="1"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root></.flex>|}>
      <.flex align="center" gap="3">
        <.radio_cards_root id="radio-cards-size-1" size="1" default_value="1">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-size-2" size="2" default_value="1">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-size-3" size="3" default_value="1">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="200px"><.radio_cards_root id="radio-cards-variant-surface" default_value="1" variant="surface"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-variant-classic" default_value="1" variant="classic"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root></.flex>|}>
      <.flex direction="column" gap="3" max_width="200px">
        <.radio_cards_root id="radio-cards-variant-surface" default_value="1" variant="surface">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-variant-classic" default_value="1" variant="classic">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="200px"><.radio_cards_root id="radio-cards-color-indigo" default_value="1" color="indigo"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-color-cyan" default_value="1" color="cyan"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-color-orange" default_value="1" color="orange"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-color-crimson" default_value="1" color="crimson"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root></.flex>|}>
      <.flex direction="column" gap="3" max_width="200px">
        <.radio_cards_root id="radio-cards-color-indigo" default_value="1" color="indigo">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-color-cyan" default_value="1" color="cyan">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-color-orange" default_value="1" color="orange">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-color-crimson" default_value="1" color="crimson">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3" display="inline-grid"><.radio_cards_root id="radio-cards-hc-indigo" default_value="1" color="indigo"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-indigo-contrast" default_value="1" color="indigo" high_contrast><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-cyan" default_value="1" color="cyan"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-cyan-contrast" default_value="1" color="cyan" high_contrast><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-orange" default_value="1" color="orange"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-orange-contrast" default_value="1" color="orange" high_contrast><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-crimson" default_value="1" color="crimson"><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-hc-crimson-contrast" default_value="1" color="crimson" high_contrast><.radio_cards_item value="1">8-core CPU</.radio_cards_item></.radio_cards_root></.grid>|}>
      <.grid columns="2" gap="3" display="inline-grid">
        <.radio_cards_root id="radio-cards-hc-indigo" default_value="1" color="indigo">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-indigo-contrast" default_value="1" color="indigo" high_contrast>
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-cyan" default_value="1" color="cyan">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-cyan-contrast" default_value="1" color="cyan" high_contrast>
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-orange" default_value="1" color="orange">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-orange-contrast" default_value="1" color="orange" high_contrast>
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-crimson" default_value="1" color="crimson">
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-hc-crimson-contrast" default_value="1" color="crimson" high_contrast>
          <.radio_cards_item value="1">8-core CPU</.radio_cards_item>
        </.radio_cards_root>
      </.grid>
  </:heex>
</.demo>

### Disabled

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4" max_width="450px"><.radio_cards_root id="radio-cards-disabled-on" columns="2" default_value="2"><.radio_cards_item value="1">Off</.radio_cards_item><.radio_cards_item value="2">On</.radio_cards_item></.radio_cards_root><.radio_cards_root id="radio-cards-disabled-all" columns="2" default_value="2"><.radio_cards_item value="1" disabled>Off</.radio_cards_item><.radio_cards_item value="2" disabled>On</.radio_cards_item></.radio_cards_root></.flex>|}>
      <.flex direction="column" gap="4" max_width="450px">
        <.radio_cards_root id="radio-cards-disabled-on" columns="2" default_value="2">
          <.radio_cards_item value="1">Off</.radio_cards_item>
          <.radio_cards_item value="2">On</.radio_cards_item>
        </.radio_cards_root>
        <.radio_cards_root id="radio-cards-disabled-all" columns="2" default_value="2">
          <.radio_cards_item value="1" disabled>Off</.radio_cards_item>
          <.radio_cards_item value="2" disabled>On</.radio_cards_item>
        </.radio_cards_root>
      </.flex>
  </:heex>
</.demo>
