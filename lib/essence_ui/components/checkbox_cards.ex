defmodule EssenceUI.Components.CheckboxCards do
  @moduledoc """
  A checkbox group component that displays checkboxes as interactive cards.

  Based on Radix UI Themes CheckboxCards component. Provides a card-based layout
  for checkbox selections, with support for various sizes, variants, and colors.

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
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]
  @columns_values Enum.map(1..9, &Integer.to_string/1)

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Cards size from 1 to 3. Controls overall dimensions and spacing."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface' or 'classic'."

  attr :columns, :any,
    doc: "Number of columns: 1-9 or CSS value. Responsive supported."

  attr :gap, :string,
    doc: "Gap between cards. Responsive supported."

  attr :default_value, :list,
    default: [],
    doc: "Initial checked values as list of strings."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id dir),
    doc: "Global attributes."

  slot :inner_block, required: true

  @doc """
  Root container for checkbox cards. Renders as a grid with checkbox card items.
  """
  def checkbox_cards_root(assigns) do
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
        },
        gap: %{
          type: :string,
          class: "rt-r-gap",
          responsive: true
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-Grid",
        "rt-CheckboxCardsRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    # Convert default_value list to a comma-separated string for data attribute
    default_value_str = Enum.join(assigns.default_value, ",")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        default_value: assigns[:default_value] || [],
        default_value_str: default_value_str
      )

    ~H"""
    <div
      role="group"
      dir={assigns[:dir] || "ltr"}
      class={@class}
      style={["outline:none", @style] |> Enum.filter(&(&1 != "")) |> Enum.join(";")}
      tabindex="0"
      data-accent-color={@color}
      data-default-values={@default_value_str}
      id={assigns[:id] || "checkbox-cards-#{System.unique_integer([:positive])}"}
      phx-hook="CheckboxCards"
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :value, :string, required: true, doc: "Value for this checkbox item."
  attr :disabled, :boolean, default: false, doc: "Whether this item is disabled."
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: ""
  attr :rest, :global, doc: "Additional attributes."
  slot :inner_block, required: true

  @doc """
  Individual checkbox card item. Must be used within checkbox_cards_root.

  The checkbox state is managed client-side with JavaScript for smooth interactions.
  """
  def checkbox_cards_item(assigns) do
    # Get parent's default_value from slot args if available
    parent_default_value = assigns[:default_value] || []
    is_checked = Enum.member?(parent_default_value, assigns.value)

    checked_state = if is_checked, do: "checked", else: "unchecked"
    aria_checked = if is_checked, do: "true", else: "false"

    assigns =
      assign(assigns,
        checked_state: checked_state,
        aria_checked: aria_checked
      )

    ~H"""
    <label class={["rt-BaseCard", "rt-CheckboxCardsItem", @class] |> Enum.filter(& &1) |> Enum.join(" ")} style={@style}>
      <%= render_slot(@inner_block) %>
      <button
        type="button"
        role="checkbox"
        aria-checked={@aria_checked}
        aria-required="false"
        data-state={@checked_state}
        value={@value}
        class="rt-reset rt-BaseCheckboxRoot rt-CheckboxCardCheckbox rt-r-size-2 rt-variant-surface"
        tabindex="-1"
        disabled={@disabled}
        data-radix-collection-item
        {@rest}
      >
        <%= if @checked_state == "checked" do %>
          <svg
            width="9"
            height="9"
            viewBox="0 0 9 9"
            fill="currentcolor"
            xmlns="http://www.w3.org/2000/svg"
            data-state="checked"
            class="rt-BaseCheckboxIndicator"
            style="pointer-events: none;"
          >
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"
            >
            </path>
          </svg>
        <% end %>
      </button>
    </label>
    """
  end
end
