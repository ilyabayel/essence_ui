defmodule EssenceUI.Primitives.PasswordToggleField do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :visible, :boolean, default: nil
  attr :default_visible, :boolean, default: false
  attr :on_visibility_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    visible = if is_nil(assigns.visible), do: assigns.default_visible, else: assigns.visible
    assigns = assign(assigns, :visible_state, visible)

    ~H"""
    <div
      id={@id}
      phx-hook="PasswordToggleFieldRoot"
      data-essence-password-toggle-root
      data-visible={to_string(@visible_state)}
      data-default-visible={to_string(@default_visible)}
      data-on-visibility-change={@on_visibility_change}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :name, :string, default: nil
  attr :value, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :autocomplete, :string, default: "current-password"
  attr :rest, :global, include: ~w(form minlength maxlength pattern readonly autofocus)

  def input(assigns) do
    ~H"""
    <input
      id={@id}
      type="password"
      name={@name}
      value={@value}
      placeholder={@placeholder}
      disabled={@disabled}
      required={@required}
      autocomplete={@autocomplete}
      data-essence-password-toggle-input
      {@rest}
    />
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: false

  def toggle(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      data-essence-password-toggle-toggle
      aria-pressed="false"
      aria-label="Show password"
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, default: nil
  attr :visible, :boolean, default: true
  attr :hidden, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def icon(assigns) do
    ~H"""
    <span
      id={@id}
      data-essence-password-toggle-icon
      data-visible={if @visible && !@hidden, do: ""}
      data-hidden={if @hidden, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end
end
