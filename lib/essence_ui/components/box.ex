defmodule EssenceUI.Components.Box do
  @moduledoc """
  The Box component is a low-level layout primitive for building UI structure.

  Based on Radix UI Themes Box component.
  """
  use Phoenix.Component

  import EssenceUI.SharedProps.HeightProps
  import EssenceUI.SharedProps.MarginProps
  import EssenceUI.SharedProps.PaddingProps
  import EssenceUI.SharedProps.WidthProps

  alias EssenceUI.Helpers.ExtractProps

  @display_values [
    "block",
    "inline-block",
    "inline",
    "flex",
    "inline-flex",
    "grid",
    "inline-grid",
    "none"
  ]

  @box_prop_defs %{
    as: %{type: :string, default: "div"},
    display: %{
      type: :enum,
      values: @display_values,
      class: "rt-r-display"
    }
  }

  @doc """
  Renders a box component.

  ## Examples

      <.box>Content inside a box</.box>
      <.box as="section" p="4" m="2" width="full" height="32">Section box</.box>

  ## Props

    * `as` - The element to render. Defaults to "div".
    * `p` - Padding utility class (e.g., "1", "2", ... "9").
    * `pt`, `pr`, `pb`, `pl`, `px`, `py` - Padding for each side/axis.
    * `m` - Margin utility class.
    * `mt`, `mr`, `mb`, `ml`, `mx`, `my` - Margin for each side/axis.
    * `width` - Width utility class (e.g., "full", "auto", "screen").
    * `height` - Height utility class (e.g., "full", "auto", "screen").
    * `class` - Additional CSS classes.
    * `rest` - Additional HTML attributes.
  """
  padding_attrs()
  margin_attrs()
  height_attrs()
  width_attrs()
  attr :as, :string
  attr :class, :string
  attr :display, :string, default: "block", values: @display_values
  attr :rest, :global
  slot :inner_block, required: true

  def box(assigns) do
    props_defs =
      @box_prop_defs
      |> Map.merge(padding_prop_defs())
      |> Map.merge(margin_prop_defs())
      |> Map.merge(height_prop_defs())
      |> Map.merge(width_prop_defs())

    extracted_props = ExtractProps.call(assigns, props_defs)

    class = ["rt-Box", assigns[:class], Enum.join(extracted_props[:classes], " ")] |> Enum.filter(& &1) |> Enum.join(" ")
    style = extracted_props[:custom_properties] |> Enum.join(" ") |> String.trim()
    assigns = assign(assigns, class: class, style: style, tag_name: extracted_props)

    ~H"""
    <.dynamic_tag tag_name={@tag_name} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
