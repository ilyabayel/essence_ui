defmodule EssenceUI.Primitives.Accordion do
  @moduledoc false

  use EssenceUI.Primitives

  alias EssenceUI.Primitives.Collapsible

  attr :id, :string, required: true
  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :value, :any, default: nil
  attr :default_value, :any, default: nil
  attr :collapsible, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :orientation, :string, values: ["vertical", "horizontal"], default: "vertical"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    assigns = assign(assigns, :value_attr, value_attr(assigns.value || assigns.default_value))

    ~H"""
    <div
      id={@id}
      phx-hook="AccordionRoot"
      data-type={@type}
      data-value={@value_attr}
      data-collapsible={to_string(@collapsible)}
      data-disabled={if @disabled, do: ""}
      data-orientation={@orientation}
      data-on-value-change={@on_value_change}
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

  attr :id, :string, required: true, doc: "The ID of the content the trigger controls"
  attr :trigger_id, :string, required: true, doc: "The ID of the trigger element"
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <Collapsible.trigger
      id={@trigger_id}
      content_id={@id}
      data-essence-accordion-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </Collapsible.trigger>
    """
  end

  attr :id, :string, required: true
  attr :trigger_id, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <Collapsible.content
      id={@id}
      role="region"
      aria-labelledby={@trigger_id}
      data-essence-accordion-content
      style="--essence-accordion-content-height: var(--essence-collapsible-content-height); --essence-accordion-content-width: var(--essence-collapsible-content-width); --radix-accordion-content-height: var(--radix-collapsible-content-height); --radix-accordion-content-width: var(--radix-collapsible-content-width);"
      {@rest}
    >
      {render_slot(@inner_block)}
    </Collapsible.content>
    """
  end

  defp value_attr(value) when is_list(value), do: Enum.join(value, ",")
  defp value_attr(value) when is_binary(value), do: value
  defp value_attr(_), do: nil
end
