defmodule EssenceUI.Components.CheckboxCards do
  @moduledoc """
  A checkbox group component that displays checkboxes as interactive cards,
  with support for various sizes, variants, and colors.

  Wraps `EssenceUI.Primitives.CheckboxGroup`.

  ## Examples

      <.checkbox_cards_root default_value={["1"]} columns="3">
        <.checkbox_cards_item value="1">
          <.flex direction="column" width="100%">
            <.text weight="bold">A1 Keyboard</.text>
            <.text>US Layout</.text>
          </.flex>
        </.checkbox_cards_item>
        <.checkbox_cards_item value="2">
          <.flex direction="column" width="100%">
            <.text weight="bold">Pro Mouse</.text>
            <.text>Zero-lag wireless</.text>
          </.flex>
        </.checkbox_cards_item>
      </.checkbox_cards_root>

  ## Root Props

  - `size` - Cards size: "1", "2", "3" (default: "2")
  - `variant` - Visual variant: "surface", "classic" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `columns` - Number of columns: "1"-"9" or CSS value (responsive supported)
  - `gap` - Gap between cards (responsive supported)
  - `default_value` - Initial checked values as list of strings
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control

  ## Item Props

  - `value` - Value for this checkbox item (required)
  - `disabled` - Whether this item is disabled
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.CheckboxGroup, as: CheckboxGroupPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.GapProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require GapProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]
  @columns_values Enum.map(1..9, &Integer.to_string/1)

  @check_path "M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  GapProps.attrs()

  attr :id, :string, default: nil

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Cards size from 1 to 3. Controls overall dimensions and spacing."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface' or 'classic'."

  attr :columns, :any, doc: "Number of columns: 1-9 or CSS value. Responsive supported."

  attr :value, :list, default: nil, doc: "Controlled checked values as list of strings."

  attr :default_value, :list,
    default: [],
    doc: "Initial checked values as list of strings."

  attr :name, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :on_value_change, :string, default: nil

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(dir),
    doc: "Global attributes."

  slot :inner_block, required: true

  @doc """
  Root container for checkbox cards. Renders as a grid with checkbox card items.
  """
  def checkbox_cards_root(assigns) do
    assigns = assign_new(assigns, :gap, fn -> "4" end)

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
        },
        columns: %{
          type: [:enum, :string],
          values: @columns_values,
          class: "rt-r-gtc",
          custom_properties: ["--grid-template-columns"],
          responsive: true
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(GapProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-Grid",
        "rt-CheckboxCardsRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    id = assigns[:id] || "checkbox-cards-#{System.unique_integer([:positive])}"

    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    size = assigns[:size] || "2"
    high_contrast = assigns[:high_contrast]

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: extracted.style,
        color: assigns[:color],
        selected_values: selected_values,
        size: size,
        high_contrast: high_contrast
      )

    ~H"""
    <CheckboxGroupPrimitive.root
      id={@id}
      value={if @value, do: @selected_values, else: nil}
      default_value={@selected_values}
      disabled={@disabled}
      name={@name}
      required={@required}
      on_value_change={@on_value_change}
      class={@class}
      style={["outline:none", @style] |> Enum.filter(&(&1 != "")) |> Enum.join(";")}
      data-accent-color={@color}
      data-size={@size}
      data-high-contrast={if @high_contrast, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </CheckboxGroupPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true, doc: "Value for this checkbox item."
  attr :disabled, :boolean, default: false, doc: "Whether this item is disabled."
  attr :checked, :boolean, default: false
  attr :size, :string, values: @sizes, default: "2"
  HighContrastProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: ""
  attr :rest, :global, doc: "Additional attributes."
  slot :inner_block, required: true

  @doc """
  Individual checkbox card item. Must be used within checkbox_cards_root.
  """
  def checkbox_cards_item(assigns) do
    size = assigns[:size] || "2"
    size_class = "rt-r-size-#{size}"
    high_contrast_class = if assigns[:high_contrast], do: "rt-high-contrast"

    assigns = assign_new(assigns, :id, fn -> "checkbox-cards-item-#{System.unique_integer([:positive])}" end)

    assigns =
      assign(assigns,
        checkbox_class:
          [
            "rt-reset",
            "rt-BaseCheckboxRoot",
            "rt-CheckboxCardCheckbox",
            size_class,
            "rt-variant-surface",
            high_contrast_class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        label_class: ["rt-BaseCard", "rt-CheckboxCardsItem", assigns.class] |> Enum.filter(& &1) |> Enum.join(" "),
        check_path: @check_path
      )

    ~H"""
    <label class={@label_class} style={@style}>
      {render_slot(@inner_block)}
      <CheckboxGroupPrimitive.item
        id={@id}
        value={@value}
        disabled={@disabled}
        checked={@checked}
        class={@checkbox_class}
        tabindex="-1"
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
    </label>
    """
  end
end
