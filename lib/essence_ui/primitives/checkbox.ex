defmodule EssenceUI.Primitives.Checkbox do
  @moduledoc false
  use EssenceUI.Primitives

  @doc """
  The root container for the checkbox.
  """
  attr :id, :string, required: true
  # true | false | "indeterminate"
  attr :checked, :any, default: nil
  attr :default_checked, :any, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :value, :string, default: "on"
  attr :form, :string, default: nil
  attr :on_checked_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <.trigger
      id={@id}
      checked={@checked}
      default_checked={@default_checked}
      disabled={@disabled}
      required={@required}
      name={@name}
      value={@value}
      form={@form}
      on_checked_change={@on_checked_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </.trigger>
    <.bubble_input
      checked={@checked}
      default_checked={@default_checked}
      disabled={@disabled}
      required={@required}
      name={@name}
      value={@value}
      form={@form}
    />
    """
  end

  @doc """
  The clickable button that toggles the checkbox state.
  """
  attr :id, :string, default: nil
  attr :checked, :any, default: nil
  attr :default_checked, :any, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :value, :string, default: "on"
  attr :form, :string, default: nil
  attr :on_checked_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    state = get_state(assigns[:checked] || assigns[:default_checked])
    assigns = assign(assigns, :state, state)

    ~H"""
    <button
      id={@id}
      phx-hook="CheckboxRoot"
      type="button"
      role="checkbox"
      data-state={@state}
      data-disabled={to_string(@disabled)}
      data-required={to_string(@required)}
      data-name={@name}
      data-value={@value}
      data-form={@form}
      data-default-checked={to_string(@default_checked)}
      data-on-checked-change={@on_checked_change}
      data-essence-checkbox-trigger
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  @doc """
  The visual indicator shown when the checkbox is checked or indeterminate.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def indicator(assigns) do
    ~H"""
    <span
      data-essence-checkbox-indicator
      style="pointer-events: none; display: flex; align-items: center; justify-content: center;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  @doc """
  The hidden input used for form submission.
  """
  attr :checked, :any, default: nil
  attr :default_checked, :any, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :value, :string, default: "on"
  attr :form, :string, default: nil
  attr :rest, :global

  def bubble_input(assigns) do
    checked = (assigns[:checked] || assigns[:default_checked]) == true
    assigns = assign(assigns, :checked_attr, checked)

    ~H"""
    <input
      type="checkbox"
      checked={@checked_attr}
      disabled={@disabled}
      required={@required}
      name={@name}
      value={@value}
      form={@form}
      data-essence-checkbox-input
      style="position: absolute; pointer-events: none; opacity: 0; margin: 0; transform: translateX(-100%);"
      tabindex="-1"
      aria-hidden="true"
      {@rest}
    />
    """
  end

  defp get_state("indeterminate"), do: "indeterminate"
  defp get_state(true), do: "checked"
  defp get_state(_), do: "unchecked"
end
