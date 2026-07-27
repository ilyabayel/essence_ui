---
title: Grid
description: Component for creating grid layouts.
---

<.demo>
  <:heex code={~S|<.grid columns="3" gap="3" width="100%"><.decoration_box height="64px" /><.decoration_box height="64px" /><.decoration_box height="64px" /><.decoration_box height="64px" /><.decoration_box height="64px" /><.decoration_box height="64px" /></.grid>|}>
      <.grid columns="3" gap="3" width="100%">
        <.decoration_box height="64px" />
        <.decoration_box height="64px" />
        <.decoration_box height="64px" />
        <.decoration_box height="64px" />
        <.decoration_box height="64px" />
        <.decoration_box height="64px" />
      </.grid>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

Use these props to create grid layouts.

<.props_table module={EssenceUI.Components.Grid} function={:grid} />

Layout sizing, padding, position, overflow, and related props are shared with [Box](/themes/docs/components/box), [Flex](/themes/docs/components/flex), [Container](/themes/docs/components/container), and [Section](/themes/docs/components/section).

## Examples

### Responsive

Props marked responsive (such as `columns` and `rows`) accept a breakpoint map. For example, the following grid starts with 1 column and uses 2 columns from the medium breakpoint.

<.demo>
  <:heex code={~S|<.grid columns={%{initial: "1", md: "2"}} gap="3" width="auto"><.box height="64px"><.decoration_box height="64px" /></.box><.box height="64px"><.decoration_box height="64px" /></.box></.grid>|}>
      <.grid columns={%{initial: "1", md: "2"}} gap="3" width="auto">
        <.box height="64px"><.decoration_box height="64px" /></.box>
        <.box height="64px"><.decoration_box height="64px" /></.box>
      </.grid>
  </:heex>
</.demo>
