defmodule EssenceUI.Components.RadioGroup do
  @moduledoc """
  A group of radio buttons where only one can be selected at a time.

  Based on Radix UI Themes Radio Group component with support for various sizes, variants,
  and colors. Radio Group provides layout and state management for a collection of
  radio buttons, ensuring only one can be selected at a time.

  ## Examples

      <.radio_group name="theme" default_value="light">
        <.radio_group_item value="light">Light</.radio_group_item>
        <.radio_group_item value="dark">Dark</.radio_group_item>
        <.radio_group_item value="system">System</.radio_group_item>
      </.radio_group>

      <.radio_group name="size" size="3" variant="soft" color="blue" default_value="medium">
        <.radio_group_item value="small">Small</.radio_group_item>
        <.radio_group_item value="medium">Medium</.radio_group_item>
        <.radio_group_item value="large">Large</.radio_group_item>
      </.radio_group>

  ## Props

  - `size` - Radio button size: "1", "2", "3" (default: "2")
  - `variant` - Radio variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `default_value` - Initial selected value
  - `value` - Controlled selected value
  - `disabled` - Whether the entire group is disabled
  - `name` - Form name attribute (required for form submission)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  import EssenceUI.Components.Radio, only: [radio: 1]
  import EssenceUI.Components.Text, only: [text: 1]

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
    doc: "Radio button size from 1 to 3. Controls overall dimensions and indicator size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :default_value, :string,
    default: nil,
    doc: "Initial selected value."

  attr :value, :string,
    default: nil,
    doc: "Controlled selected value."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the entire radio group is disabled."

  attr :name, :string, required: true, doc: "Form name attribute for the radio group."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :item, required: true, doc: "Radio group item"

  def radio_group(assigns) do
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

    selected_value = assigns[:value] || assigns[:default_value]

    # Build CSS classes
    class =
      [
        "rt-RadioGroupRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        selected_value: selected_value,
        color: assigns[:color] || false
      )

    ~H"""
    <div
      role="radiogroup"
      data-accent-color={@color}
      class={@class}
      style={@style}
      tabindex="0"
      {@rest}
    >
      <%= for item <- @item do %>
        <.text as="label" class="rt-RadioGroupItem" style="align-items: center;" size={@size}>
          <.radio
            name={@name}
            value={item[:value]}
            checked={item[:value] == @selected_value}
            disabled={@disabled || item[:disabled]}
            size={@size}
          />
          <span class="rt-RadioGroupItemInner">
            {render_slot(item)}
          </span>
        </.text>
      <% end %>
    </div>
    """
  end
end
