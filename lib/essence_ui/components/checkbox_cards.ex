defmodule EssenceUI.Components.CheckboxCards do
  @moduledoc """
  Checkbox Cards component styled per Radix Themes CheckboxCards.

  Uses `EssenceUI.Primitives.Checkbox` per item (no client hook).

  Pass root context into items with `:let`:

      <.checkbox_cards_root id="cards" default_value={["1"]} columns="3" :let={ctx}>
        <.checkbox_cards_item value="1" {ctx}>
          ...
        </.checkbox_cards_item>
      </.checkbox_cards_root>
  """

  use Phoenix.Component

  import EssenceUI.Primitives.Checkbox, only: [root: 1, indicator: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.GapProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]
  @columns_values Enum.map(1..9, &Integer.to_string/1)

  @doc """
  Root container for checkbox cards. Renders as a grid with checkbox card items.
  """
  attr :id, :string, default: nil
  attr :name, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  attr :columns, :any, default: nil
  attr :gap, :string, default: "4"
  attr :default_value, :list, default: []
  attr :value, :list, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  MarginProps.attrs()
  attr :rest, :global, include: ~w(dir)
  slot :inner_block, required: true

  def checkbox_cards_root(assigns) do
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
      ["rt-Grid", "rt-CheckboxCardsRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    id = assigns[:id] || "checkbox-cards-#{System.unique_integer([:positive])}"

    ctx = %{
      selected_values: selected_values,
      name: assigns[:name],
      size: assigns.size,
      high_contrast: assigns.high_contrast,
      disabled: assigns.disabled,
      color: assigns[:color]
    }

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style:
          ["outline:none", extracted.style, assigns[:style]]
          |> Enum.filter(&(&1 not in [nil, ""]))
          |> Enum.join(";"),
        color: assigns[:color],
        ctx: ctx
      )

    ~H"""
    <div
      id={@id}
      role="group"
      dir={assigns[:rest][:dir] || "ltr"}
      class={@class}
      style={@style}
      tabindex="0"
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block, @ctx)}
    </div>
    """
  end

  @doc """
  Individual checkbox card item. Must be used within checkbox_cards_root.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :high_contrast, :boolean, default: false
  attr :color, :string, default: nil
  attr :selected_values, :list, default: []
  attr :checked, :boolean, default: nil
  attr :default_checked, :boolean, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def checkbox_cards_item(assigns) do
    selected? =
      cond do
        is_boolean(assigns[:checked]) -> assigns.checked
        is_boolean(assigns[:default_checked]) -> assigns.default_checked
        true -> to_string(assigns.value) in Enum.map(assigns.selected_values || [], &to_string/1)
      end

    size = assigns[:size] || "2"

    checkbox_class =
      [
        "rt-reset",
        "rt-BaseCheckboxRoot",
        "rt-CheckboxCardCheckbox",
        "rt-r-size-#{size}",
        "rt-variant-surface",
        assigns.high_contrast && "rt-high-contrast"
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    id = assigns[:id] || "checkbox-card-#{System.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        id: id,
        selected?: selected?,
        checkbox_class: checkbox_class,
        label_class:
          ["rt-BaseCard", "rt-CheckboxCardsItem", assigns[:class]]
          |> Enum.filter(& &1)
          |> Enum.join(" ")
      )

    ~H"""
    <label class={@label_class} style={@style}>
      {render_slot(@inner_block)}
      <.root
        id={@id}
        name={@name}
        value={@value}
        default_checked={@selected?}
        disabled={@disabled}
        class={@checkbox_class}
        data-accent-color={@color}
        tabindex="-1"
        {@rest}
      >
        <.indicator class="rt-BaseCheckboxIndicator">
          <svg
            width="9"
            height="9"
            viewBox="0 0 9 9"
            fill="currentcolor"
            xmlns="http://www.w3.org/2000/svg"
            data-state="checked"
          >
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"
            />
          </svg>
        </.indicator>
      </.root>
    </label>
    """
  end
end
