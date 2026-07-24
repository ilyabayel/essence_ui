defmodule EssenceUI.Components.RadioGroup do
  @moduledoc """
  Radio Group component styled per Radix Themes Radio Group.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.RadioGroup, as: RadioGroupPrimitive
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  @doc """
  The root container for the radio group.
  """
  attr :id, :string, required: true
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :on_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical", "undefined"], default: "vertical"
  ColorProps.attrs()
  HighContrastProps.attrs()
  AsChildProps.attrs()
  attr :class, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def radio_group_root(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    selected_value = assigns[:value] || assigns[:default_value]

    assigns =
      assign(assigns,
        class: ["rt-RadioGroupRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" "),
        style: extracted.style,
        color: assigns[:color],
        current_value: selected_value
      )

    ~H"""
    <RadioGroupPrimitive.root
      id={@id}
      value={@current_value}
      disabled={@disabled}
      name={@name}
      required={@required}
      orientation={@orientation}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-on-value-change={@on_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </RadioGroupPrimitive.root>
    """
  end

  @doc """
  An item in the radio group.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :checked, :boolean, default: false
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  ColorProps.attrs()
  HighContrastProps.attrs()
  attr :class, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: false

  def radio_group_item(assigns) do
    # Size and variant classes are handled differently for label vs button
    size = assigns[:size] || "2"
    variant = assigns[:variant] || "surface"
    size_class = "rt-r-size-#{size}"
    variant_class = "rt-variant-#{variant}"
    high_contrast_class = if assigns[:high_contrast], do: "rt-high-contrast"

    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, responsive: true}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    # These are used for responsive logic and style extraction
    extracted = ExtractProps.call(assigns, prop_defs)
    assigns = assign_new(assigns, :id, fn -> "radio-item-#{System.unique_integer([:positive])}" end)

    # We manually build classes to match Radix Themes precisely
    # Label gets: rt-RadioGroupItem rt-Text rt-r-size-*
    # Button gets: rt-reset rt-BaseRadioRoot rt-r-size-* rt-variant-* [rt-high-contrast]

    assigns =
      assign(assigns,
        label_class: ["rt-RadioGroupItem", "rt-Text", size_class, assigns.class] |> Enum.filter(& &1) |> Enum.join(" "),
        button_class:
          ["rt-reset", "rt-BaseRadioRoot", size_class, variant_class, high_contrast_class]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style: extracted.style,
        color: assigns[:color]
      )

    ~H"""
    <%= if render_slot(@inner_block) != "" do %>
      <label class={@label_class} style={@style} for={@id}>
        <RadioGroupPrimitive.item
          id={@id}
          value={@value}
          disabled={@disabled}
          checked={@checked}
          class={@button_class}
          data-accent-color={@color}
          {@rest}
        />
        <span class="rt-RadioGroupItemInner">
          {render_slot(@inner_block)}
        </span>
      </label>
    <% else %>
      <RadioGroupPrimitive.item
        id={@id}
        value={@value}
        disabled={@disabled}
        checked={@checked}
        class={["rt-RadioGroupItem", @button_class, @class] |> Enum.filter(& &1) |> Enum.join(" ")}
        style={@style}
        data-accent-color={@color}
        {@rest}
      />
    <% end %>
    """
  end
end
