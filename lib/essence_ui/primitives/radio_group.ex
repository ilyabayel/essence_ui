defmodule EssenceUI.Primitives.RadioGroup do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "vertical"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :loop, :boolean, default: true
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    assigns = assign(assigns, :value_attr, assigns.value || assigns.default_value)

    ~H"""
    <div
      id={@id}
      phx-hook="RadioGroupRoot"
      role="radiogroup"
      aria-orientation={@orientation}
      aria-required={to_string(@required)}
      data-radix-radio-group-root
      data-value={@value_attr}
      data-name={@name}
      data-disabled={if @disabled, do: ""}
      data-required={if @required, do: ""}
      data-orientation={@orientation}
      data-loop={if !@loop, do: "false"}
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
  attr :checked, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :form, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: false

  def item(assigns) do
    assigns = assign_new(assigns, :id, fn -> "radio-item-#{System.unique_integer([:positive])}" end)

    ~H"""
    <button
      type="button"
      role="radio"
      id={@id}
      value={@value}
      data-radix-radio-group-item
      data-value={@value}
      data-disabled={if @disabled, do: ""}
      data-state={if @checked, do: "checked", else: "unchecked"}
      aria-checked={to_string(@checked)}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    <.bubble_input
      value={@value}
      checked={@checked}
      disabled={@disabled}
      required={@required}
      name={@name}
      form={@form}
    />
    """
  end

  attr :checked, :boolean, default: false
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: false

  def indicator(assigns) do
    present? = assigns.force_mount or assigns.checked
    assigns = assign(assigns, :present?, present?)

    ~H"""
    <span
      data-radix-radio-group-indicator
      data-force-mount={if @force_mount, do: ""}
      style={if @present?, do: "display: flex;", else: "display: none;"}
      data-state={if @checked, do: "checked", else: "unchecked"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :form, :string, default: nil
  attr :rest, :global

  def bubble_input(assigns) do
    ~H"""
    <input
      type="radio"
      checked={@checked}
      disabled={@disabled}
      required={@required}
      name={@name}
      value={@value}
      form={@form}
      data-radix-radio-group-input
      style="position: absolute; pointer-events: none; opacity: 0; margin: 0; transform: translateX(-100%); width: 25px; height: 25px;"
      tabindex="-1"
      aria-hidden="true"
      {@rest}
    />
    """
  end
end
