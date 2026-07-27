defmodule EssenceUI.Primitives.ScrollArea do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :type, :string, values: ["hover", "always", "scroll", "auto"], default: "hover"
  attr :scroll_hide_delay, :integer, default: 600
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    style =
      ["position: relative;", assigns.style]
      |> Enum.reject(&(is_nil(&1) or &1 == ""))
      |> Enum.join(" ")

    assigns = assign(assigns, :merged_style, style)

    ~H"""
    <div
      id={@id}
      phx-hook="ScrollAreaRoot"
      data-radix-scroll-area-root
      data-type={@type}
      data-scroll-hide-delay={@scroll_hide_delay}
      dir={@dir}
      style={@merged_style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true

  def viewport(assigns) do
    ~H"""
    <div data-radix-scroll-area-viewport tabindex="0" {@rest}>
      <div data-radix-scroll-area-content style="min-width: 100%; display: table;">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  attr :orientation, :string, values: ["vertical", "horizontal"], default: "vertical"
  attr :force_mount, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def scrollbar(assigns) do
    ~H"""
    <div
      data-radix-scroll-area-scrollbar
      data-orientation={@orientation}
      data-state="hidden"
      data-force-mount={if @force_mount, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: false

  def thumb(assigns) do
    ~H"""
    <div data-radix-scroll-area-thumb {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: false

  def corner(assigns) do
    ~H"""
    <div data-radix-scroll-area-corner {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
