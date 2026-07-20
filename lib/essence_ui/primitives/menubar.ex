defmodule EssenceUI.Primitives.Menubar do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :loop, :boolean, default: true
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="MenubarRoot"
      role="menubar"
      data-essence-menubar-root
      data-orientation={@orientation}
      data-loop={to_string(@loop)}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def menu(assigns) do
    ~H"""
    <div id={@id} data-essence-menubar-menu data-value={@value} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      role="menuitem"
      aria-haspopup="menu"
      aria-expanded="false"
      aria-controls={@content_id}
      data-essence-menubar-trigger
      data-state="closed"
      disabled={@disabled}
      data-disabled={if @disabled, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, required: true
  attr :target, :string, default: "body"
  attr :class, :any, default: nil
  attr :container, :string, default: "div"
  slot :inner_block, required: true

  def portal(assigns) do
    ~H"""
    <Phoenix.Component.portal id={@id} target={@target} class={@class} container={@container}>
      {render_slot(@inner_block)}
    </Phoenix.Component.portal>
    """
  end

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 4
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-menubar-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      role="menu"
      tabindex="-1"
      style="display: none; position: fixed; z-index: 50;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <div id={@id} data-essence-menubar-label {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def item(assigns) do
    ~H"""
    <div
      id={@id}
      role="menuitem"
      tabindex={if @disabled, do: "-1", else: "0"}
      data-essence-menubar-item
      data-disabled={if @disabled, do: ""}
      data-text-value={@text_value}
      aria-disabled={if @disabled, do: "true"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def group(assigns) do
    ~H"""
    <div id={@id} role="group" data-essence-menubar-group {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def checkbox_item(assigns) do
    state = if assigns.checked, do: "checked", else: "unchecked"
    assigns = assign(assigns, :state, state)

    ~H"""
    <div
      id={@id}
      role="menuitemcheckbox"
      tabindex={if @disabled, do: "-1", else: "0"}
      data-essence-menubar-checkbox-item
      data-state={@state}
      data-disabled={if @disabled, do: ""}
      data-text-value={@text_value}
      aria-checked={to_string(@checked)}
      aria-disabled={if @disabled, do: "true"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def radio_group(assigns) do
    ~H"""
    <div id={@id} role="group" data-essence-menubar-radio-group data-value={@value} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def radio_item(assigns) do
    state = if assigns.checked, do: "checked", else: "unchecked"
    assigns = assign(assigns, :state, state)

    ~H"""
    <div
      id={@id}
      role="menuitemradio"
      tabindex={if @disabled, do: "-1", else: "0"}
      data-essence-menubar-radio-item
      data-state={@state}
      data-value={@value}
      data-disabled={if @disabled, do: ""}
      data-text-value={@text_value}
      aria-checked={to_string(@checked)}
      aria-disabled={if @disabled, do: "true"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def item_indicator(assigns) do
    ~H"""
    <span
      id={@id}
      data-essence-menubar-item-indicator
      data-force-mount={if @force_mount, do: ""}
      style={unless @force_mount, do: "display: none;"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global

  def separator(assigns) do
    ~H"""
    <div
      id={@id}
      role="separator"
      aria-orientation="horizontal"
      data-essence-menubar-separator
      {@rest}
    >
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def sub(assigns) do
    state = if assigns.open, do: "open", else: "closed"
    assigns = assign(assigns, :state, state)

    ~H"""
    <div id={@id} data-essence-menubar-sub data-state={@state} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def sub_trigger(assigns) do
    ~H"""
    <div
      id={@id}
      role="menuitem"
      tabindex={if @disabled, do: "-1", else: "0"}
      aria-haspopup="menu"
      aria-expanded="false"
      data-essence-menubar-sub-trigger
      data-state="closed"
      data-disabled={if @disabled, do: ""}
      data-text-value={@text_value}
      aria-disabled={if @disabled, do: "true"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "right"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 0
  attr :rest, :global
  slot :inner_block, required: true

  def sub_content(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-menubar-sub-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      role="menu"
      tabindex="-1"
      style="display: none; position: fixed; z-index: 51;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
