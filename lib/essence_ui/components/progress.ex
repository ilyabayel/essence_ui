defmodule EssenceUI.Components.Progress do
  @moduledoc """
  A Progress component that displays the completion progress of a task.

  Based on EssenceUI.Primitives.Progress / Radix UI Themes Progress.
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
  @radiuses ["none", "small", "medium", "large", "full"]

  @doc """
  Renders a progress component.

  ## Examples

      <.progress value={50} />
      <.progress value={75} size="2" color="green" />
      <.progress value={25} variant="soft" radius="full" max={100} />
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

    class = ["rt-ProgressRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    style =
      [
        "--progress-value: #{assigns.value};",
        "--progress-max: #{assigns.max};",
        extracted.style,
        assigns[:style]
      ]
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
      <.indicator value={@value} max={@max} class="rt-ProgressIndicator" />
    </.root>
    """
  end
end
