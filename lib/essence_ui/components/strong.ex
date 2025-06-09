defmodule EssenceUI.Components.Strong do
  @moduledoc """
  Stong component 100% compatible with Radix UI Themes Stong API.
  See: https://www.radix-ui.com/themes/docs/components/strong
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps

  require TextWrapProps
  require TruncateProps

  @doc """
  Marks text to signify strong importance.

  ## Examples

      <.strong>Styles come and go. Good design is a language, not a style</.strong>
      <.strong truncate>Long quote that will be truncated if too long.</.strong>

  ## Props
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

  def strong(assigns) do
    prop_defs =
      %{}
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class = ["rt-Strong", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")
    style = [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; ")
    color = assigns[:color] || false

    assigns = assign(assigns, class: class, style: style, color: color)

    ~H"""
    <strong class={@class} style={@style} {@rest} phx-no-format><%= render_slot(@inner_block) %></strong>
    """
  end
end
