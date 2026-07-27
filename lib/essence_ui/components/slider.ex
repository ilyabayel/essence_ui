defmodule EssenceUI.Components.Slider do
  @moduledoc """
  A Slider component for selecting values from a range.

  Supports various sizes, variants, colors, and both single and range sliders.
  Wraps `EssenceUI.Primitives.Slider`.

  ## Examples

      <.slider default_value={[50]} />

      <.slider default_value={[25, 75]} />

      <.slider size="3" variant="soft" color="blue" />

      <.slider disabled />

      <.slider orientation="vertical" />

  ## Props

  - `size` - Slider size: "1", "2", "3" (default: "2")
  - `variant` - Slider variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `radius` - Border radius: "none", "small", "medium", "large", "full" (default: none)
  - `orientation` - Slider orientation: "horizontal", "vertical" (default: "horizontal")
  - `value` - Controlled value array (e.g., [50] or [25, 75])
  - `default_value` - Initial value array (default: [50])
  - `min` - Minimum value (default: 0)
  - `max` - Maximum value (default: 100)
  - `step` - Step increment (default: 1)
  - `disabled` - Whether the slider is disabled
  - `name` - Form name attribute
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
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
  attr :on_value_change, :string, default: nil, doc: "LiveView event when value changes."
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
          class: "est-r-size",
          values: @sizes,
          default: "2",
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "est-variant",
          values: @variants,
          default: "surface"
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    current_values = assigns[:value] || assigns[:default_value] || [50]
    id = assigns[:id] || "slider-#{System.unique_integer([:positive])}"

    class =
      ["est-reset", "est-SliderRoot", extracted.class]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style], "--essence-slider-thumb-transform: translateX(-50%);"]
      |> Enum.reject(&(is_nil(&1) or &1 == ""))
      |> Enum.join(" ")

    thumb_indexes = 0..(length(current_values) - 1) |> Enum.to_list()

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: style,
        color: assigns[:color] || false,
        current_values: current_values,
        thumb_indexes: thumb_indexes
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
      on_value_change={@on_value_change}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      <.track class="est-SliderTrack" data-orientation={@orientation}>
        <.range class="est-SliderRange" data-orientation={@orientation} />
      </.track>
      <.thumb
        :for={index <- @thumb_indexes}
        index={index}
        class="est-SliderThumb"
        data-orientation={@orientation}
      />
    </.root>
    """
  end
end
