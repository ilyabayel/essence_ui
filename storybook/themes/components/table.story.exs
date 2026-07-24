defmodule Storybook.Themes.Components.Table do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Table

  def function, do: &Table.table/1

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def imports,
    do: [
      {Table,
       table_header: 1, table_body: 1, table_row: 1, table_column_header_cell: 1, table_row_header_cell: 1, table_cell: 1}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default table with size 2 and surface variant",
        template: """
        <.table>
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
              <.table_column_header_cell>Role</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>John Doe</.table_row_header_cell>
              <.table_cell>john@example.com</.table_cell>
              <.table_cell>Admin</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Jane Smith</.table_row_header_cell>
              <.table_cell>jane@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Bob Johnson</.table_row_header_cell>
              <.table_cell>bob@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        """
      },
      %Variation{
        id: :size_1,
        description: "Table with size 1 (smallest)",
        template: """
        <.table size="1">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
              <.table_column_header_cell>Role</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>John Doe</.table_row_header_cell>
              <.table_cell>john@example.com</.table_cell>
              <.table_cell>Admin</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Jane Smith</.table_row_header_cell>
              <.table_cell>jane@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Bob Johnson</.table_row_header_cell>
              <.table_cell>bob@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        """
      },
      %Variation{
        id: :size_3,
        description: "Table with size 3 (largest)",
        template: """
        <.table size="3">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
              <.table_column_header_cell>Role</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>John Doe</.table_row_header_cell>
              <.table_cell>john@example.com</.table_cell>
              <.table_cell>Admin</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Jane Smith</.table_row_header_cell>
              <.table_cell>jane@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Bob Johnson</.table_row_header_cell>
              <.table_cell>bob@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        """
      },
      %Variation{
        id: :ghost_variant,
        description: "Table with ghost variant (no background)",
        template: """
        <.table variant="ghost">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Name</.table_column_header_cell>
              <.table_column_header_cell>Email</.table_column_header_cell>
              <.table_column_header_cell>Role</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row>
              <.table_row_header_cell>John Doe</.table_row_header_cell>
              <.table_cell>john@example.com</.table_cell>
              <.table_cell>Admin</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Jane Smith</.table_row_header_cell>
              <.table_cell>jane@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>

            <.table_row>
              <.table_row_header_cell>Bob Johnson</.table_row_header_cell>
              <.table_cell>bob@example.com</.table_cell>
              <.table_cell>User</.table_cell>
            </.table_row>
          </.table_body>
        </.table>
        """
      }
    ]
  end
end
