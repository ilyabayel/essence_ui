defmodule EssenceUI.Components.RadioCards do
  @moduledoc """
  Radio Cards component styled per Radix Themes RadioCards.

  Wraps `EssenceUI.Primitives.RadioGroup` like the themed RadioGroup.

  ## Examples

      <.radio_cards_root id="cards" default_value="1" columns="3">
        <.radio_cards_item value="1">One</.radio_cards_item>
        <.radio_cards_item value="2">Two</.radio_cards_item>
      </.radio_cards_root>
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.RadioGroup, as: RadioGroupPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.GapProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]
  @columns_values Enum.map(1..9, &Integer.to_string/1)

  @doc """
  Root container for radio cards. Renders as a grid with radio card items.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  attr :columns, :any, default: nil
  attr :gap, :string, default: "4"
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :on_value_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  MarginProps.attrs()
  attr :rest, :global, include: ~w(dir)
  slot :inner_block, required: true

  def radio_cards_root(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"},
        high_contrast: %{type: :boolean, class: "rt-high-contrast"},
        columns: %{
          type: [:enum, :string],
          values: @columns_values,
          class: "rt-r-gtc",
          custom_properties: ["--grid-template-columns"],
          responsive: true
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(GapProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      ["rt-Grid", "rt-RadioCardsRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    id = assigns[:id] || "radio-cards-#{System.unique_integer([:positive])}"
    current_value = assigns[:value] || assigns[:default_value]

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style:
          ["outline:none", extracted.style, assigns[:style]]
          |> Enum.filter(&(&1 not in [nil, ""]))
          |> Enum.join(";"),
        color: assigns[:color],
        current_value: current_value
      )

    ~H"""
    <RadioGroupPrimitive.root
      id={@id}
      value={@current_value}
      disabled={@disabled}
      name={@name}
      required={@required}
      orientation="horizontal"
      on_value_change={@on_value_change}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block)}
    </RadioGroupPrimitive.root>
    """
  end

  @doc """
  Individual radio card item. Must be used within radio_cards_root.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :checked, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def radio_cards_item(assigns) do
    class =
      ["rt-reset", "rt-BaseCard", "rt-RadioCardsItem", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <RadioGroupPrimitive.item
      id={@id}
      value={@value}
      disabled={@disabled}
      checked={@checked}
      class={@class}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </RadioGroupPrimitive.item>
    """
  end
end
