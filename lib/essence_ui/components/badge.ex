defmodule EssenceUI.Components.Badge do
  @moduledoc """
  A Badge component that displays a small piece of information or status.

  Based on Radix UI Badge component with support for various sizes, variants,
  colors, and styling options.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require MarginProps
  require RadiusProps

  @variants ["solid", "soft", "surface", "outline"]
  @sizes ["1", "2", "3"]
  @radiuses ["none", "small", "medium", "large", "full"]

  @doc """
  Renders a badge component.

  ## Examples

      <Badge.badge>New</Badge.badge>
      <Badge.badge size="2" variant="solid" color="blue">Updated</Badge.badge>
      <Badge.badge variant="outline" high_contrast>Important</Badge.badge>

  ## Props

  - `size` - Badge size: "1", "2", "3" (default: "1")
  - `variant` - Badge variant: "solid", "soft", "surface", "outline" (default: "soft")
  - `color` - Color theme (default: accent color)
  - `high_contrast` - Enable high contrast mode (default: false)
  - `radius` - Border radius: "none", "small", "medium", "large", "full" (default: follows theme)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) and as_child functionality
  """

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  AsChildProps.attrs()
  attr :size, :string, values: @sizes, default: "1", doc: "Badge size"
  attr :variant, :string, values: @variants, default: "soft", doc: "Badge variant"
  attr :radius, :string, default: nil, doc: "Border radius"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global

  slot :inner_block, required: true

  def badge(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "1"},
        variant: %{type: :enum, values: @variants, class: "rt-variant", default: "soft"},
        radius: %{type: :enum, values: @radiuses, class: "rt-r-rd", default: nil}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-reset", "rt-Badge", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns =
      assigns
      |> assign(class: class, style: extracted.style)
      |> assign(color: assigns[:color] || false)
      |> assign(radius: assigns[:radius] || false)
      |> assign(high_contrast: assigns[:high_contrast] || false)

    ~H"""
    <span class={@class} style={@style} data-accent-color={@color} data-radius={@radius} {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end
end
