defmodule EssenceUI.Components.SegmentedControl do
  @moduledoc """
  A SegmentedControl for selecting one option from a group of related options.
  Wraps `EssenceUI.Primitives.ToggleGroup` (single, non-deselectable), matching
  Radix Themes.

  ## Examples

      <.segmented_control id="mail" value="inbox" on_change="mail_changed">
        <:option value="inbox">Inbox</:option>
        <:option value="drafts">Drafts</:option>
        <:option value="sent">Sent</:option>
      </.segmented_control>

      <.segmented_control_root id="tabs" size="3" variant="classic" color="blue" value="tab1">
        <.segmented_control_item value="tab1">Tab 1</.segmented_control_item>
        <.segmented_control_item value="tab2">Tab 2</.segmented_control_item>
      </.segmented_control_root>

  ## Props

  - `size` - Control size: "1", "2", "3" (default: "2")
  - `variant` - Visual variant: "surface", "classic" (default: "surface")
  - `radius` - Border radius: "none", "small", "medium", "large", "full"
  - `color` - Color theme from accent color palette
  - `high_contrast` - Increase color contrast (default: false)
  - `value` - Controlled selected value
  - `default_value` - Initial selected value
  - `on_change` - LiveView event name when selection changes
  - `disabled` - Whether the control is disabled
  - Plus layout props for positioning
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.ToggleGroup, as: ToggleGroupPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.RadiusProps
  alias EssenceUI.SharedProps.WidthProps

  require ColorProps
  require HeightProps
  require HighContrastProps
  require LayoutProps
  require PaddingProps
  require RadiusProps
  require WidthProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic"]

  @doc """
  The root container for the segmented control.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :on_change, :string, default: nil
  attr :disabled, :boolean, default: false
  ColorProps.attrs()
  HighContrastProps.attrs()
  LayoutProps.attrs()
  RadiusProps.attrs()
  attr :class, :string, default: nil
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true

  def segmented_control_root(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          class: "est-r-size",
          values: @sizes,
          default: "2",
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "est-variant",
          values: @variants,
          default: "surface"
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "segmented-control-#{System.unique_integer([:positive])}"
    value = assigns[:value] || assigns[:default_value]

    assigns =
      assign(assigns,
        id: id,
        class:
          ["est-reset", "est-SegmentedControlRoot", extracted.class]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style: extracted.style,
        color: assigns[:color] || false,
        radius: assigns[:radius] || "medium",
        current_value: value
      )

    ~H"""
    <ToggleGroupPrimitive.root
      id={@id}
      type="single"
      value={@current_value}
      disabled={@disabled}
      deselectable={false}
      on_value_change={@on_change}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      {render_slot(@inner_block)}
      <div class="est-SegmentedControlIndicator"></div>
    </ToggleGroupPrimitive.root>
    """
  end

  @doc """
  A single item within a SegmentedControl.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true, doc: "The value this item represents."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "The content to display for this item."

  def segmented_control_item(assigns) do
    class =
      ["est-reset", "est-SegmentedControlItem", assigns.class]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <ToggleGroupPrimitive.item
      id={@id}
      value={@value}
      disabled={false}
      class={@class}
      style={@style}
      {@rest}
    >
      <span class="est-SegmentedControlItemSeparator"></span>
      <span class="est-SegmentedControlItemLabel">
        <span class="est-SegmentedControlItemLabelActive">{render_slot(@inner_block)}</span>
        <span class="est-SegmentedControlItemLabelInactive" aria-hidden>
          {render_slot(@inner_block)}
        </span>
      </span>
    </ToggleGroupPrimitive.item>
    """
  end

  ColorProps.attrs()
  HighContrastProps.attrs()
  RadiusProps.attrs()

  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :on_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :option, required: true, doc: "Segmented control options." do
    attr :value, :string, required: true
  end

  @doc """
  Convenience slot-based segmented control. Maps `<:option>` slots into root + items.
  """
  def segmented_control(assigns) do
    ~H"""
    <.segmented_control_root
      id={@id}
      size={@size}
      variant={@variant}
      color={assigns[:color]}
      high_contrast={assigns[:high_contrast]}
      radius={assigns[:radius]}
      value={@value}
      default_value={@default_value}
      disabled={@disabled}
      on_change={@on_change}
      class={@class}
      style={@style}
      {@rest}
    >
      <%= for entry <- @option do %>
        <.segmented_control_item value={entry.value}>
          {render_slot(entry)}
        </.segmented_control_item>
      <% end %>
    </.segmented_control_root>
    """
  end
end
