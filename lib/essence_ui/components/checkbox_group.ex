defmodule EssenceUI.Components.CheckboxGroup do
  @moduledoc """
  A group of checkboxes.

  Based on Radix UI Themes Checkbox Group component with support for various sizes, variants,
  and colors. Checkbox Group provides layout and state management for a collection of
  checkboxes, allowing multiple selections.

  ## Examples

      <.checkbox_group name="interests" default_value={["coding", "music"]}>
        <.checkbox_group_item value="coding">Coding</.checkbox_group_item>
        <.checkbox_group_item value="music">Music</.checkbox_group_item>
        <.checkbox_group_item value="sports">Sports</.checkbox_group_item>
      </.checkbox_group>

      <.checkbox_group name="roles[]" size="3" variant="soft" color="blue" default_value={["admin"]}>
        <.checkbox_group_item value="admin">Admin</.checkbox_group_item>
        <.checkbox_group_item value="editor">Editor</.checkbox_group_item>
        <.checkbox_group_item value="viewer">Viewer</.checkbox_group_item>
      </.checkbox_group>

  ## Props

  - `size` - Checkbox size: "1", "2", "3" (default: "2")
  - `variant` - Visual variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `default_value` - Initial selected values (list of strings)
  - `value` - Controlled selected values (list of strings)
  - `disabled` - Whether the entire group is disabled
  - `name` - Form name attribute
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  import EssenceUI.Components.Checkbox, only: [checkbox: 1]
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
    doc: "Checkbox button size from 1 to 3. Controls overall dimensions and indicator size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :default_value, :list,
    default: [],
    doc: "Initial selected values."

  attr :value, :list,
    default: nil,
    doc: "Controlled selected values."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the entire checkbox group is disabled."

  attr :name, :string, required: true, doc: "Form name attribute for the checkbox group."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form aria-label aria-labelledby aria-describedby dir),
    doc: "Global attributes and event handlers."

  slot :item, required: true, doc: "Checkbox group item"

  def checkbox_group(assigns) do
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

    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    # Build CSS classes
    class =
      [
        "rt-CheckboxGroupRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        selected_values: selected_values,
        color: assigns[:color] || false
      )

    ~H"""
    <div
      role="group"
      dir={assigns[:rest][:dir] || "ltr"}
      data-accent-color={@color}
      class={@class}
      style={@style}
      tabindex="0"
      {@rest}
    >
      <%= for item <- @item do %>
        <.text as="label" class="rt-CheckboxGroupItem" style="align-items: center;" size={@size}>
          <.checkbox
            name={@name}
            value={item[:value]}
            checked={to_string(item[:value]) in @selected_values}
            disabled={@disabled || Map.get(item, :disabled, false)}
            size={@size}
            variant={@variant}
            color={assigns[:color]}
            high_contrast={assigns[:high_contrast]}
          />
          <span class="rt-CheckboxGroupItemInner">
            {render_slot(item)}
          </span>
        </.text>
      <% end %>
    </div>
    """
  end
end
