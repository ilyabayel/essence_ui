defmodule EssenceUI.Components.Grid do
  @moduledoc """
  The Grid component is a low-level layout primitive for building grid layouts.

  Based on Radix UI Themes Grid component.

  ## Examples

      <.grid columns="3" gap="4">
        <div>1</div>
        <div>2</div>
        <div>3</div>
      </.grid>

  ## Props

    * `as` - The element to render. Defaults to "div". Accepts: "div", "span".
    * `as_child` - Composes the component into its immediate child instead of rendering its own HTML element.
    * `display` - CSS display property. Accepts: "none", "inline-grid", "grid". Responsive supported.
    * `areas` - Grid template areas. Accepts a string or responsive map.
    * `columns` - Grid template columns. Accepts: 1-9, CSS string, or responsive map.
    * `rows` - Grid template rows. Accepts: 1-9, CSS string, or responsive map.
    * `flow` - Grid auto flow. Accepts: "row", "column", "dense", "row-dense", "column-dense". Responsive supported.
    * `align` - Align items. Accepts: "start", "center", "end", "baseline", "stretch". Responsive supported.
    * `justify` - Justify content. Accepts: "start", "center", "end", "between". Responsive supported.
    * `gap`, `gap_x`, `gap_y` - Gap utilities for grid layouts. Responsive supported.
    * `p`, `pt`, `pr`, `pb`, `pl`, `px`, `py` - Padding utilities (theme scale). Responsive supported.
    * `m`, `mt`, `mr`, `mb`, `ml`, `mx`, `my` - Margin utilities (theme scale). Responsive supported.
    * `width`, `min_width`, `max_width` - Width utilities. Responsive supported.
    * `height`, `min_height`, `max_height` - Height utilities. Responsive supported.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
    * `inner_block` - Slot for grid children.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.GapProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.WidthProps

  require AsChildProps
  require GapProps
  require HeightProps
  require LayoutProps
  require MarginProps
  require PaddingProps
  require WidthProps

  @as_values ["div", "span"]
  @display_values ["none", "inline-grid", "grid"]
  @columns_values Enum.map(1..9, &Integer.to_string/1)
  @rows_values Enum.map(1..9, &Integer.to_string/1)
  @flow_values ["row", "column", "dense", "row-dense", "column-dense"]
  @align_values ["start", "center", "end", "baseline", "stretch"]
  @justify_values ["start", "center", "end", "between"]

  LayoutProps.attrs()
  MarginProps.attrs()
  AsChildProps.attrs()
  GapProps.attrs()

  attr :as, :string, default: "div", values: @as_values
  attr :display, :string, values: @display_values, doc: "CSS display property. Responsive supported."
  attr :areas, :string, doc: "Grid template areas. String or responsive map."
  attr :columns, :any, doc: "Grid template columns. 1-9, CSS string, or responsive map."
  attr :rows, :any, doc: "Grid template rows. 1-9, CSS string, or responsive map."
  attr :flow, :string, values: @flow_values, doc: "Grid auto flow. Responsive supported."
  attr :align, :string, values: @align_values, doc: "Align items. Responsive supported."
  attr :justify, :string, values: @justify_values, doc: "Justify content. Responsive supported."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  @doc false
  def grid(assigns) do
    grid_prop_defs = %{
      display: %{type: :enum, values: @display_values, class: "rt-r-display", responsive: true},
      areas: %{type: :string, class: "rt-r-gta", custom_properties: ["--grid-template-areas"], responsive: true},
      columns: %{
        type: [:enum, :string],
        values: @columns_values,
        class: "rt-r-gtc",
        custom_properties: ["--grid-template-columns"],
        responsive: true
      },
      rows: %{
        type: [:enum, :string],
        values: @rows_values,
        class: "rt-r-gtr",
        custom_properties: ["--grid-template-rows"],
        responsive: true
      },
      flow: %{type: :enum, values: @flow_values, class: "rt-r-gaf", responsive: true},
      align: %{type: :enum, values: @align_values, class: "rt-r-ai", responsive: true},
      justify: %{type: :enum, values: @justify_values, class: "rt-r-jc", responsive: true}
    }

    prop_defs =
      grid_prop_defs
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(GapProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-Grid", extracted[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
    assigns = assign(assigns, class: class, style: extracted[:style])

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
