defmodule EssenceUI.Primitives.Dialog do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :modal, :boolean, default: true
  attr :on_open_change, :string, default: nil
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

  attr :id, :string, default: nil
  attr :as_child, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <span
      :if={@as_child}
      id={@id}
      data-essence-dialog-trigger
      data-state="closed"
      aria-haspopup="dialog"
      aria-expanded="false"
      style="display: contents;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    <button
      :if={!@as_child}
      id={@id}
      type="button"
      data-essence-dialog-trigger
      data-state="closed"
      aria-haspopup="dialog"
      aria-expanded="false"
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, required: true
  attr :target, :string, default: "body"
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
      data-essence-dialog-overlay
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
      data-essence-dialog-content
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
    <h2 id={@id} data-essence-dialog-title {@rest}>
      {render_slot(@inner_block)}
    </h2>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def description(assigns) do
    ~H"""
    <p id={@id} data-essence-dialog-description {@rest}>
      {render_slot(@inner_block)}
    </p>
    """
  end

  attr :id, :string, default: nil
  attr :as_child, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def close(assigns) do
    ~H"""
    <span
      :if={@as_child}
      id={@id}
      data-essence-dialog-close
      style="display: contents;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    <button :if={!@as_child} id={@id} type="button" data-essence-dialog-close {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end
end
