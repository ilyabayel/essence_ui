defmodule EssenceUI.SharedProps.LayoutProps do
  @moduledoc """
  Layout prop definitions for Box, Flex, Grid, and other layout components.
  Inspired by Radix UI Themes layout.props.ts and the provided TypeScript definition.
  """

  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.WidthProps

  @overflow_values ["visible", "hidden", "clip", "scroll", "auto"]
  @position_values ["static", "relative", "absolute", "fixed", "sticky"]
  @edge_values [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "-1",
    "-2",
    "-3",
    "-4",
    "-5",
    "-6",
    "-7",
    "-8",
    "-9"
  ]
  @flex_shrink_values ["0", "1"]
  @flex_grow_values ["0", "1"]

  def prop_defs do
    PaddingProps.prop_defs()
    |> Map.merge(WidthProps.prop_defs())
    |> Map.merge(HeightProps.prop_defs())
    |> Map.merge(%{
      position: %{type: :enum, values: @position_values, class: "rt-r-position", responsive: true},
      inset: %{
        type: [:enum, :string],
        values: @edge_values,
        class: "rt-r-inset",
        custom_properties: ["--inset"],
        responsive: true
      },
      top: %{
        type: [:enum, :string],
        values: @edge_values,
        class: "rt-r-top",
        custom_properties: ["--top"],
        responsive: true
      },
      right: %{
        type: [:enum, :string],
        values: @edge_values,
        class: "rt-r-right",
        custom_properties: ["--right"],
        responsive: true
      },
      bottom: %{
        type: [:enum, :string],
        values: @edge_values,
        class: "rt-r-bottom",
        custom_properties: ["--bottom"],
        responsive: true
      },
      left: %{
        type: [:enum, :string],
        values: @edge_values,
        class: "rt-r-left",
        custom_properties: ["--left"],
        responsive: true
      },
      overflow: %{type: :enum, values: @overflow_values, class: "rt-r-overflow", responsive: true},
      overflow_x: %{type: :enum, values: @overflow_values, class: "rt-r-ox", responsive: true},
      overflow_y: %{type: :enum, values: @overflow_values, class: "rt-r-oy", responsive: true},
      flex_basis: %{type: :string, class: "rt-r-fb", custom_properties: ["--flex-basis"], responsive: true},
      flex_shrink: %{
        type: [:enum, :string],
        values: @flex_shrink_values,
        class: "rt-r-fs",
        custom_properties: ["--flex-shrink"],
        responsive: true
      },
      flex_grow: %{
        type: [:enum, :string],
        values: @flex_grow_values,
        class: "rt-r-fg",
        custom_properties: ["--flex-grow"],
        responsive: true
      },
      grid_area: %{type: :string, class: "rt-r-ga", custom_properties: ["--grid-area"], responsive: true},
      grid_column: %{type: :string, class: "rt-r-gc", custom_properties: ["--grid-column"], responsive: true},
      grid_column_start: %{type: :string, class: "rt-r-gcs", custom_properties: ["--grid-column-start"], responsive: true},
      grid_column_end: %{type: :string, class: "rt-r-gce", custom_properties: ["--grid-column-end"], responsive: true},
      grid_row: %{type: :string, class: "rt-r-gr", custom_properties: ["--grid-row"], responsive: true},
      grid_row_start: %{type: :string, class: "rt-r-grs", custom_properties: ["--grid-row-start"], responsive: true},
      grid_row_end: %{type: :string, class: "rt-r-gre", custom_properties: ["--grid-row-end"], responsive: true}
    })
  end

  defmacro attrs do
    quote do
      EssenceUI.SharedProps.PaddingProps.attrs()
      EssenceUI.SharedProps.WidthProps.attrs()
      EssenceUI.SharedProps.HeightProps.attrs()

      attr :position, :string, values: unquote(@position_values), doc: "CSS position property. Responsive supported."

      attr :inset, :string,
        values: unquote(@edge_values),
        doc: "CSS inset property. Accepts scale values, CSS strings, responsive."

      attr :top, :string,
        values: unquote(@edge_values),
        doc: "CSS top property. Accepts scale values, CSS strings, responsive."

      attr :right, :string,
        values: unquote(@edge_values),
        doc: "CSS right property. Accepts scale values, CSS strings, responsive."

      attr :bottom, :string,
        values: unquote(@edge_values),
        doc: "CSS bottom property. Accepts scale values, CSS strings, responsive."

      attr :left, :string,
        values: unquote(@edge_values),
        doc: "CSS left property. Accepts scale values, CSS strings, responsive."

      attr :overflow, :string, values: unquote(@overflow_values), doc: "CSS overflow property. Responsive supported."
      attr :overflow_x, :string, values: unquote(@overflow_values), doc: "CSS overflow-x property. Responsive supported."
      attr :overflow_y, :string, values: unquote(@overflow_values), doc: "CSS overflow-y property. Responsive supported."
      attr :flex_basis, :string, doc: "CSS flex-basis property. Responsive supported."

      attr :flex_shrink, :string,
        values: unquote(@flex_shrink_values),
        doc: "CSS flex-shrink property. Responsive supported."

      attr :flex_grow, :string, values: unquote(@flex_grow_values), doc: "CSS flex-grow property. Responsive supported."
      attr :grid_area, :string, doc: "CSS grid-area property. Responsive supported."
      attr :grid_column, :string, doc: "CSS grid-column property. Responsive supported."
      attr :grid_column_start, :string, doc: "CSS grid-column-start property. Responsive supported."
      attr :grid_column_end, :string, doc: "CSS grid-column-end property. Responsive supported."
      attr :grid_row, :string, doc: "CSS grid-row property. Responsive supported."
      attr :grid_row_start, :string, doc: "CSS grid-row-start property. Responsive supported."
      attr :grid_row_end, :string, doc: "CSS grid-row-end property. Responsive supported."
    end
  end
end
