defmodule EssenceUI.Primitives.Accordion do
  @moduledoc false
  use EssenceUI.Primitives

  alias EssenceUI.Primitives.Collapsible

  attr :id, :string, required: true
  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :collapsible, :boolean, default: false
  attr :orientation, :string, values: ["vertical", "horizontal"], default: "vertical"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="AccordionRoot"
      data-type={@type}
      data-collapsible={to_string(@collapsible)}
      data-orientation={@orientation}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, required: true
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :open, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def item(assigns) do
    ~H"""
    <Collapsible.root
      id={@id}
      open={@open}
      disabled={@disabled}
      data-essence-accordion-item
      data-value={@value}
      {@rest}
    >
      {render_slot(@inner_block)}
    </Collapsible.root>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true

  def header(assigns) do
    ~H"""
    <h3 data-essence-accordion-header {@rest}>
      {render_slot(@inner_block)}
    </h3>
    """
  end

  attr :id, :string, required: true, doc: "The ID of the content this trigger controls"
  attr :trigger_id, :string, required: true, doc: "The ID of this trigger element"
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <Collapsible.trigger
      id={@id}
      trigger_id={@trigger_id}
      data-essence-accordion-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </Collapsible.trigger>
    """
  end

  attr :id, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <Collapsible.content
      id={@id}
      role="region"
      data-essence-accordion-content
      style="--essence-accordion-content-height: var(--essence-collapsible-content-height); --essence-accordion-content-width: var(--essence-collapsible-content-width); --radix-accordion-content-height: var(--radix-collapsible-content-height); --radix-accordion-content-width: var(--radix-collapsible-content-width);"
      {@rest}
    >
      {render_slot(@inner_block)}
    </Collapsible.content>
    """
  end
end
