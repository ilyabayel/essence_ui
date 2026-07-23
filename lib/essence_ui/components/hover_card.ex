defmodule EssenceUI.Components.HoverCard do
  @moduledoc """
  HoverCard component compatible with Radix UI Themes HoverCard API.

  Based on EssenceUI.Primitives.HoverCard.
  See: https://www.radix-ui.com/themes/docs/components/hover-card
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.HoverCard, as: HoverCardPrimitive
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require WidthProps

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :open_delay, :integer, default: 200
  attr :close_delay, :integer, default: 150
  attr :on_open_change, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_root(assigns) do
    id =
      assigns[:id] ||
        "hover-card-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    assigns = assign(assigns, id: id)

    ~H"""
    <HoverCardPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      open_delay={@open_delay}
      close_delay={@close_delay}
      on_open_change={@on_open_change}
      class={["rt-HoverCardRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </HoverCardPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_trigger(assigns) do
    ~H"""
    <HoverCardPrimitive.trigger
      id={@id}
      content_id={@content_id}
      class={["rt-HoverCardTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </HoverCardPrimitive.trigger>
    """
  end

  @sizes ["1", "2", "3"]

  attr :id, :string, default: nil
  attr :target, :string, default: "body"
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

    id =
      assigns[:id] ||
        "hover-card-content-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class =
      ["rt-PopperContent", "rt-HoverCardContent", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style]]
      |> Enum.filter(&(&1 != "" and &1))
      |> Enum.join("; ")

    assigns =
      assign(assigns,
        id: id,
        portal_id: "#{id}-portal",
        class: class,
        style: style
      )

    ~H"""
    <HoverCardPrimitive.portal id={@portal_id} target={@target}>
      <HoverCardPrimitive.content
        id={@id}
        side={@side}
        align={@align}
        side_offset={8}
        class={@class}
        style={@style}
        {@rest}
      >
        {render_slot(@inner_block)}
      </HoverCardPrimitive.content>
    </HoverCardPrimitive.portal>
    """
  end
end
