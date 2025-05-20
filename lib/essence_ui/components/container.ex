defmodule EssenceUI.Components.Container do
  @moduledoc """
  The Container component is a layout primitive for constraining content width and centering content.

  Based on Radix UI Themes Container component.

  ## Examples

      <.container size="2">
        <p>Content goes here</p>
      </.container>

  ## Props

    * `as` - The element to render. Defaults to "div". Accepts: "div".
    * `as_child` - Composes the component into its immediate child instead of rendering its own HTML element.
    * `size` - Controls the max-width of the content. Accepts: "1" (448px), "2" (688px), "3" (880px), "4" (1136px). Responsive supported. Defaults to "4".
    * `display` - Controls whether the container is visible or hidden. Accepts: "none", "initial". Responsive supported.
    * `align` - Controls the alignment of the content. Accepts: "left", "center", "right". Responsive supported.
    * `width`, `min_width`, `max_width` - Width utilities. Responsive supported.
    * `height`, `min_height`, `max_height` - Height utilities. Responsive supported.
    * `m`, `mt`, `mr`, `mb`, `ml`, `mx`, `my` - Margin utilities (theme scale). Responsive supported.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
    * `inner_block` - Slot for container children.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.WidthProps

  require AsChildProps
  require HeightProps
  require MarginProps
  require WidthProps

  @as_values ["div"]
  @size_values ["1", "2", "3", "4"]
  @display_values ["none", "initial"]
  @align_values ["left", "center", "right"]

  MarginProps.attrs()
  AsChildProps.attrs()
  WidthProps.attrs()
  HeightProps.attrs()

  attr :as, :string, default: "div", values: @as_values

  attr :size, :string,
    values: @size_values,
    default: "4",
    doc: "Controls the max-width of the content. Responsive supported."

  attr :display, :string,
    values: @display_values,
    doc: "Controls whether the container is visible or hidden. Responsive supported."

  attr :align, :string, values: @align_values, doc: "Controls the alignment of the content. Responsive supported."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  @doc false
  def container(assigns) do
    container_prop_defs = %{
      size: %{type: :enum, values: @size_values, class: "rt-r-size", responsive: true, default: "4"},
      display: %{type: :enum, values: @display_values, class: "rt-r-display", responsive: true},
      align: %{type: :enum, values: @align_values, class: "rt-r-ai", responsive: true}
    }

    prop_defs =
      container_prop_defs
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(WidthProps.prop_defs())
      |> Map.merge(HeightProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-Container", extracted[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
    assigns = assign(assigns, class: class, style: extracted[:style])

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} {@rest}>
      <div class="rt-ContainerInner">
        {render_slot(@inner_block)}
      </div>
    </.dynamic_tag>
    """
  end
end
