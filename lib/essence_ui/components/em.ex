defmodule EssenceUI.Components.Em do
  @moduledoc """
  Em component 100% compatible with Radix UI Themes Em API.
  See: https://www.radix-ui.com/themes/docs/components/em

  ## Examples

      <.em>
        Emphasized text
      </.em>

      <.em truncate>
        This is a long emphasized text that will be truncated.
      </.em>

  ## Props

    * `as_child` - If true, renders the component as its child element.
    * `truncate` - If true, truncates text with ellipsis when it overflows.
    * `wrap` - Controls text wrapping. One of: "wrap", "nowrap", "pretty", "balance". Responsive supported.
    * `class` - Additional CSS classes.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps

  require AsChildProps
  require TextWrapProps
  require TruncateProps

  @doc """
  Renders an emphasized text element.
  """
  AsChildProps.attrs()
  TruncateProps.attrs()
  TextWrapProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :global
  slot :inner_block, required: true

  def em(assigns) do
    prop_defs =
      %{}
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-Em",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <em class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </em>
    """
  end
end
