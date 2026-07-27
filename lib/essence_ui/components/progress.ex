defmodule EssenceUI.Components.Progress do
  @moduledoc """
  A Progress component that displays the completion progress of a task.

  Supports various sizes, colors, and styling options.
  Wraps `EssenceUI.Primitives.Progress`.
  """
  use Phoenix.Component

  import EssenceUI.Primitives.Progress, only: [root: 1, indicator: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require ColorProps
  require MarginProps
  require RadiusProps

  @variants ["classic", "surface", "soft"]
  @sizes ["1", "2", "3"]

  @doc """
  Renders a progress component.

  ## Examples

      <.progress value={50} />
      <.progress value={75} size="2" color="green" />
      <.progress value={25} variant="soft" radius="full" max={100} />

  ## Props

  - `value` - Current progress value (required)
  - `max` - Maximum progress value (default: 100)
  - `variant` - Progress variant: "classic", "surface", "soft" (default: "surface")
  - `size` - Progress size: "1", "2", "3" (default: "2")
  - `color` - Color theme (default: accent color)
  - `radius` - Border radius: "none", "small", "medium", "large", "full" (default: "full")
  - Plus margin props (m, mx, my, mt, mr, mb, ml)
  """

  ColorProps.attrs()
  MarginProps.attrs()
  RadiusProps.attrs()
  attr :value, :integer, required: true, doc: "Current progress value"
  attr :max, :integer, default: 100, doc: "Maximum progress value"
  attr :variant, :string, values: @variants, default: "surface", doc: "Progress variant"
  attr :size, :string, values: @sizes, default: "2", doc: "Progress size"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global

  def progress(assigns) do
    assigns = assign_new(assigns, :radius, fn -> "full" end)

    prop_defs =
      %{
        variant: %{type: :enum, values: @variants, class: "est-variant", default: "surface"},
        size: %{type: :enum, values: @sizes, class: "est-r-size", default: "2"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["est-reset", "est-ProgressRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    style =
      ["--progress-value: #{assigns.value};", "--progress-max: #{assigns.max};", extracted.style]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assigns
      |> assign(class: class, style: style)
      |> assign(color: assigns[:color] || false)

    ~H"""
    <.root
      value={@value}
      max={@max}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      <.indicator value={@value} max={@max} class="est-ProgressIndicator" />
    </.root>
    """
  end
end
