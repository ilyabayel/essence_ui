defmodule EssenceUI.Primitives.ToggleGroup do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :type, :string, values: ["single", "multiple"], required: true
  attr :value, :any, default: nil
  attr :disabled, :boolean, default: false
  attr :roving_focus, :boolean, default: true
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :loop, :boolean, default: true
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    assigns = assign(assigns, :value_attr, value_attr(assigns.value))

    ~H"""
    <div
      id={@id}
      phx-hook="ToggleGroupRoot"
      role={if @type == "single", do: "radiogroup", else: "toolbar"}
      data-essence-toggle-group-root
      data-type={@type}
      data-value={@value_attr}
      data-disabled={if @disabled, do: ""}
      data-roving-focus={to_string(@roving_focus)}
      data-orientation={@orientation}
      data-loop={to_string(@loop)}
      data-on-value-change={@on_value_change}
      dir={@dir}
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

  def item(assigns) do
    assigns = assign_new(assigns, :id, fn -> "toggle-group-item-#{System.unique_integer([:positive])}" end)

    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-toggle-group-item
      data-value={@value}
      data-disabled={if @disabled, do: ""}
      data-state="off"
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
