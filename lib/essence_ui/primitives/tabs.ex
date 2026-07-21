defmodule EssenceUI.Primitives.Tabs do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :activation_mode, :string, values: ["automatic", "manual"], default: "automatic"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    assigns = assign(assigns, :value_attr, assigns.value || assigns.default_value)

    ~H"""
    <div
      id={@id}
      phx-hook="TabsRoot"
      data-essence-tabs-root
      data-value={@value_attr}
      data-orientation={@orientation}
      data-activation-mode={@activation_mode}
      data-on-value-change={@on_value_change}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :loop, :boolean, default: true
  attr :rest, :global
  slot :inner_block, required: true

  def list(assigns) do
    ~H"""
    <div
      role="tablist"
      data-essence-tabs-list
      data-loop={to_string(@loop)}
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

  def trigger(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      role="tab"
      data-essence-tabs-trigger
      data-value={@value}
      data-state="inactive"
      data-disabled={if @disabled, do: ""}
      aria-selected="false"
      tabindex="-1"
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      role="tabpanel"
      data-essence-tabs-content
      data-value={@value}
      data-state="inactive"
      data-force-mount={if @force_mount, do: ""}
      tabindex="0"
      hidden
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
