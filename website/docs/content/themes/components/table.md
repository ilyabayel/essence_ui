---
title: Table
description: Semantic table element for presenting data.
---

<.demo>
  <:heex code={~S|<.table><.table_header><.table_row><.table_column_header_cell>Full name</.table_column_header_cell><.table_column_header_cell>Email</.table_column_header_cell><.table_column_header_cell>Group</.table_column_header_cell></.table_row></.table_header><.table_body><.table_row><.table_row_header_cell>Danilo Sousa</.table_row_header_cell><.table_cell>danilo@example.com</.table_cell><.table_cell>Developer</.table_cell></.table_row><.table_row><.table_row_header_cell>Zahra Ambessa</.table_row_header_cell><.table_cell>zahra@example.com</.table_cell><.table_cell>Admin</.table_cell></.table_row><.table_row><.table_row_header_cell>Jasper Eriksson</.table_row_header_cell><.table_cell>jasper@example.com</.table_cell><.table_cell>Developer</.table_cell></.table_row></.table_body></.table>|}>
      <.table>
        <.table_header>
          <.table_row>
            <.table_column_header_cell>Full name</.table_column_header_cell>
            <.table_column_header_cell>Email</.table_column_header_cell>
            <.table_column_header_cell>Group</.table_column_header_cell>
          </.table_row>
        </.table_header>
        <.table_body>
          <.table_row>
            <.table_row_header_cell>Danilo Sousa</.table_row_header_cell>
            <.table_cell>danilo@example.com</.table_cell>
            <.table_cell>Developer</.table_cell>
          </.table_row>
          <.table_row>
            <.table_row_header_cell>Zahra Ambessa</.table_row_header_cell>
            <.table_cell>zahra@example.com</.table_cell>
            <.table_cell>Admin</.table_cell>
          </.table_row>
          <.table_row>
            <.table_row_header_cell>Jasper Eriksson</.table_row_header_cell>
            <.table_cell>jasper@example.com</.table_cell>
            <.table_cell>Developer</.table_cell>
          </.table_row>
        </.table_body>
      </.table>
  </:heex>
</.demo>

## API Reference

Groups header and body parts in a semantic table. Supports common margin props on the root.

### Root

Groups the `table_header` and `table_body` parts.

<.props_table module={EssenceUI.Components.Table} function={:table} />

### Header

Contains the column headings for the table.

<.props_table module={EssenceUI.Components.Table} function={:table_header} />

### Body

Displays the table data.

<.props_table module={EssenceUI.Components.Table} function={:table_body} />

### Row

A row of table cells.

<.props_table module={EssenceUI.Components.Table} function={:table_row} />

### Cell

A basic table cell.

<.props_table module={EssenceUI.Components.Table} function={:table_cell} />

### ColumnHeaderCell

The header of a table column.

<.props_table module={EssenceUI.Components.Table} function={:table_column_header_cell} />

### RowHeaderCell

The header of a table row.

<.props_table module={EssenceUI.Components.Table} function={:table_row_header_cell} />

## Examples

### Size

