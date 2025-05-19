defmodule EssenceUI.Components.Flex do
  @moduledoc """
  The Flex component is a low-level layout primitive for flexbox layouts.

  Based on Radix UI Themes Flex component.
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
  @display_values ["none", "inline-flex", "flex"]
  @direction_values ["row", "column", "row-reverse", "column-reverse"]
  @align_values ["start", "center", "end", "baseline", "stretch"]
  @justify_values ["start", "center", "end", "between"]
  @wrap_values ["nowrap", "wrap", "wrap-reverse"]

  LayoutProps.layout_attrs()
  MarginProps.margin_attrs()
  AsChildProps.as_child_attrs()
  GapProps.gap_attrs()

  attr :as, :string, default: "div", values: @as_values
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :display, :string, default: "flex", values: @display_values
  attr :direction, :string, values: @direction_values, doc: "Flex direction."
  attr :align, :string, values: @align_values, doc: "Align items."
  attr :justify, :string, values: @justify_values, doc: "Justify content."
  attr :wrap, :string, values: @wrap_values, doc: "Flex wrap."
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  @doc """
  Renders a flex container.

  ## Examples

      <.flex direction="row" gap="2"><div>Item 1</div><div>Item 2</div></.flex>
      <.flex as="span" align="center" justify="between" wrap="wrap">...</.flex>

  ## Props

    * `as` - The element to render. Defaults to "div". Accepts: "div", "span".
    * `display` - CSS display property. Accepts: none, inline-flex, flex. Responsive supported.
    * `direction` - Flex direction. Accepts: row, column, row-reverse, column-reverse. Responsive supported.
    * `align` - Align items. Accepts: start, center, end, baseline, stretch. Responsive supported.
    * `justify` - Justify content. Accepts: start, center, end, between. Responsive supported.
    * `wrap` - Flex wrap. Accepts: nowrap, wrap, wrap-reverse. Responsive supported.
    * `gap`, `gap_x`, `gap_y` - Gap utilities for flex/grid layouts. Responsive supported.
    * `p`, `pt`, `pr`, `pb`, `pl`, `px`, `py` - Padding utilities (see theme scale). Responsive supported.
    * `m`, `mt`, `mr`, `mb`, `ml`, `mx`, `my` - Margin utilities (see theme scale). Responsive supported.
    * `width`, `min_width`, `max_width` - Width utilities. Responsive supported.
    * `height`, `min_height`, `max_height` - Height utilities. Responsive supported.
    * `flex_basis`, `flex_shrink`, `flex_grow` - Flexbox layout utilities. Responsive supported.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
    * `inner_block` - Slot for flex children.

  """
  def flex(assigns) do
    flex_prop_defs = %{
      display: %{type: :enum, values: @display_values, class: "rt-r-display", responsive: true},
      direction: %{type: :enum, values: @direction_values, class: "rt-r-fd", responsive: true},
      align: %{type: :enum, values: @align_values, class: "rt-r-ai", responsive: true},
      justify: %{type: :enum, values: @justify_values, class: "rt-r-jc", responsive: true},
      wrap: %{type: :enum, values: @wrap_values, class: "rt-r-fw", responsive: true}
    }

    prop_defs =
      flex_prop_defs
      |> Map.merge(LayoutProps.layout_prop_defs())
      |> Map.merge(MarginProps.margin_prop_defs())
      |> Map.merge(AsChildProps.as_child_prop_defs())
      |> Map.merge(GapProps.gap_prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-Flex", extracted[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
    assigns = assign(assigns, class: class, style: extracted[:style])

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
