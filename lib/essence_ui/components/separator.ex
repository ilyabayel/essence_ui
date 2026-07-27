defmodule EssenceUI.Components.Separator do
  @moduledoc """
  A Separator component that renders a visual divider between content sections.

  Supports various orientations, colors, and styling options.
  Wraps `EssenceUI.Primitives.Separator`.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Separator, as: SeparatorPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require MarginProps

  @orientations ["horizontal", "vertical"]
  @sizes ["1", "2", "3", "4"]

  @doc """
  Renders a separator component.

  ## Examples

      <.separator />
      <.separator orientation="vertical" size="2" color="red" />
      <.separator orientation="horizontal" my="4" />

  ## Props

  - `orientation` - Separator orientation: "horizontal", "vertical" (default: "horizontal")
  - `size` - Separator size: "1", "2", "3", "4" (default: "1")
  - `decorative` - When true, omits separator role (default: false)
  - `color` - Color theme (default: accent color)
  - Plus margin props (m, mx, my, mt, mr, mb, ml)
  """

  ColorProps.attrs()
  MarginProps.attrs()
  attr :orientation, :string, values: @orientations, default: "horizontal", doc: "Separator orientation"
  attr :size, :string, values: @sizes, default: "1", doc: "Separator size"
  attr :decorative, :boolean, default: false, doc: "Whether the separator is purely decorative"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global

  def separator(assigns) do
    prop_defs =
      %{
        orientation: %{type: :enum, values: @orientations, class: "rt-r-orientation", default: "horizontal"},
        size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "1"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-reset", "rt-Separator", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns =
      assigns
      |> assign(class: class, style: extracted.style)
      |> assign(color: assigns[:color] || false)

    ~H"""
    <SeparatorPrimitive.separator
      orientation={@orientation}
      decorative={@decorative}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    />
    """
  end
end
