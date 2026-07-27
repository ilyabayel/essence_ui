defmodule EssenceUI.Primitives.Dialog do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true, doc: "Unique id for the dialog root."
  attr :open, :boolean, default: false, doc: "Controlled open state."
  attr :default_open, :boolean, default: false, doc: "Initial open state when uncontrolled."
  attr :modal, :boolean, default: true, doc: "When true, outside interaction is disabled and focus is trapped."
  attr :on_open_change, :string, default: nil, doc: "LiveView event name pushed when open state changes."
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    open = assigns.open || assigns.default_open
    assigns = assign(assigns, :state, if(open, do: "open", else: "closed"))

    ~H"""
    <div
      id={@id}
      phx-hook="DialogRoot"
      data-state={@state}
      data-modal={to_string(@modal)}
      data-on-open-change={@on_open_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil, doc: "Optional id for the trigger button."
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-radix-dialog-trigger
      data-state="closed"
      aria-haspopup="dialog"
      aria-expanded="false"
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, required: true, doc: "Portal id required by Phoenix.Component.portal."
  attr :target, :string, default: "body", doc: "CSS selector for the portal target (default body)."
  slot :inner_block, required: true

  def portal(assigns) do
    ~H"""
    <Phoenix.Component.portal id={@id} target={@target}>
      {render_slot(@inner_block)}
    </Phoenix.Component.portal>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def overlay(assigns) do
    ~H"""
    <div
      id={@id}
      data-radix-dialog-overlay
      data-state="closed"
      hidden
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      role="dialog"
      aria-modal="true"
      data-radix-dialog-content
      data-state="closed"
      tabindex="-1"
      hidden
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def title(assigns) do
    ~H"""
    <h2 id={@id} data-radix-dialog-title {@rest}>
      {render_slot(@inner_block)}
    </h2>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def description(assigns) do
    ~H"""
    <p id={@id} data-radix-dialog-description {@rest}>
      {render_slot(@inner_block)}
    </p>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def close(assigns) do
    ~H"""
    <button id={@id} type="button" data-radix-dialog-close {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end
end
