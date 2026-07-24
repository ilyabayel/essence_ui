defmodule EssenceUI.Components.RadioCards do
  @moduledoc """
  A radio group component that displays radios as interactive cards.

  Based on Radix UI Themes RadioCards component. Provides a card-based layout
  for radio selections, with support for various sizes, variants, and colors.

  ## Examples

      <.radio_cards_root default_value="1" columns="3">
        <.radio_cards_item value="1">
          <.flex direction="column" width="100%">
            <.text weight="bold">A1 Keyboard</.text>
            <.text>US Layout</.text>
          </.flex>
        </.radio_cards_item>
        <.radio_cards_item value="2">
          <.flex direction="column" width="100%">
            <.text weight="bold">Pro Mouse</.text>
            <.text>Zero-lag wireless</.text>
          </.flex>
        </.radio_cards_item>
      </.radio_cards_root>

  ## Root Props

  - `size` - Cards size: "1", "2", "3" (default: "2")
  - `variant` - Visual variant: "surface", "classic" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `columns` - Number of columns: "1"-"9" or CSS value (responsive supported)
  - `gap` - Gap between cards (responsive supported)
  - `default_value` - Initial checked value
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control

  ## Item Props

  - `value` - Value for this radio item (required)
  - `disabled` - Whether this item is disabled
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
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

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  GapProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Cards size from 1 to 3. Controls overall dimensions and spacing."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface' or 'classic'."

  attr :columns, :any, doc: "Number of columns: 1-9 or CSS value. Responsive supported."

  attr :default_value, :string,
    default: nil,
    doc: "Initial checked value."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id dir name),
    doc: "Global attributes."

  slot :inner_block, required: true

  @doc """
  Root container for radio cards. Renders as a grid with radio card items.
  """
  def radio_cards_root(assigns) do
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
        "rt-RadioCardsRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        default_value: if(assigns[:default_value], do: to_string(assigns[:default_value]), else: "")
      )

    ~H"""
    <div
      role="radiogroup"
      dir={assigns[:dir] || "ltr"}
      class={@class}
      style={["outline:none", @style] |> Enum.filter(&(&1 != "")) |> Enum.join(";")}
      tabindex="0"
      data-accent-color={@color}
      data-default-value={@default_value}
      id={assigns[:id] || "radio-cards-#{System.unique_integer([:positive])}"}
      phx-hook="RadioCards"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :value, :string, required: true, doc: "Value for this radio item."
  attr :disabled, :boolean, default: false, doc: "Whether this item is disabled."
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: ""
  attr :rest, :global, doc: "Additional attributes."
  slot :inner_block, required: true

  @doc """
  Individual radio card item. Must be used within radio_cards_root.
  """
  def radio_cards_item(assigns) do
    # State is managed client-side by RadioCards hook to match CheckboxCards pattern
    assigns =
      assign(assigns,
        checked_state: "unchecked",
        aria_checked: "false"
      )

    ~H"""
    <button
      type="button"
      role="radio"
      aria-checked={@aria_checked}
      aria-required="false"
      data-state={@checked_state}
      value={@value}
      class={
        ["rt-reset", "rt-BaseCard", "rt-RadioCardsItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={@style}
      tabindex="-1"
      disabled={@disabled}
      data-radix-collection-item
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end
end
