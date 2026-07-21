defmodule EssenceUI.Primitives.Toolbar do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :loop, :boolean, default: true
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="ToolbarRoot"
      role="toolbar"
      data-essence-toolbar-root
      data-orientation={@orientation}
      data-loop={to_string(@loop)}
      aria-orientation={@orientation}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-toolbar-item
      data-essence-toolbar-button
      data-disabled={if @disabled, do: ""}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :href, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def link(assigns) do
    ~H"""
    <a href={@href} data-essence-toolbar-item data-essence-toolbar-link {@rest}>
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr :orientation, :string, values: ["horizontal", "vertical"], default: "vertical"
  attr :decorative, :boolean, default: true
  attr :rest, :global

  def separator(assigns) do
    ~H"""
    <div
      role={if @decorative, do: "none", else: "separator"}
      data-essence-toolbar-separator
      data-orientation={@orientation}
      aria-orientation={if @decorative, do: nil, else: @orientation}
      {@rest}
    />
    """
  end

  attr :id, :string, default: nil
  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :value, :any, default: nil
  attr :disabled, :boolean, default: false
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def toggle_group(assigns) do
    assigns = assign(assigns, :value_attr, value_attr(assigns.value))

    ~H"""
    <div
      id={@id}
      role={if @type == "single", do: "group", else: "group"}
      data-essence-toolbar-toggle-group
      data-type={@type}
      data-value={@value_attr}
      data-disabled={if @disabled, do: ""}
      data-on-value-change={@on_value_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def toggle_item(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-toolbar-item
      data-essence-toolbar-toggle-item
      data-value={@value}
      data-state="off"
      data-disabled={if @disabled, do: ""}
      aria-pressed="false"
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp value_attr(value) when is_list(value), do: Enum.join(value, ",")
  defp value_attr(value) when is_binary(value), do: value
  defp value_attr(_), do: nil
end
