defmodule EssenceUI.Components.Slider do
  @moduledoc """
  A Slider component for selecting values from a range.

  Based on Radix UI Themes Slider component with support for various sizes, variants,
  colors, and both single and range sliders. The slider provides visual feedback
  for value selection and can be used in forms, settings, and interactive controls.

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

  attr :min, :integer,
    default: 0,
    doc: "Minimum value."

  attr :max, :integer,
    default: 100,
    doc: "Maximum value."

  attr :step, :integer,
    default: 1,
    doc: "Step increment."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the slider is disabled."

  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form aria-label aria-labelledby aria-describedby),
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

    # Determine current values
    current_values = assigns[:value] || assigns[:default_value] || [50]
    is_range = length(current_values) > 1

    # Calculate percentages for positioning
    value_range = assigns[:max] - assigns[:min]

    percentages =
      Enum.map(current_values, fn value ->
        Float.round((value - assigns[:min]) / value_range * 100, 2)
      end)

    # For range sliders, calculate the range positioning
    {range_left, range_right} =
      if is_range and length(percentages) >= 2 do
        start = Enum.min(percentages)
        end_pos = Enum.max(percentages)
        {start, 100 - end_pos}
      else
        # For single slider, range goes from 0 to the value
        value_percent = List.first(percentages, 50)
        {0, 100 - value_percent}
      end

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-SliderRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        current_values: current_values,
        percentages: percentages,
        is_range: is_range,
        range_left: range_left,
        range_right: range_right
      )

    ~H"""
    <span
      class={@class}
      style={[@style, "--radix-slider-thumb-transform: translateX(-50%);"] |> Enum.join(" ")}
      data-orientation={@orientation}
      data-accent-color={@color}
      aria-disabled={@disabled}
      dir="ltr"
      {@rest}
    >
      <span class="rt-SliderTrack" data-orientation={@orientation}>
        <span
          class="rt-SliderRange"
          data-orientation={@orientation}
          style={
            if @orientation == "horizontal" do
              "left: #{@range_left}%; right: #{@range_right}%;"
            else
              "bottom: #{@range_left}%; top: #{@range_right}%;"
            end
          }
        />
      </span>

      <%= for {value, percentage} <- Enum.zip(@current_values, @percentages) do %>
        <span style={
          if @orientation == "horizontal" do
            "transform: var(--radix-slider-thumb-transform); position: absolute; left: #{percentage}%;"
          else
            "transform: translateY(50%); position: absolute; bottom: #{percentage}%;"
          end
        }>
          <span
            class="rt-SliderThumb"
            tabindex={if @disabled, do: -1, else: 0}
            role="slider"
            aria-valuemin={@min}
            aria-valuemax={@max}
            aria-valuenow={value}
            aria-orientation={@orientation}
            data-orientation={@orientation}
            data-radix-collection-item=""
          >
            <%= if @name do %>
              <input type="hidden" name={@name <> if(@is_range, do: "[]", else: "")} value={value} />
            <% end %>
          </span>
        </span>
      <% end %>
    </span>
    """
  end
end
