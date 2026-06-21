defmodule EssenceUI.Primitives.Collapsible do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    open = assigns.open || assigns.default_open
    assigns = assign(assigns, :state, if(open, do: "open", else: "closed"))

    ~H"""
    <div
      id={@id}
      phx-hook="CollapsibleRoot"
      data-state={@state}
      data-disabled={if @disabled, do: ""}
      data-on-open-change={@on_open_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-collapsible-trigger
      aria-controls={@content_id}
      aria-expanded="false"
      data-state="closed"
      data-disabled={if @disabled, do: ""}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, required: true
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-collapsible-content
      data-state="closed"
      data-force-mount={if @force_mount, do: ""}
      hidden
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
