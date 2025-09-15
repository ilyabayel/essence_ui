defmodule EssenceUI.Components.Progress do
  @moduledoc """
  A Progress component that displays the completion progress of a task.

  Based on Radix UI Progress component with support for various sizes,
  colors, and styling options.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require ColorProps
  require MarginProps
  require RadiusProps

  @variants ["classic", "surface", "soft"]
  @sizes ["1", "2", "3"]
  @radiuses ["none", "small", "medium", "large", "full"]

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
  attr :value, :integer, required: true, doc: "Current progress value"
  attr :max, :integer, default: 100, doc: "Maximum progress value"
  attr :variant, :string, values: @variants, default: "surface", doc: "Progress variant"
  attr :size, :string, values: @sizes, default: "2", doc: "Progress size"
  attr :radius, :string, values: @radiuses, default: "full", doc: "Border radius"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global

  def progress(assigns) do
    prop_defs =
      %{
        variant: %{type: :enum, values: @variants, class: "rt-variant", default: "surface"},
        size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "2"},
        radius: %{type: :enum, values: @radiuses, class: "rt-r-rd", default: "full"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-reset", "rt-ProgressRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    # Calculate percentage and ensure it's within bounds
    percentage =
      case {assigns.value, assigns.max} do
        {value, max} when is_number(value) and is_number(max) and max > 0 ->
          min(100, max(0, value / max * 100))

        _ ->
          0
      end

    assigns =
      assigns
      |> assign(class: class, style: extracted.style)
      |> assign(color: assigns[:color] || false)
      |> assign(percentage: percentage)

    ~H"""
    <div
      class={@class}
      style={
        ["--progress-value: #{@value};", "--progress-max: #{@max};", @style]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      role="progressbar"
      aria-valuemin="0"
      aria-valuemax={@max}
      aria-valuenow={@value}
      data-state={if @value == @max, do: "complete", else: "loading"}
      data-value={@value}
      data-max={@max}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      <div class="rt-ProgressIndicator"></div>
    </div>
    """
  end
end
