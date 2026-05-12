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
  import EssenceUI.Primitives.Switch, only: [root: 1, thumb: 1]
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

  attr :id, :string, default: nil
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

  attr :required, :boolean, default: false, doc: "Whether the switch is required."
  attr :form, :string, default: nil, doc: "The form ID this switch belongs to."
  attr :on_checked_change, :string, default: nil, doc: "LiveView event to push when the checked state changes."
  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :value, :string, default: nil, doc: "Form value attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(aria-label aria-labelledby aria-describedby),
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

    # We ensure an id exists for the primitive and hook.
    id = assigns[:id] || "switch-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

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
        id: id,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false
      )

    ~H"""
    <.root
      id={@id}
      checked={@checked}
      default_checked={@default_checked}
      disabled={@disabled}
      required={@required}
      form={@form}
      on_checked_change={@on_checked_change}
      name={@name}
      value={@value}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      <.thumb class="rt-SwitchThumb" />
    </.root>
    """
  end
end
