defmodule EssenceUI.Components.Tooltip do
  @moduledoc """
  A Tooltip component that displays contextual information when hovering or focusing on an element.

  Wraps `EssenceUI.Primitives.Tooltip` with Themes visual props (`color`, margin).
  Based on Radix UI Themes Tooltip — single `<.tooltip content={…}>` API.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Tooltip, as: TooltipPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require MarginProps

  @sides ["top", "right", "bottom", "left"]
  @alignments ["start", "center", "end"]

  @doc """
  Renders a tooltip component.

  ## Examples

      <.tooltip content="This is a tooltip">
        <.button>Hover me</.button>
      </.tooltip>

      <.tooltip content="Custom tooltip" side="right" align="start">
        <.icon_button><Icons.info /></.icon_button>
      </.tooltip>

  ## Props

  - `content` - The tooltip content (required)
  - `side` - Tooltip placement: "top", "right", "bottom", "left" (default: "top")
  - `align` - Tooltip alignment: "start", "center", "end" (default: "center")
  - `open_delay` - Delay before showing (in ms) (default: 700)
  - `close_delay` - Delay before hiding (in ms) (default: 300)
  - `color` - Color theme (default: accent color)
  - Plus margin props (m, mx, my, mt, mr, mb, ml)
  """

  ColorProps.attrs()
  MarginProps.attrs()
  attr :id, :string, default: nil
  attr :content, :string, required: true, doc: "Tooltip content"
  attr :side, :string, values: @sides, default: "top", doc: "Tooltip placement"
  attr :align, :string, values: @alignments, default: "center", doc: "Tooltip alignment"
  attr :open_delay, :integer, default: 700, doc: "Delay before showing (ms)"
  attr :close_delay, :integer, default: 300, doc: "Delay before hiding (ms)"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global
  slot :inner_block, required: true

  def tooltip(assigns) do
    prop_defs =
      %{}
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "tooltip-#{System.unique_integer([:positive])}"
    content_id = "#{id}-content"

    assigns =
      assign(assigns,
        id: id,
        content_id: content_id,
        portal_id: "#{id}-portal",
        color: assigns[:color] || false,
        content_class:
          ["essence-ui", "est-TooltipContent", "est-reset", extracted.class, assigns.class]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        content_style: [extracted.style, assigns.style] |> Enum.filter(& &1) |> Enum.join("; ")
      )

    ~H"""
    <TooltipPrimitive.root
      id={@id}
      open_delay={@open_delay}
      close_delay={@close_delay}
      class="est-TooltipRoot"
    >
      <TooltipPrimitive.trigger
        id={"#{@id}-trigger"}
        content_id={@content_id}
        as="div"
        class="est-TooltipTrigger"
        style="display: inline-flex;"
      >
        {render_slot(@inner_block)}
      </TooltipPrimitive.trigger>
      <TooltipPrimitive.portal id={@portal_id} target="body">
        <TooltipPrimitive.content
          id={@content_id}
          side={@side}
          align={@align}
          class={@content_class}
          style={@content_style}
          data-accent-color={@color}
          {@rest}
        >
          <span
            class="est-Text est-TooltipText est-r-size-1"
            style="display: block; font-size: var(--font-size-1); line-height: var(--line-height-1);"
          >
            {@content}
          </span>
          <TooltipPrimitive.arrow class="est-TooltipArrow" />
        </TooltipPrimitive.content>
      </TooltipPrimitive.portal>
    </TooltipPrimitive.root>
    """
  end
end
