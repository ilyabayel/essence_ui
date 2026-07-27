defmodule EssenceUI.Primitives.Menubar do
  @moduledoc false

  use EssenceUI.Primitives

  alias EssenceUI.Primitives.Menu

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
      data-radix-menubar-root
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
    <div id={@id} data-radix-menubar-menu data-value={@value} {@rest}>
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
      data-radix-menubar-trigger
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

  def portal(assigns), do: Menu.portal(assigns)

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 4
  attr :loop, :boolean, default: true
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      data-radix-menubar-content
      data-radix-menu-content
      data-state="closed"
      data-side={@side}
      data-align={@align}
      data-side-offset={@side_offset}
      data-loop={to_string(@loop)}
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

  def label(assigns), do: Menu.label(assigns)

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def item(assigns), do: Menu.item(assigns)

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def group(assigns), do: Menu.group(assigns)

  attr :id, :string, default: nil
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def checkbox_item(assigns), do: Menu.checkbox_item(assigns)

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def radio_group(assigns), do: Menu.radio_group(assigns)

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def radio_item(assigns), do: Menu.radio_item(assigns)

  attr :id, :string, default: nil
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def item_indicator(assigns), do: Menu.item_indicator(assigns)

  attr :id, :string, default: nil
  attr :decorative, :boolean, default: true
  attr :rest, :global

  def separator(assigns), do: Menu.separator(assigns)

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def arrow(assigns), do: Menu.arrow(assigns)

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def sub(assigns), do: Menu.sub(assigns)

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def sub_trigger(assigns), do: Menu.sub_trigger(assigns)

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "right"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 0
  attr :rest, :global
  slot :inner_block, required: true

  def sub_content(assigns), do: Menu.sub_content(assigns)
end
