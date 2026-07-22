defmodule EssenceUI.Primitives.NavigationMenu do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :delay_duration, :integer, default: 200
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <nav
      id={@id}
      phx-hook="NavigationMenuRoot"
      data-essence-navigation-menu-root
      data-orientation={@orientation}
      data-delay-duration={@delay_duration}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </nav>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def list(assigns) do
    ~H"""
    <ul id={@id} data-essence-navigation-menu-list {@rest}>
      {render_slot(@inner_block)}
    </ul>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def item(assigns) do
    ~H"""
    <li id={@id} data-essence-navigation-menu-item data-value={@value} {@rest}>
      {render_slot(@inner_block)}
    </li>
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
      data-essence-navigation-menu-trigger
      aria-expanded="false"
      aria-controls={@content_id}
      data-state="closed"
      disabled={@disabled}
      data-disabled={if @disabled, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, default: nil
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-navigation-menu-content
      data-state="closed"
      data-force-mount={if @force_mount, do: ""}
      style="display: none;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :href, :string, default: nil
  attr :active, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def link(assigns) do
    ~H"""
    <a
      id={@id}
      href={@href}
      data-essence-navigation-menu-link
      data-active={if @active, do: ""}
      aria-current={if @active, do: "page"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def sub(assigns) do
    ~H"""
    <div id={@id} data-essence-navigation-menu-sub {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def viewport(assigns) do
    ~H"""
    <div id={@id} data-essence-navigation-menu-viewport data-state="closed" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def indicator(assigns) do
    ~H"""
    <li
      id={@id}
      data-essence-navigation-menu-indicator
      data-state="hidden"
      aria-hidden="true"
      {@rest}
    >
      {render_slot(@inner_block)}
    </li>
    """
  end
end
