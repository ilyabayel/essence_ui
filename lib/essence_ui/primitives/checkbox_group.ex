defmodule EssenceUI.Primitives.CheckboxGroup do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :value, :list, default: nil
  attr :default_value, :list, default: []
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
    values = assigns[:value] || assigns[:default_value] || []
    values = if is_list(values), do: values, else: [values]
    values = Enum.map(values, &to_string/1)
    value_attr = Jason.encode!(values)

    assigns = assign(assigns, :value_attr, value_attr)

    ~H"""
    <div
      id={@id}
      phx-hook="CheckboxGroupRoot"
      role="group"
      aria-required={to_string(@required)}
      data-radix-checkbox-group-root
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
    assigns = assign_new(assigns, :id, fn -> "checkbox-group-item-#{System.unique_integer([:positive])}" end)

    ~H"""
    <button
      type="button"
      role="checkbox"
      id={@id}
      value={@value}
      data-radix-checkbox-group-item
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
      data-radix-checkbox-group-indicator
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
      type="checkbox"
      checked={@checked}
      disabled={@disabled}
      required={@required}
      name={@name}
      value={@value}
      form={@form}
      data-radix-checkbox-group-input
      style="position: absolute; pointer-events: none; opacity: 0; margin: 0; transform: translateX(-100%); width: 25px; height: 25px;"
      tabindex="-1"
      aria-hidden="true"
      {@rest}
    />
    """
  end
end
