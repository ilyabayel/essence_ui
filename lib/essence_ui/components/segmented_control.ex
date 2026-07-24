defmodule EssenceUI.Components.SegmentedControl do
  @moduledoc """
  A SegmentedControl component for selecting one option from a group of related options.

  Based on Radix UI Themes SegmentedControl component with support for various sizes, variants,
  and colors. The segmented control provides a tab-like interface for switching between
  mutually exclusive options.

  ## Examples

      <.segmented_control value="option1" on_change={fn val -> IO.puts("Selected: " <> val) end}>
        <.segmented_control_item value="option1">Option 1</.segmented_control_item>
        <.segmented_control_item value="option2">Option 2</.segmented_control_item>
        <.segmented_control_item value="option3">Option 3</.segmented_control_item>
      </.segmented_control>

      <.segmented_control size="3" variant="classic" color="blue" value="tab1">
        <.segmented_control_item value="tab1">Tab 1</.segmented_control_item>
        <.segmented_control_item value="tab2">Tab 2</.segmented_control_item>
      </.segmented_control>

      <.segmented_control radius="large" variant="surface" value="rounded">
        <.segmented_control_item value="rounded">Rounded</.segmented_control_item>
        <.segmented_control_item value="sharp">Sharp</.segmented_control_item>
      </.segmented_control>

  ## Props

  - `size` - Control size: "1", "2", "3" (default: "2")
  - `variant` - Visual variant: "surface", "classic" (default: "surface")
  - `radius` - Border radius: "none", "small", "medium", "large", "full" (default: none)
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `value` - Controlled selected value
  - `default_value` - Initial selected value
  - `on_change` - Callback function when selection changes
  - `disabled` - Whether the control is disabled
  - `name` - Form name attribute
  - Plus layout props (position, inset, overflow, etc.) for positioning control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
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

  ColorProps.attrs()
  HighContrastProps.attrs()
  LayoutProps.attrs()
  RadiusProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Control size from 1 to 3. Controls overall dimensions and spacing."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface' or 'classic'."

  attr :value, :string, default: nil, doc: "Controlled selected value."
  attr :default_value, :string, default: nil, doc: "Initial selected value."
  attr :on_change, :any, default: nil, doc: "Callback function when selection changes."
  attr :disabled, :boolean, default: false, doc: "Whether the control is disabled."
  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :option, required: true, doc: "SegmentedControlItem components."

  def segmented_control(assigns) do
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
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    value = assigns[:value] || assigns[:default_value]

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-SegmentedControlRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        value: value,
        color: assigns[:color] || false,
        radius: assigns[:radius] || "medium"
      )

    ~H"""
    <div
      role="tablist"
      data-accent-color={@color}
      data-disabled={@disabled}
      data-radius={@radius}
      class={@class}
      style={@style}
      {@rest}
    >
      <%= for entry <- @option do %>
        <.segmented_control_item
          value={entry.value}
          disabled={entry[:disabled] || @disabled}
          selected={entry.value == @value}
        >
          {render_slot(entry)}
        </.segmented_control_item>
      <% end %>
      <div class="rt-SegmentedControlIndicator"></div>
    </div>
    """
  end

  @doc """
  A single item within a SegmentedControl.

  ## Props

  - `value` - The value this item represents
  - `disabled` - Whether this item is disabled
  - `class` - Additional CSS classes
  - `style` - Additional inline styles
  - `rest` - Additional HTML attributes
  """

  attr :value, :string, required: true, doc: "The value this item represents."
  attr :disabled, :boolean, default: false, doc: "Whether this item is disabled."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""
  attr :selected, :boolean, default: false, doc: "Whether this item is selected."

  attr :parent_on_change, :any, default: nil, doc: "Parent control's change callback."

  attr :rest, :global,
    include: ~w(id aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "The content to display for this item."

  def segmented_control_item(assigns) do
    data_state = if assigns.selected, do: "on", else: "off"

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-SegmentedControlItem",
        assigns.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        data_state: data_state
      )

    ~H"""
    <button
      type="button"
      role="tab"
      aria-selected={@selected}
      data-state={@data_state}
      disabled={@disabled}
      class={@class}
      style={@style}
      phx-click={if @parent_on_change && !@disabled, do: @parent_on_change.(@value)}
      {@rest}
    >
      <div class="rt-SegmentedControlItemSeparator"></div>
      <div class="rt-SegmentedControlItemLabel">
        <span class="rt-SegmentedControlItemLabelInactive" aria-hidden={"#{@selected}"}>
          {render_slot(@inner_block)}
        </span>
        <span class="rt-SegmentedControlItemLabelActive" aria-hidden={"#{!@selected}"}>
          {render_slot(@inner_block)}
        </span>
      </div>
    </button>
    """
  end
end
