defmodule EssenceUI.Components.HoverCard do
  @moduledoc """
  A HoverCard component for sighted users to preview content available behind a link.

  Based on Radix UI HoverCard component. Shows a card when hovering over a trigger element,
  with configurable open/close delays, positioning, and sizing.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require WidthProps

  @doc """
  Root container for hover card. Wraps trigger and content.

  ## Examples

      <.hover_card_root>
        <.hover_card_trigger>
          <.link href="#">Hover me</.link>
        </.hover_card_trigger>
        <.hover_card_content>
          <p>Preview content here</p>
        </.hover_card_content>
      </.hover_card_root>
  """
  attr :open_delay, :integer, default: 200, doc: "Delay before showing (ms)"
  attr :close_delay, :integer, default: 150, doc: "Delay before hiding (ms)"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  slot :inner_block, required: true

  def hover_card_root(assigns) do
    assigns = assign_new(assigns, :id, fn -> "hover-card-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div
      id={@id}
      class={["rt-HoverCardRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={
        ["display: inline-block; position: relative;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      phx-hook="HoverCard"
      data-open-delay={@open_delay}
      data-close-delay={@close_delay}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The trigger area that opens the hover card on hover.
  Wraps the link or element that triggers the hover card.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_trigger(assigns) do
    ~H"""
    <div
      class={["rt-HoverCardTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      data-hover-card-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @sizes ["1", "2", "3"]

  @doc """
  The hover card content that appears on hover.

  ## Props

  - `size` - Size of the content: "1", "2", "3" (default: "2")
  - `side` - Placement side: "top", "bottom" (default: "bottom")
  - `align` - Alignment: "start", "center", "end" (default: "start")
  - `max_width` - Maximum width (default: "480px")
  - Plus width/height props
  """
  attr :size, :string, values: @sizes, default: "2"
  attr :side, :string, values: ["top", "bottom", "left", "right"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  WidthProps.attrs()
  HeightProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true}
      }
      |> Map.merge(WidthProps.prop_defs())
      |> Map.merge(HeightProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <div
      class={
        ["rt-PopperContent", "rt-HoverCardContent", @extracted_class, @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={
        ["display: none; position: fixed; z-index: 9999;", @extracted_style, @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      data-hover-card-content
      data-side={@side}
      data-align={@align}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
