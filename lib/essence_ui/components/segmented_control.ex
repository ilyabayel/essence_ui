defmodule EssenceUI.Components.SegmentedControl do
  @moduledoc """
  SegmentedControl component styled per Radix Themes SegmentedControl.

  Wraps `EssenceUI.Primitives.ToggleGroup` with `type="single"`.

  ## Examples

      <.segmented_control id="seg-1" value="option1">
        <.segmented_control_item value="option1">Option 1</.segmented_control_item>
        <.segmented_control_item value="option2">Option 2</.segmented_control_item>
        <.segmented_control_item value="option3">Option 3</.segmented_control_item>
      </.segmented_control>
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.ToggleGroup
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require MarginProps
  require RadiusProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]

  @doc """
  Segmented control root.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :radius, :string, values: RadiusProps.radii()
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :on_value_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :class, :string, default: nil
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def segmented_control(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"},
        high_contrast: %{type: :boolean, class: "rt-high-contrast"}
      }
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "segmented-control-#{System.unique_integer([:positive])}"
    value = assigns[:value] || assigns[:default_value]

    class =
      ["rt-SegmentedControlRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: extracted.style,
        value: value,
        color: assigns[:color],
        radius: assigns[:radius]
      )

    ~H"""
    <ToggleGroup.root
      id={@id}
      type="single"
      value={@value}
      disabled={@disabled}
      dir={@dir}
      on_value_change={@on_value_change}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      {render_slot(@inner_block)}
      <div class="rt-SegmentedControlIndicator"></div>
    </ToggleGroup.root>
    """
  end

  @doc """
  A single item within a SegmentedControl.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def segmented_control_item(assigns) do
    class =
      ["rt-reset", "rt-SegmentedControlItem", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <ToggleGroup.item id={@id} value={@value} disabled={@disabled} class={@class} {@rest}>
      <span class="rt-SegmentedControlItemSeparator"></span>
      <span class="rt-SegmentedControlItemLabel">
        <span class="rt-SegmentedControlItemLabelActive">
          {render_slot(@inner_block)}
        </span>
        <span class="rt-SegmentedControlItemLabelInactive" aria-hidden="true">
          {render_slot(@inner_block)}
        </span>
      </span>
    </ToggleGroup.item>
    """
  end
end
