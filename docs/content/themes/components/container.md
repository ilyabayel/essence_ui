---
title: Container
description: Constrains the maximum width of page content.
---

<.demo>
  <:heex code={~S|<.box width="100%" style="background: var(--gray-a2); border-radius: var(--radius-3);"><.container size="1"><.decoration_box height="96px" /></.container></.box>|}>
      <.box width="100%" style="background: var(--gray-a2); border-radius: var(--radius-3);">
        <.container size="1">
          <.decoration_box height="96px" />
        </.container>
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

<.props_table module={EssenceUI.Components.Container} function={:container} />

Container sizes use the following `max-width` values, which may be customized if needed.

<.table variant="surface" size="1" my="5">
  <.table_header>
    <.table_row>
      <.table_column_header_cell>Size</.table_column_header_cell>
      <.table_column_header_cell>CSS variable</.table_column_header_cell>
      <.table_column_header_cell>Width</.table_column_header_cell>
    </.table_row>
  </.table_header>
  <.table_body>
    <.table_row>
      <.table_row_header_cell><.code size="1">size="1"</.code></.table_row_header_cell>
      <.table_cell><.code size="1" color="gray">--container-1</.code></.table_cell>
      <.table_cell><.code size="1" color="gray">448px</.code></.table_cell>
    </.table_row>
    <.table_row>
      <.table_row_header_cell><.code size="1">size="2"</.code></.table_row_header_cell>
      <.table_cell><.code size="1" color="gray">--container-2</.code></.table_cell>
      <.table_cell><.code size="1" color="gray">688px</.code></.table_cell>
    </.table_row>
    <.table_row>
      <.table_row_header_cell><.code size="1">size="3"</.code></.table_row_header_cell>
      <.table_cell><.code size="1" color="gray">--container-3</.code></.table_cell>
      <.table_cell><.code size="1" color="gray">880px</.code></.table_cell>
    </.table_row>
    <.table_row>
      <.table_row_header_cell><.code size="1">size="4"</.code></.table_row_header_cell>
      <.table_cell><.code size="1" color="gray">--container-4</.code></.table_cell>
      <.table_cell><.code size="1" color="gray">1136px</.code></.table_cell>
    </.table_row>
  </.table_body>
</.table>

Width and height utilities are also available. Related layout primitives: [Box](/themes/docs/components/box), [Flex](/themes/docs/components/flex), [Grid](/themes/docs/components/grid), [Section](/themes/docs/components/section).
