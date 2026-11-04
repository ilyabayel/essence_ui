defmodule EssenceUI.Components.Section do
  @moduledoc """
  Themed section container with layout and spacing props.
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

  @sizes ["1", "2", "3", "4"]

  @doc """
  Section component.
  """
  LayoutProps.attrs()
  MarginProps.attrs()

  attr :size, :string,
    values: @sizes,
    doc: "Vertical padding size from 1 to 4. Maps to rt-r-size-*."

  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes"
  slot :inner_block, required: false

  def section(assigns) do
    prop_defs =
      %{size: %{type: :enum, values: @sizes, class: "rt-r-size"}}
      |> Map.merge(LayoutProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)
    class = ["rt-Section", extracted.class, assigns[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
    style = [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; ")

    assigns = assign(assigns, class: class, style: style)

    ~H"""
    <section class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </section>
    """
  end
end
