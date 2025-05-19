defmodule EssenceUI.Components.Box do
  @moduledoc """
  The Box component is a low-level layout primitive for building UI structure.

  Based on Radix UI Themes Box component.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require LayoutProps
  require MarginProps
  require PaddingProps
  require WidthProps

  @display_values [
    "none",
    "inline",
    "inline-block",
    "block",
    "contents"
  ]

  @doc """
  Renders a box component.

  ## Examples

      <.box>Content inside a box</.box>
      <.box as="section" p="4" m="2" width="full" height="32">Section box</.box>

  ## Props

    * `as` - The element to render. Defaults to "div". Accepts: "div", "span".
    * `display` - CSS display property. Accepts: none, inline, inline-block, block, contents. Responsive supported.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
    * `p`, `pt`, `pr`, `pb`, `pl`, `px`, `py` - Padding utilities (see theme scale). Responsive supported.
    * `m`, `mt`, `mr`, `mb`, `ml`, `mx`, `my` - Margin utilities (see theme scale). Responsive supported.
    * `width`, `min_width`, `max_width` - Width utilities. Responsive supported.
    * `height`, `min_height`, `max_height` - Height utilities. Responsive supported.
    * `position` - CSS position property. Accepts: static, relative, absolute, fixed, sticky. Responsive supported.
    * `inset`, `top`, `right`, `bottom`, `left` - Edge/inset utilities (see theme scale). Responsive supported.
    * `overflow`, `overflow_x`, `overflow_y` - CSS overflow properties. Responsive supported.
    * `flex_basis`, `flex_shrink`, `flex_grow` - Flexbox layout utilities. Responsive supported.
    * `grid_area`, `grid_column`, `grid_column_start`, `grid_column_end`, `grid_row`, `grid_row_start`, `grid_row_end` - Grid layout utilities. Responsive supported.

  """
  LayoutProps.layout_attrs()
  MarginProps.margin_attrs()
  attr :as, :string, default: "div", values: ["div", "span"]
  attr :class, :string, default: "", doc: "Additional CSS classes to add to the element."
  attr :display, :string, default: "block", values: @display_values
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def box(assigns) do
    box_prop_defs = %{
      display: %{
        type: :enum,
        values: @display_values,
        class: "rt-r-display",
        responsive: true,
        default: "block"
      }
    }

    props_defs =
      box_prop_defs
      |> Map.merge(LayoutProps.layout_prop_defs())
      |> Map.merge(MarginProps.margin_prop_defs())

    extracted_props = ExtractProps.call(assigns, props_defs)

    class = Enum.join(["rt-Box", extracted_props[:class]], " ")
    assigns = assign(assigns, class: class, style: extracted_props[:style])

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
