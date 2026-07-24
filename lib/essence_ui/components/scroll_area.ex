defmodule EssenceUI.Components.ScrollArea do
  @moduledoc """
  A component for custom scrollbars.

  Based on EssenceUI.Primitives.ScrollArea / Radix UI Themes ScrollArea.
  """
  use Phoenix.Component

  import EssenceUI.Primitives.ScrollArea,
    only: [root: 1, viewport: 1, scrollbar: 1, thumb: 1, corner: 1]

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
  @scrollbars ["vertical", "horizontal", "both"]

  @doc """
  ScrollArea root component.

  ## Props

  - `size` - "1", "2", "3" (default: "1")
  - `type` - "auto", "always", "scroll", "hover" (default: "hover")
  - `scroll_hide_delay` - Delay in ms before hiding scrollbars (default: 600)
  - `scrollbars` - Which scrollbars to show: "vertical", "horizontal", "both" (default: "both")
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "1"
  attr :type, :string, values: @types, default: "hover"
  attr :scroll_hide_delay, :integer, default: 600
  attr :scrollbars, :string, values: @scrollbars, default: "both"
  attr :radius, :string, default: nil
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

    id =
      assigns[:id] ||
        "scroll-area-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class =
      ["rt-ScrollAreaRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style]]
      |> Enum.filter(& &1)
      |> Enum.join("; ")

    scrollbar_class =
      ["rt-ScrollAreaScrollbar", "rt-r-size-#{assigns.size}"]
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: style,
        scrollbar_class: scrollbar_class
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
      <.viewport class="rt-ScrollAreaViewport">
        {render_slot(@inner_block)}
      </.viewport>
      <div class="rt-ScrollAreaViewportFocusRing"></div>

      <.scrollbar
        :if={@scrollbars in ["horizontal", "both"]}
        orientation="horizontal"
        class={@scrollbar_class}
        data-radius={@radius}
      >
        <.thumb class="rt-ScrollAreaThumb" />
      </.scrollbar>

      <.scrollbar
        :if={@scrollbars in ["vertical", "both"]}
        orientation="vertical"
        class={@scrollbar_class}
        data-radius={@radius}
      >
        <.thumb class="rt-ScrollAreaThumb" />
      </.scrollbar>

      <.corner :if={@scrollbars == "both"} class="rt-ScrollAreaCorner" />
    </.root>
    """
  end
end
