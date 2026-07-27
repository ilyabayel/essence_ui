defmodule EssenceUI.Components.HoverCard do
  @moduledoc """
  A HoverCard component for sighted users to preview content available behind a link.

  Wraps `EssenceUI.Primitives.HoverCard` with themed visual props.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.HoverCard, as: HoverCardPrimitive
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
  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :open_delay, :integer, default: 200, doc: "Delay before showing (ms)"
  attr :close_delay, :integer, default: 150, doc: "Delay before hiding (ms)"
  attr :on_open_change, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_root(assigns) do
    assigns =
      assign(assigns, :id, assigns[:id] || "hover-card-#{System.unique_integer([:positive])}")

    ~H"""
    <HoverCardPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      open_delay={@open_delay}
      close_delay={@close_delay}
      on_open_change={@on_open_change}
      class={["est-HoverCardRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: contents;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </HoverCardPrimitive.root>
    """
  end

  @doc """
  The trigger area that opens the hover card on hover.
  Wraps the link or element that triggers the hover card.
  """
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
      class={["est-HoverCardTrigger", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={
        [
          # Root uses display:contents; without this, grid/flex parents stretch the
          # trigger and align=center positions against the full row, not the control.
          "display: inline-flex; width: max-content; justify-self: start;",
          @style
        ]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </HoverCardPrimitive.trigger>
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
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :side, :string, values: ["top", "bottom", "left", "right"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :container, :string, default: "body"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  WidthProps.attrs()
  HeightProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def hover_card_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "est-r-size", values: @sizes, default: "2", responsive: true}
      }
      |> Map.merge(WidthProps.prop_defs())
      |> Map.merge(HeightProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "hover-card-content-#{System.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        id: id,
        portal_id: "#{id}-portal",
        class:
          ["est-PopperContent", "est-HoverCardContent", extracted.class, assigns.class]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style: [extracted.style, assigns.style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")
      )

    ~H"""
    <HoverCardPrimitive.portal id={@portal_id} target={@container}>
      <HoverCardPrimitive.content
        id={@id}
        side={@side}
        align={@align}
        class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
        style={@style}
        {Map.delete(@rest, :class)}
      >
        {render_slot(@inner_block)}
      </HoverCardPrimitive.content>
    </HoverCardPrimitive.portal>
    """
  end
end
