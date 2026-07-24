defmodule EssenceUI.Components.Tooltip do
  @moduledoc """
  Tooltip component compatible with Radix UI Themes Tooltip API.

  Based on EssenceUI.Primitives.Tooltip.
  See: https://www.radix-ui.com/themes/docs/components/tooltip
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

  ColorProps.attrs()
  MarginProps.attrs()
  attr :id, :string, default: nil
  attr :content, :string, required: true, doc: "Tooltip content"
  attr :side, :string, values: @sides, default: "top", doc: "Tooltip placement"
  attr :align, :string, values: @alignments, default: "center", doc: "Tooltip alignment"
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :open_delay, :integer, default: 700, doc: "Delay before showing (ms)"
  attr :close_delay, :integer, default: 0, doc: "Delay before hiding (ms)"
  attr :on_open_change, :string, default: nil
  attr :target, :string, default: "body"
  attr :class, :string, default: nil, doc: "Additional CSS classes for content"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global
  slot :inner_block, required: true

  def tooltip(assigns) do
    prop_defs =
      %{}
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id =
      assigns[:id] ||
        "tooltip-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    content_class =
      ["rt-TooltipContent", "rt-reset", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assigns
      |> assign(id: id)
      |> assign(content_id: "#{id}-content")
      |> assign(portal_id: "#{id}-portal")
      |> assign(color: assigns[:color] || false)
      |> assign(content_class: content_class)
      |> assign(content_style: extracted.style)

    ~H"""
    <TooltipPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      open_delay={@open_delay}
      close_delay={@close_delay}
      on_open_change={@on_open_change}
    >
      <TooltipPrimitive.trigger id={"#{@id}-trigger"} content_id={@content_id} as_child>
        {render_slot(@inner_block)}
      </TooltipPrimitive.trigger>
      <TooltipPrimitive.portal id={@portal_id} target={@target}>
        <TooltipPrimitive.content
          id={@content_id}
          side={@side}
          align={@align}
          side_offset={4}
          class={@content_class}
          style={@content_style}
          data-accent-color={@color}
          {@rest}
        >
          <span class="rt-Text rt-TooltipText rt-r-size-1">{@content}</span>
          <TooltipPrimitive.arrow class="rt-TooltipArrow" />
        </TooltipPrimitive.content>
      </TooltipPrimitive.portal>
    </TooltipPrimitive.root>
    """
  end
end
