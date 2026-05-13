defmodule EssenceUI.Primitives.RadioGroup do
  @moduledoc """
  Radio Group primitive based on Radix UI Radio Group.
  """
  use EssenceUI.Primitives

  @doc """
  The root container for the radio group.
  """
  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical", "undefined"], default: "vertical"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :loop, :boolean, default: true
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="RadioGroupRoot"
      role="radiogroup"
      aria-orientation={@orientation}
      aria-required={if @required, do: "true"}
      data-essence-radio-group-root
      data-value={@value}
      data-disabled={if @disabled, do: ""}
      data-required={if @required, do: ""}
      data-orientation={@orientation}
      data-loop={if !@loop, do: "false"}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  An item in the radio group.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :checked, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: false

  def item(assigns) do
    assigns = assign_new(assigns, :id, fn -> "radio-item-#{System.unique_integer([:positive])}" end)

    ~H"""
    <button
      type="button"
      role="radio"
      id={@id}
      checked={@checked}
      data-essence-radio-group-item
      data-value={@value}
      data-disabled={if @disabled, do: ""}
      data-state={if @checked, do: "checked", else: "unchecked"}
      aria-checked={to_string(@checked)}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  @doc """
  An indicator shown when the item is checked.
  """
  attr :checked, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def indicator(assigns) do
    ~H"""
    <span
      data-essence-radio-group-indicator
      aria-hidden="true"
      style={if @checked, do: "display: inline-flex;", else: "display: none;"}
      data-state={if @checked, do: "checked", else: "unchecked"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end
end
