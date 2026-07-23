defmodule EssenceUI.Components.Slider do
  @moduledoc """
  A Slider component for selecting values from a range.

  Based on EssenceUI.Primitives.Slider / Radix UI Themes Slider.
  """

  use Phoenix.Component

  import EssenceUI.Primitives.Slider, only: [root: 1, track: 1, range: 1, thumb: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require ColorProps
  require HighContrastProps
  require MarginProps
  require RadiusProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]
  @orientations ["horizontal", "vertical"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  RadiusProps.attrs()

  attr :id, :string, default: nil

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Slider size from 1 to 3. Controls overall dimensions and thumb size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :orientation, :string,
    values: @orientations,
    default: "horizontal",
    doc: "Slider orientation. One of 'horizontal' or 'vertical'."

  attr :value, :list,
    default: nil,
    doc: "Controlled value array. Can be [value] for single or [min, max] for range."

  attr :default_value, :list,
    default: [50],
    doc: "Initial value array. Can be [value] for single or [min, max] for range."

  attr :min, :integer, default: 0, doc: "Minimum value."
  attr :max, :integer, default: 100, doc: "Maximum value."
  attr :step, :integer, default: 1, doc: "Step increment."
  attr :disabled, :boolean, default: false, doc: "Whether the slider is disabled."
  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(form aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  def slider(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          class: "rt-r-size",
          values: @sizes,
          default: "2",
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "rt-variant",
          values: @variants,
          default: "surface"
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id =
      assigns[:id] ||
        "slider-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    current_values = assigns[:value] || assigns[:default_value] || [50]

    class =
      ["rt-reset", "rt-SliderRoot", extracted.class]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    range_class =
      ["rt-SliderRange", if(assigns[:high_contrast], do: "rt-high-contrast")]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        radius: assigns[:radius] || false,
        current_values: current_values,
        range_class: range_class
      )

    ~H"""
    <.root
      id={@id}
      value={@value}
      default_value={@default_value}
      min={@min}
      max={@max}
      step={@step}
      orientation={@orientation}
      disabled={@disabled}
      name={@name}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      <.track class="rt-SliderTrack" data-orientation={@orientation}>
        <.range class={@range_class} data-orientation={@orientation} />
      </.track>
      <.thumb
        :for={{_value, index} <- Enum.with_index(@current_values)}
        index={index}
        class="rt-SliderThumb"
        style="position: absolute;"
      />
    </.root>
    """
  end
end
