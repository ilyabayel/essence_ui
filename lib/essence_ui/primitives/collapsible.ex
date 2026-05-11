defmodule EssenceUI.Primitives.Collapsible do
  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def root(assigns) do
    ~H"""
    <div id={@id} phx-hook="CollapsibleRoot" data-state={if @open, do: "open", else: "closed"} data-disabled={to_string(@disabled)} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, required: true, doc: "The ID of the content this trigger controls"
  attr :trigger_id, :string, default: nil, doc: "Optional ID for the trigger element itself"
  attr :rest, :global
  slot :inner_block, required: true
  def trigger(assigns) do
    ~H"""
    <button id={@trigger_id} type="button" data-essence-collapsible-trigger aria-controls={@id} aria-expanded="false" {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true
  def content(assigns) do
    ~H"""
    <div id={@id} data-essence-collapsible-content hidden {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
