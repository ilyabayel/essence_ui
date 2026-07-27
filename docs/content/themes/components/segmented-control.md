---
title: Segmented Control
description: Toggle buttons for switching between different values or views.
---

Wraps the ToggleGroup primitive (`type="single"`, non-deselectable) with Themes styling — the same pattern as Radix Themes.

<.demo>
  <:heex code={~S|<.segmented_control id="segmented-control-hero" default_value="inbox"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control>|}>
      <.segmented_control id="segmented-control-hero" default_value="inbox">
        <:option value="inbox">Inbox</:option>
        <:option value="drafts">Drafts</:option>
        <:option value="sent">Sent</:option>
      </.segmented_control>
  </:heex>
</.demo>

## API Reference

This component supports common margin props.

### Root

Contains the items of the control. Prefer the convenience `segmented_control` with `<:option>` slots, or compose `segmented_control_root` / `segmented_control_item` directly.

<.props_table module={EssenceUI.Components.SegmentedControl} function={:segmented_control_root} />

### Item

Represents individual values of the control.

<.props_table module={EssenceUI.Components.SegmentedControl} function={:segmented_control_item} />

## Examples

### Size

Use the `size` prop to control the size of the control.

<.demo>
  <:heex code={~S|<.flex align="start" direction="column" gap="4"><.segmented_control id="segmented-control-size-1" default_value="inbox" size="1"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-size-2" default_value="inbox" size="2"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-size-3" default_value="inbox" size="3"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control></.flex>|}>
      <.flex align="start" direction="column" gap="4">
        <.segmented_control id="segmented-control-size-1" default_value="inbox" size="1">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-size-2" default_value="inbox" size="2">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-size-3" default_value="inbox" size="3">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the control.

<.demo>
  <:heex code={~S|<.flex align="start" direction="column" gap="4"><.segmented_control id="segmented-control-variant-surface" default_value="inbox" variant="surface"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-variant-classic" default_value="inbox" variant="classic"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control></.flex>|}>
      <.flex align="start" direction="column" gap="4">
        <.segmented_control id="segmented-control-variant-surface" default_value="inbox" variant="surface">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-variant-classic" default_value="inbox" variant="classic">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
      </.flex>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex align="start" direction="column" gap="4"><.segmented_control id="segmented-control-radius-none" default_value="inbox" radius="none"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-radius-small" default_value="inbox" radius="small"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-radius-medium" default_value="inbox" radius="medium"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-radius-large" default_value="inbox" radius="large"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control><.segmented_control id="segmented-control-radius-full" default_value="inbox" radius="full"><:option value="inbox">Inbox</:option><:option value="drafts">Drafts</:option><:option value="sent">Sent</:option></.segmented_control></.flex>|}>
      <.flex align="start" direction="column" gap="4">
        <.segmented_control id="segmented-control-radius-none" default_value="inbox" radius="none">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-radius-small" default_value="inbox" radius="small">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-radius-medium" default_value="inbox" radius="medium">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-radius-large" default_value="inbox" radius="large">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
        <.segmented_control id="segmented-control-radius-full" default_value="inbox" radius="full">
          <:option value="inbox">Inbox</:option>
          <:option value="drafts">Drafts</:option>
          <:option value="sent">Sent</:option>
        </.segmented_control>
      </.flex>
  </:heex>
</.demo>
