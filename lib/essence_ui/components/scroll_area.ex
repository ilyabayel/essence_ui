defmodule EssenceUI.Components.ScrollArea do
  @moduledoc """
  A component for custom scrollbars.

  Based on Radix UI Themes ScrollArea component.

  ## Examples

      <.scroll_area style="height: 200px">
        <div style="padding: 20px">
          <p>Long content here...</p>
        </div>
      </.scroll_area>

  ## Props

  - `size` - "1", "2", "3" (default: "1")
  - `type` - "auto", "always", "scroll", "hover" (default: "hover")
  - `scroll_hide_delay` - Delay in ms before hiding scrollbars (default: 600)
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require LayoutProps
  require MarginProps
  require PaddingProps
  require WidthProps

  @sizes ["1", "2", "3"]
  @types ["auto", "always", "scroll", "hover"]

  @doc """
  ScrollArea root component.
  """
  attr :size, :string, values: @sizes, default: "1"
  attr :type, :string, values: @types, default: "hover"
  attr :scroll_hide_delay, :integer, default: 600
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  LayoutProps.attrs()
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def scroll_area(assigns) do
    prop_defs =
      %{}
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <div
      class={["rt-ScrollAreaRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["position: relative; overflow: hidden;", @extracted_style, @style] |> Enum.filter(& &1) |> Enum.join("; ")}
      data-type={@type}
      data-scroll-hide-delay={@scroll_hide_delay}
      phx-hook="ScrollArea"
      id={assigns[:id] || "scroll-area-#{System.unique_integer([:positive])}"}
      {@rest}
    >
      <div class="rt-ScrollAreaViewport" style="overflow: scroll; scrollbar-width: none; -ms-overflow-style: none; width: 100%; height: 100%;">
        {render_slot(@inner_block)}
      </div>
      <div class="rt-ScrollAreaViewportFocusRing"></div>

      <div 
        class={["rt-ScrollAreaScrollbar rt-r-size-#{@size}"] |> Enum.join(" ")} 
        data-orientation="vertical"
        style="position: absolute; top: 0; right: 0; bottom: 0;"
      >
        <div class="rt-ScrollAreaThumb"></div>
      </div>
      <div 
        class={["rt-ScrollAreaScrollbar rt-r-size-#{@size}"] |> Enum.join(" ")} 
        data-orientation="horizontal"
        style="position: absolute; left: 0; bottom: 0; right: 0;"
      >
        <div class="rt-ScrollAreaThumb"></div>
      </div>
      <div class="rt-ScrollAreaCorner" style="position: absolute; bottom: 0; right: 0;"></div>
    </div>
    """
  end

end
