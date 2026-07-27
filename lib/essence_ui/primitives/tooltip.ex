defmodule EssenceUI.Primitives.Tooltip do
  @moduledoc false

  use EssenceUI.Primitives

  attr :delay_duration, :integer, default: 700, doc: "Default open delay in ms for tooltips in this provider."
  attr :skip_delay_duration, :integer, default: 300, doc: "Delay when moving between tooltips."
  attr :disable_hoverable_content, :boolean, default: false, doc: "When true, tooltip content is not hoverable."
  attr :rest, :global
  slot :inner_block, required: true

  def provider(assigns) do
    ~H"""
    <div
      data-radix-tooltip-provider
      data-delay-duration={@delay_duration}
      data-skip-delay-duration={@skip_delay_duration}
      data-disable-hoverable-content={if @disable_hoverable_content, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, required: true, doc: "Unique id for the tooltip root."
  attr :open, :boolean, default: false, doc: "Controlled open state."
  attr :default_open, :boolean, default: false, doc: "Initial open state when uncontrolled."
  attr :open_delay, :integer, default: nil, doc: "Override provider open delay (ms)."
  attr :close_delay, :integer, default: 0, doc: "Delay before closing (ms)."
  attr :on_open_change, :string, default: nil, doc: "LiveView event name pushed when open state changes."
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    open = assigns.open || assigns.default_open
    assigns = assign(assigns, :state, if(open, do: "open", else: "closed"))

    ~H"""
    <div
      id={@id}
      phx-hook="TooltipRoot"
      data-state={@state}
      data-open-delay={@open_delay}
      data-close-delay={@close_delay}
      data-on-open-change={@on_open_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  # Themes Tooltip wraps `<.button>`; a native <button> parent would be invalid HTML
  # and browsers hoist the child out of the trigger (empty trigger, dead hover target).
  attr :as, :string, default: "button", values: ["button", "div"]
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    rest =
      if assigns.as == "button" do
        Map.put(assigns.rest, :type, "button")
      else
        assigns.rest
      end

    assigns = assign(assigns, :rest, rest)

    ~H"""
    <.dynamic_tag
      tag_name={@as}
      id={@id}
      data-radix-tooltip-trigger
      aria-describedby={@content_id}
      data-state="closed"
      {@rest}
    >
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end

  attr :id, :string, required: true
  attr :target, :string, default: "body"
  attr :class, :any, default: nil
  attr :container, :string, default: "div"
  slot :inner_block, required: true

  def portal(assigns) do
    ~H"""
    <Phoenix.Component.portal id={@id} target={@target} class={@class} container={@container}>
      {render_slot(@inner_block)}
    </Phoenix.Component.portal>
    """
  end

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "top"
  attr :align, :string, values: ["start", "center", "end"], default: "center"
  attr :side_offset, :integer, default: 4
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    style =
      [
        "display: none; position: fixed; z-index: 50; pointer-events: none;",
        assigns.style
      ]
      |> Enum.reject(&(&1 in [nil, ""]))
      |> Enum.join(" ")

    assigns = assign(assigns, :style, style)

    ~H"""
    <div
      id={@id}
      role="tooltip"
      data-radix-tooltip-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :width, :integer, default: 10
  attr :height, :integer, default: 5
  attr :rest, :global
  slot :inner_block

  def arrow(assigns) do
    ~H"""
    <svg
      id={@id}
      width={@width}
      height={@height}
      viewBox="0 0 30 10"
      preserveAspectRatio="none"
      data-radix-tooltip-arrow
      aria-hidden="true"
      {@rest}
    >
      <polygon :if={@inner_block == []} points="0,0 30,0 15,10" />
      {render_slot(@inner_block)}
    </svg>
    """
  end
end
