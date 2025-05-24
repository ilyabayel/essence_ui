defmodule EssenceUI.Components.Blockquote do
  @moduledoc """
  Blockquote component 100% compatible with Radix UI Themes Blockquote API.
  See: https://www.radix-ui.com/themes/docs/components/blockquote
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.TruncateProps
  alias EssenceUI.SharedProps.WeightProps

  require ColorProps
  require HighContrastProps
  require TruncateProps
  require WeightProps

  @doc """
  Renders a blockquote. All props match Radix UI Blockquote.

  ## Examples

      <.blockquote>
        <span :slot>Quote content here.</span>
      </.blockquote>

  ## Props

    * `color` - The accent color. One of: gray, gold, bronze, brown, yellow, amber, orange, tomato, red, ruby, crimson, pink, plum, purple, violet, iris, indigo, blue, cyan, teal, jade, green, grass, lime, mint, sky.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
  """

  ColorProps.attrs()
  HighContrastProps.attrs()
  WeightProps.attrs()
  TruncateProps.attrs()
  attr :size, :string, values: Enum.map(1..9, &Integer.to_string/1), doc: "Blockquote size (1-9). Responsive supported."
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes."
  slot :inner_block, required: true

  def blockquote(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, values: Enum.map(1..9, &Integer.to_string/1), class: "rt-r-size", responsive: true}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(WeightProps.prop_defs())
      |> Map.merge(TruncateProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      ["rt-Text", "rt-Blockquote", extracted.class]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style]]
      |> Enum.filter(& &1)
      |> Enum.join("; ")

    color = assigns[:color] || false

    assigns =
      assign(assigns,
        class: class,
        style: style,
        color: color
      )

    ~H"""
    <blockquote class={@class} style={@style} data-accent-color={@color} {@rest} phx-no-format>{render_slot(@inner_block)}</blockquote>
    """
  end
end
