defmodule EssenceUI.Primitives.Accordion do
  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :collapsible, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def root(assigns) do
    ~H"""
    <div id={@id} phx-hook="AccordionRoot" data-type={@type} data-collapsible={to_string(@collapsible)} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def item(assigns) do
    ~H"""
    <div data-essence-accordion-item data-state="closed" data-disabled={to_string(@disabled)} data-value={@value} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def header(assigns) do
    ~H"""
    <h3 data-essence-accordion-header data-orientation="vertical" {@rest}>
      {render_slot(@inner_block)}
    </h3>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def trigger(assigns) do
    ~H"""
    <button type="button" data-essence-accordion-trigger aria-expanded="false" {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def content(assigns) do
    ~H"""
    <div role="region" data-essence-accordion-content hidden {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
