defmodule EssenceUI.Components.Heading do
  @moduledoc """
  Heading component 100% compatible with Radix UI Themes Heading API.
  See: https://www.radix-ui.com/themes/docs/components/heading
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.LeadingTrimProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.TextAlignProps
  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps
  alias EssenceUI.SharedProps.WeightProps

  require ColorProps
  require HighContrastProps
  require LeadingTrimProps
  require MarginProps
  require TextAlignProps
  require TextWrapProps
  require TruncateProps
  require WeightProps

  @heading_tags ["h1", "h2", "h3", "h4", "h5", "h6"]
  @size_values Enum.map(1..9, &Integer.to_string/1)

  @doc """
  Renders a heading. All props match Radix UI Heading.
  """
  attr :as, :string, default: "h1", values: @heading_tags, doc: "The element to render. h1-h6."
  attr :size, :string, values: @size_values, doc: "Heading size (1-9). Responsive supported."
  WeightProps.attrs()
  TextAlignProps.attrs()
  LeadingTrimProps.attrs()
  TruncateProps.attrs()
  TextWrapProps.attrs()
  ColorProps.attrs()
  MarginProps.attrs()
  HighContrastProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes."
  slot :inner_block, required: true

  def heading(assigns) do
    prop_defs =
      %{
        as: %{type: :enum, values: @heading_tags, default: "h1"},
        size: %{type: :enum, values: @size_values, class: "rt-r-size", responsive: true}
      }
      |> Map.merge(WeightProps.prop_defs())
      |> Map.merge(TextAlignProps.prop_defs())
      |> Map.merge(LeadingTrimProps.prop_defs())
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      ["rt-Heading", extracted.class, assigns[:class], assigns[:high_contrast] && "rt-HighContrast"]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style = [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; ")
    color = assigns[:color] || ""

    assigns = assign(assigns, class: class, style: style, color: color)

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} data-accent-color={@color} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
