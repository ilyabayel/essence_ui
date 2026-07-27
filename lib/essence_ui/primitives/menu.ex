defmodule EssenceUI.Primitives.Menu do
  @moduledoc false
  # Internal building block (Radix `@radix-ui/react-menu`). Reused by
  # DropdownMenu, ContextMenu, and Menubar — not a public docs primitive.

  use EssenceUI.Primitives

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
  attr :rest, :global
  slot :inner_block

  def anchor(assigns) do
    ~H"""
    <div id={@id} data-radix-menu-anchor {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <div id={@id} data-radix-menu-label {@rest}>
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
      data-radix-menu-item
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
    <div id={@id} role="group" data-radix-menu-group {@rest}>
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
      data-radix-menu-checkbox-item
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
    <div id={@id} role="group" data-radix-menu-radio-group data-value={@value} {@rest}>
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
      data-radix-menu-radio-item
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
      data-radix-menu-item-indicator
      data-force-mount={if @force_mount, do: ""}
      style={unless @force_mount, do: "display: none;"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :id, :string, default: nil
  attr :decorative, :boolean, default: true
  attr :rest, :global

  def separator(assigns) do
    ~H"""
    <div
      id={@id}
      role={if(@decorative, do: "none", else: "separator")}
      aria-orientation={unless(@decorative, do: "horizontal")}
      data-radix-menu-separator
      {@rest}
    >
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def arrow(assigns) do
    ~H"""
    <span id={@id} data-radix-menu-arrow aria-hidden="true" {@rest}>
      {render_slot(@inner_block)}
    </span>
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
    <div id={@id} data-radix-menu-sub data-state={@state} {@rest}>
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
      data-radix-menu-sub-trigger
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
      data-radix-menu-sub-content
      data-radix-menu-content
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
