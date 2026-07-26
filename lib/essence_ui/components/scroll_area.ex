defmodule EssenceUI.Components.ScrollArea do
  @moduledoc """
  A component for custom scrollbars.

  Based on Radix UI Themes ScrollArea. Wraps `EssenceUI.Primitives.ScrollArea`.

  ## Examples

      <.scroll_area style="height: 200px" scrollbars="vertical">
        <div style="padding: 20px">
          <p>Long content here...</p>
        </div>
      </.scroll_area>

  ## Props

  - `size` - "1", "2", "3" (default: "1")
  - `type` - "auto", "always", "scroll", "hover" (default: "hover")
  - `scrollbars` - "vertical", "horizontal", "both" (default: "both")
  - `radius` - "none", "small", "medium", "large", "full"
  - `scroll_hide_delay` - Delay in ms before hiding scrollbars (default: 0, or 600 when `type` is `"scroll"`)
  """
  use Phoenix.Component

  import EssenceUI.Primitives.ScrollArea,
    only: [root: 1, viewport: 1, scrollbar: 1, thumb: 1, corner: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.RadiusProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require LayoutProps
  require MarginProps
  require PaddingProps
  require RadiusProps
  require WidthProps

  @sizes ["1", "2", "3"]
  @types ["auto", "always", "scroll", "hover"]
  @scrollbars ["vertical", "horizontal", "both"]

  @doc """
  ScrollArea root component.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "1"
  attr :type, :string, values: @types, default: "hover"
  attr :scrollbars, :string, values: @scrollbars, default: "both"
  attr :scroll_hide_delay, :integer, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  LayoutProps.attrs()
  MarginProps.attrs()
  RadiusProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def scroll_area(assigns) do
    prop_defs =
      %{}
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "scroll-area-#{System.unique_integer([:positive])}"

    # Align with Radix Themes: only `type="scroll"` uses a non-zero hide delay by default.
    scroll_hide_delay =
      cond do
        not is_nil(assigns[:scroll_hide_delay]) -> assigns.scroll_hide_delay
        assigns.type == "scroll" -> 600
        true -> 0
      end

    style =
      [extracted.style, assigns[:style]]
      |> Enum.reject(&(is_nil(&1) or &1 == ""))
      |> Enum.join("; ")

    class =
      ["est-ScrollAreaRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    scrollbar_class = "est-ScrollAreaScrollbar est-r-size-#{assigns.size}"

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: style,
        scrollbar_class: scrollbar_class,
        scroll_hide_delay: scroll_hide_delay,
        radius: assigns[:radius]
      )

    ~H"""
    <.root
      id={@id}
      type={@type}
      scroll_hide_delay={@scroll_hide_delay}
      class={@class}
      style={@style}
      {@rest}
    >
      <.viewport class="est-ScrollAreaViewport">
        {render_slot(@inner_block)}
      </.viewport>
      <div class="est-ScrollAreaViewportFocusRing"></div>

      <.scrollbar
        :if={@scrollbars != "vertical"}
        orientation="horizontal"
        class={@scrollbar_class}
        data-radius={@radius}
      >
        <.thumb class="est-ScrollAreaThumb" />
      </.scrollbar>
      <.scrollbar
        :if={@scrollbars != "horizontal"}
        orientation="vertical"
        class={@scrollbar_class}
        data-radius={@radius}
      >
        <.thumb class="est-ScrollAreaThumb" />
      </.scrollbar>
      <.corner :if={@scrollbars == "both"} class="est-ScrollAreaCorner" />
    </.root>
    """
  end
end
