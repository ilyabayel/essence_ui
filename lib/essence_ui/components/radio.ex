defmodule EssenceUI.Components.Radio do
  @moduledoc """
  A simple, accessible Radio component for single selection within a group.

  Based on Radix UI Themes Radio component with support for various sizes, variants,
  and colors. The radio button provides visual feedback for user selections
  and should be used within radio groups for mutually exclusive choices.

  ## Examples

      <.radio name="size" value="small" />

      <.radio name="size" value="medium" checked />

      <.radio name="size" value="large" size="3" variant="soft" color="blue" />

      <.radio name="theme" value="dark" disabled />

  ## Props

  - `size` - Radio size: "1", "2", "3" (default: "2")
  - `variant` - Radio variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `checked` - Whether the radio is checked
  - `disabled` - Whether the radio is disabled
  - `name` - Form name attribute (required for grouping)
  - `value` - Form value attribute (required)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Radio size from 1 to 3. Controls overall dimensions and indicator size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :default_checked, :boolean,
    default: false,
    doc: "Initial checked state. If true, radio starts checked."

  attr :checked, :boolean,
    default: nil,
    doc: "Controlled checked state."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the radio is disabled."

  attr :name, :string, required: true, doc: "Form name attribute for grouping radios."
  attr :value, :string, required: true, doc: "Form value attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  def radio(assigns) do
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

    extracted = ExtractProps.call(assigns, prop_defs)

    checked = assigns[:checked] || assigns[:default_checked]

    # Determine checked state
    checked_state = if checked, do: "checked", else: "unchecked"

    # Determine aria-checked value
    aria_checked = if checked, do: "true", else: "false"

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-BaseRadioRoot",
        "rt-RadioRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        checked_state: checked_state,
        aria_checked: aria_checked,
        color: assigns[:color] || false
      )

    ~H"""
    <button
      type="button"
      role="radio"
      aria-checked={@aria_checked}
      data-state={@checked_state}
      data-accent-color={@color}
      class={@class}
      style={@style}
      name={@name}
      value={@value}
      disabled={@disabled}
      {@rest}
    >
    </button>
    """
  end
end
