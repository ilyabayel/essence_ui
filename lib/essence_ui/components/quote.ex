defmodule EssenceUI.Components.Quote do
  @moduledoc """
  Quote component 100% compatible with Radix UI Themes Quote API.
  See: https://www.radix-ui.com/themes/docs/components/quote
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps

  require ColorProps
  require HighContrastProps
  require MarginProps
  require TextWrapProps
  require TruncateProps

  @doc """
  Renders a short inline quotation. All props match Radix UI Quote.

  ## Examples

      <.quote>Styles come and go. Good design is a language, not a style</.quote>
      <.quote truncate>Long quote that will be truncated if too long.</.quote>

  ## Props
    * `wrap` - Text wrapping: one of "wrap", "nowrap", "pretty", or "balance".
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
  """
  TruncateProps.attrs()
  TextWrapProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes."
  slot :inner_block, required: true

  def quote(assigns) do
    prop_defs =
      %{}
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class = ["rt-Quote", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")
    style = [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; ")
    color = assigns[:color] || false

    assigns = assign(assigns, class: class, style: style, color: color)

    dbg(assigns)

    ~H"""
    <q class={@class} style={@style} {@rest} phx-no-format><%= render_slot(@inner_block) %></q>
    """
  end
end