Use the `size` prop to control how large the text and padding of the table cells should be.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="5" max_width="350px"><.table size="1"><.table_header><.table_row><.table_column_header_cell>Full name</.table_column_header_cell><.table_column_header_cell>Email</.table_column_header_cell></.table_row></.table_header><.table_body><.table_row><.table_row_header_cell>Danilo Sousa</.table_row_header_cell><.table_cell>danilo@example.com</.table_cell></.table_row><.table_row><.table_row_header_cell>Zahra Ambessa</.table_row_header_cell><.table_cell>zahra@example.com</.table_cell></.table_row></.table_body></.table><.table size="2"><.table_header><.table_row><.table_column_header_cell>Full name</.table_column_header_cell><.table_column_header_cell>Email</.table_column_header_cell></.table_row></.table_header><.table_body><.table_row><.table_row_header_cell>Danilo Sousa</.table_row_header_cell><.table_cell>danilo@example.com</.table_cell></.table_row><.table_row><.table_row_header_cell>Zahra Ambessa</.table_row_header_cell><.table_cell>zahra@example.com</.table_cell></.table_row></.table_body></.table><.table size="3"><.table_header><.table_row><.table_column_header_cell>Full name</.table_column_header_cell><.table_column_header_cell>Email</.table_column_header_cell></.table_row></.table_header><.table_body><.table_row><.table_row_header_cell>Danilo Sousa</.table_row_header_cell><.table_cell>danilo@example.com</.table_cell></.table_row><.table_row><.table_row_header_cell>Zahra Ambessa</.table_row_header_cell><.table_cell>zahra@example.com</.table_cell></.table_row></.table_body></.table></.flex>|}>
      <.flex direction="column" gap="5" max_width="350px">
        <.table size="1">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Full name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>Danilo Sousa</.table_row_header_cell>
              <.table_cell>danilo@example.com</.table_cell>
            </.table_row>
            <.table_row>
              <.table_row_header_cell>Zahra Ambessa</.table_row_header_cell>
              <.table_cell>zahra@example.com</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        <.table size="2">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Full name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>Danilo Sousa</.table_row_header_cell>
              <.table_cell>danilo@example.com</.table_cell>
            </.table_row>
            <.table_row>
              <.table_row_header_cell>Zahra Ambessa</.table_row_header_cell>
              <.table_cell>zahra@example.com</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        <.table size="3">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Full name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>Danilo Sousa</.table_row_header_cell>
              <.table_cell>danilo@example.com</.table_cell>
            </.table_row>
            <.table_row>
              <.table_row_header_cell>Zahra Ambessa</.table_row_header_cell>
              <.table_cell>zahra@example.com</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
      </.flex>
  </:heex>
</.demo>

### With a backplate

Use `variant="surface"` to add a visually enclosed backplate to the table.

<.demo>
  <:heex code={~S|<.table variant="surface"><.table_header><.table_row><.table_column_header_cell>Full name</.table_column_header_cell><.table_column_header_cell>Email</.table_column_header_cell><.table_column_header_cell>Group</.table_column_header_cell></.table_row></.table_header><.table_body><.table_row><.table_row_header_cell>Danilo Sousa</.table_row_header_cell><.table_cell>danilo@example.com</.table_cell><.table_cell>Developer</.table_cell></.table_row><.table_row><.table_row_header_cell>Zahra Ambessa</.table_row_header_cell><.table_cell>zahra@example.com</.table_cell><.table_cell>Admin</.table_cell></.table_row><.table_row><.table_row_header_cell>Jasper Eriksson</.table_row_header_cell><.table_cell>jasper@example.com</.table_cell><.table_cell>Developer</.table_cell></.table_row></.table_body></.table>|}>
      <.table variant="surface">
        <.table_header>
          <.table_row>
            <.table_column_header_cell>Full name</.table_column_header_cell>
            <.table_column_header_cell>Email</.table_column_header_cell>
            <.table_column_header_cell>Group</.table_column_header_cell>
          </.table_row>
        </.table_header>
        <.table_body>
          <.table_row>
            <.table_row_header_cell>Danilo Sousa</.table_row_header_cell>
            <.table_cell>danilo@example.com</.table_cell>
            <.table_cell>Developer</.table_cell>
          </.table_row>
          <.table_row>
            <.table_row_header_cell>Zahra Ambessa</.table_row_header_cell>
            <.table_cell>zahra@example.com</.table_cell>
            <.table_cell>Admin</.table_cell>
          </.table_row>
          <.table_row>
            <.table_row_header_cell>Jasper Eriksson</.table_row_header_cell>
            <.table_cell>jasper@example.com</.table_cell>
            <.table_cell>Developer</.table_cell>
          </.table_row>
        </.table_body>
      </.table>
  </:heex>
</.demo>
