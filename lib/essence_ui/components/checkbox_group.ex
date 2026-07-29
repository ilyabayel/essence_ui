defmodule EssenceUI.Components.CheckboxGroup do
  @moduledoc """
  A group of checkboxes with support for various sizes, variants,
  and colors. Wraps `EssenceUI.Primitives.CheckboxGroup`.

  ## Examples

      <.checkbox_group_root id="interests" name="interests" default_value={["coding"]}>
        <.checkbox_group_item value="coding">Coding</.checkbox_group_item>
        <.checkbox_group_item value="music">Music</.checkbox_group_item>
      </.checkbox_group_root>

      <.checkbox_group name="roles[]" size="3" variant="soft" color="blue" default_value={["admin"]}>
        <:item value="admin">Admin</:item>
        <:item value="editor">Editor</:item>
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

  import EssenceUI.Components.Text, only: [text: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.CheckboxGroup, as: CheckboxGroupPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  @check_path "M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"

  @doc """
  The root container for the checkbox group.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :value, :list, default: nil
  attr :default_value, :list, default: []
  attr :on_value_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "vertical"
  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global, include: ~w(dir form aria-label aria-labelledby aria-describedby)
  slot :inner_block, required: true

  def checkbox_group_root(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "checkbox-group-#{System.unique_integer([:positive])}"

    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    assigns =
      assign(assigns,
        id: id,
        class: ["rt-CheckboxGroupRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" "),
        style: extracted.style,
        color: assigns[:color],
        selected_values: selected_values
      )

    ~H"""
    <CheckboxGroupPrimitive.root
      id={@id}
      value={if @value, do: @selected_values, else: nil}
      default_value={@selected_values}
      disabled={@disabled}
      name={@name}
      required={@required}
      orientation={@orientation}
      class={@class}
      style={@style}
      data-accent-color={@color}
      on_value_change={@on_value_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </CheckboxGroupPrimitive.root>
    """
  end

  @doc """
  An item in the checkbox group.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :checked, :boolean, default: false
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: false

  def checkbox_group_item(assigns) do
    size = assigns[:size] || "2"
    variant = assigns[:variant] || "surface"
    size_class = "rt-r-size-#{size}"
    variant_class = "rt-variant-#{variant}"
    high_contrast_class = if assigns[:high_contrast], do: "rt-high-contrast"

    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)
    assigns = assign_new(assigns, :id, fn -> "checkbox-group-item-#{System.unique_integer([:positive])}" end)

    assigns =
      assign(assigns,
        label_class:
          ["rt-CheckboxGroupItem", "rt-Text", size_class, assigns.class] |> Enum.filter(& &1) |> Enum.join(" "),
        button_class:
          [
            "rt-reset",
            "rt-BaseCheckboxRoot",
            "rt-CheckboxGroupItemCheckbox",
            size_class,
            variant_class,
            high_contrast_class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style: extracted.style,
        color: assigns[:color],
        check_path: @check_path
      )

    ~H"""
    <%= if render_slot(@inner_block) not in [nil, ""] do %>
      <.text
        as="label"
        class={@label_class}
        style={["align-items: center;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join(" ")}
        size={@size}
      >
        <CheckboxGroupPrimitive.item
          id={@id}
          value={@value}
          disabled={@disabled}
          checked={@checked}
          class={@button_class}
          data-accent-color={@color}
          {@rest}
        >
          <CheckboxGroupPrimitive.indicator checked={@checked} class="rt-BaseCheckboxIndicator">
            <svg
              width="9"
              height="9"
              viewBox="0 0 9 9"
              fill="currentcolor"
              xmlns="http://www.w3.org/2000/svg"
              style="pointer-events: none;"
            >
              <path fill-rule="evenodd" clip-rule="evenodd" d={@check_path} />
            </svg>
          </CheckboxGroupPrimitive.indicator>
        </CheckboxGroupPrimitive.item>
        <span class="rt-CheckboxGroupItemInner">
          {render_slot(@inner_block)}
        </span>
      </.text>
    <% else %>
      <CheckboxGroupPrimitive.item
        id={@id}
        value={@value}
        disabled={@disabled}
        checked={@checked}
        class={["rt-CheckboxGroupItem", @button_class, @class] |> Enum.filter(& &1) |> Enum.join(" ")}
        style={@style}
        data-accent-color={@color}
        {@rest}
      >
        <CheckboxGroupPrimitive.indicator checked={@checked} class="rt-BaseCheckboxIndicator">
          <svg
            width="9"
            height="9"
            viewBox="0 0 9 9"
            fill="currentcolor"
            xmlns="http://www.w3.org/2000/svg"
            style="pointer-events: none;"
          >
            <path fill-rule="evenodd" clip-rule="evenodd" d={@check_path} />
          </svg>
        </CheckboxGroupPrimitive.indicator>
      </CheckboxGroupPrimitive.item>
    <% end %>
    """
  end

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :id, :string, default: nil

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Checkbox button size from 1 to 3. Controls overall dimensions and indicator size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :default_value, :list, default: [], doc: "Initial selected values."
  attr :value, :list, default: nil, doc: "Controlled selected values."
  attr :disabled, :boolean, default: false, doc: "Whether the entire checkbox group is disabled."
  attr :name, :string, required: true, doc: "Form name attribute for the checkbox group."
  attr :required, :boolean, default: false
  attr :on_value_change, :string, default: nil
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(form aria-label aria-labelledby aria-describedby dir),
    doc: "Global attributes and event handlers."

  slot :item, required: true, doc: "Checkbox group item" do
    attr :value, :string, required: true
    attr :disabled, :boolean
  end

  @doc """
  Convenience slot-based checkbox group. Maps `<:item>` slots into root + items,
  passing size/variant/color/high_contrast from the root into each item.
  """
  def checkbox_group(assigns) do
    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    assigns = assign(assigns, :selected_values, selected_values)

    ~H"""
    <.checkbox_group_root
      id={@id}
      size={@size}
      variant={@variant}
      color={assigns[:color]}
      high_contrast={assigns[:high_contrast]}
      value={@value}
      default_value={@default_value}
      disabled={@disabled}
      name={@name}
      required={@required}
      on_value_change={@on_value_change}
      class={@class}
      style={@style}
      {@rest}
    >
      <%= for item <- @item do %>
        <.checkbox_group_item
          value={item[:value]}
          disabled={@disabled || Map.get(item, :disabled, false)}
          checked={to_string(item[:value]) in @selected_values}
          size={@size}
          variant={@variant}
          color={assigns[:color]}
          high_contrast={assigns[:high_contrast]}
        >
          {render_slot(item)}
        </.checkbox_group_item>
      <% end %>
    </.checkbox_group_root>
    """
  end
end
