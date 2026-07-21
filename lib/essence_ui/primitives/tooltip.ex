defmodule EssenceUI.Primitives.Tooltip do
  @moduledoc false

  use EssenceUI.Primitives

  attr :delay_duration, :integer, default: 700
  attr :skip_delay_duration, :integer, default: 300
  attr :disable_hoverable_content, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def provider(assigns) do
    ~H"""
    <div
      data-essence-tooltip-provider
      data-delay-duration={@delay_duration}
      data-skip-delay-duration={@skip_delay_duration}
      data-disable-hoverable-content={if @disable_hoverable_content, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :open_delay, :integer, default: nil
  attr :close_delay, :integer, default: 0
  attr :on_open_change, :string, default: nil
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
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-tooltip-trigger
      aria-describedby={@content_id}
      data-state="closed"
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
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
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      role="tooltip"
      data-essence-tooltip-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      style="display: none; position: fixed; z-index: 50; pointer-events: none;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def arrow(assigns) do
    ~H"""
    <span id={@id} data-essence-tooltip-arrow aria-hidden="true" {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end
end
