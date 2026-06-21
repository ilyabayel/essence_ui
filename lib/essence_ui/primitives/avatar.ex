defmodule EssenceUI.Primitives.Avatar do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <span id={@id} phx-hook="AvatarRoot" data-essence-avatar-root data-status="idle" {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :src, :string, required: true
  attr :alt, :string, default: ""
  attr :on_loading_status_change, :string, default: nil
  attr :rest, :global

  def image(assigns) do
    ~H"""
    <img
      src={@src}
      alt={@alt}
      data-essence-avatar-image
      data-on-loading-status-change={@on_loading_status_change}
      {@rest}
    />
    """
  end

  attr :delay_ms, :integer, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def fallback(assigns) do
    ~H"""
    <span data-essence-avatar-fallback data-delay-ms={@delay_ms} {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end
end
