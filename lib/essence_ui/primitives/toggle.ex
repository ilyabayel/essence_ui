defmodule EssenceUI.Primitives.Toggle do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :pressed, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :on_pressed_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <button
      id={@id}
      phx-hook="ToggleRoot"
      type="button"
      aria-pressed={to_string(@pressed)}
      data-state={if @pressed, do: "on", else: "off"}
      data-disabled={if @disabled, do: ""}
      data-on-pressed-change={@on_pressed_change}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end
end
