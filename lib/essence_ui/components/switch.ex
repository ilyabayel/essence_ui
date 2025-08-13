defmodule EssenceUI.Components.Switch do
  @moduledoc """
  A Switch component for toggling between on/off states.

  Based on Radix UI Themes Switch component with support for various sizes, variants,
  and colors. The switch provides visual feedback for boolean state changes
  and can be used in forms, settings panels, and interactive controls.

  ## Examples

      <.switch />

      <.switch checked />

      <.switch size="3" variant="soft" color="blue" />

      <.switch disabled />

      <.switch name="notifications" value="enabled" checked />

  ## Props

  - `size` - Switch size: "1", "2", "3" (default: "2")
  - `variant` - Switch variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `checked` - Controlled checked state (true/false)
  - `default_checked` - Initial checked state (default: false)
  - `disabled` - Whether the switch is disabled
  - `name` - Form name attribute
  - `value` - Form value attribute
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
    doc: "Switch size from 1 to 3. Controls overall dimensions and thumb size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :default_checked, :boolean,
    default: false,
    doc: "Initial checked state. If true, switch starts checked."

  attr :checked, :boolean,
    default: nil,
    doc: "Controlled checked state. Can be true or false."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the switch is disabled."

  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :value, :string, default: nil, doc: "Form value attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  def switch(assigns) do
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

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-SwitchRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        checked_state: checked_state,
        color: assigns[:color] || false
      )

    ~H"""
    <button
      type="button"
      role="switch"
      aria-checked={@checked_state == "checked"}
      data-state={@checked_state}
      data-disabled={@disabled}
      data-accent-color={@color}
      class={@class}
      style={@style <> "cursor: pointer;"}
      name={@name}
      value={@value}
      disabled={@disabled}
      {@rest}
    >
      <div class="rt-SwitchThumb" data-state={@checked_state}></div>
    </button>
    """
  end
end
