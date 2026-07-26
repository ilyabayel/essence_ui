defmodule EssenceUI.Primitives.Popover do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :modal, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    open = assigns.open || assigns.default_open
    assigns = assign(assigns, :state, if(open, do: "open", else: "closed"))

    ~H"""
    <div
      id={@id}
      phx-hook="PopoverRoot"
      data-state={@state}
      data-modal={if @modal, do: ""}
      data-on-open-change={@on_open_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  # Themes Trigger wraps `<.button>`; a native <button> parent would be invalid HTML
  # and browsers hoist the child out of the trigger (empty trigger, dead Comment click).
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
      data-essence-popover-trigger
      aria-haspopup="dialog"
      aria-expanded="false"
      aria-controls={@content_id}
      data-state="closed"
      {@rest}
    >
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def anchor(assigns) do
    ~H"""
    <div id={@id} data-essence-popover-anchor {@rest}>
      {render_slot(@inner_block)}
    </div>
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
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "center"
  attr :side_offset, :integer, default: 8
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-popover-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      role="dialog"
      tabindex="-1"
      style="display: none; position: fixed; z-index: 50;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  # Themes Close wraps `<.button>`; same nested-button hoist as Trigger.
  attr :as, :string, default: "button", values: ["button", "div"]
  attr :rest, :global
  slot :inner_block, required: true

  def close(assigns) do
    rest =
      if assigns.as == "button" do
        Map.put(assigns.rest, :type, "button")
      else
        assigns.rest
      end

    assigns = assign(assigns, :rest, rest)

    ~H"""
    <.dynamic_tag tag_name={@as} id={@id} data-essence-popover-close {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
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
      data-essence-popover-arrow
      aria-hidden="true"
      {@rest}
    >
      <polygon :if={@inner_block == []} points="0,0 30,0 15,10" />
      {render_slot(@inner_block)}
    </svg>
    """
  end
end
