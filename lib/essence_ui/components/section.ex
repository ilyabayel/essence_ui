defmodule EssenceUI.Components.Section do
  @moduledoc """
  Section component matching Radix UI Themes Section API and behavior.
  See: https://github.com/radix-ui/themes/blob/main/packages/radix-ui-themes/src/components/section.tsx
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.LayoutProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.WidthProps

  require AsChildProps
  require HeightProps
  require LayoutProps
  require MarginProps
  require PaddingProps
  require WidthProps

  @doc """
  Section component. All props match Radix UI Section.
  """
  LayoutProps.attrs()
  MarginProps.attrs()
  AsChildProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes"
  slot :inner_block, required: false

  def section(assigns) do
    prop_defs =
      LayoutProps.prop_defs()
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)
    class = ["rt-Section", extracted.class, assigns[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
    style = [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; ")

    assigns = assign(assigns, class: class, style: style, as_child: Map.get(assigns, :as_child, false))

    ~H"""
    <.dynamic_tag
      tag_name={if @as_child, do: "div", else: "section"}
      class={@class}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
