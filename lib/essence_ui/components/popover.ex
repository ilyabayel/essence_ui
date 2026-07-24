defmodule EssenceUI.Components.Popover do
  @moduledoc """
  Popover component compatible with Radix UI Themes Popover API.

  Based on EssenceUI.Primitives.Popover.
  See: https://www.radix-ui.com/themes/docs/components/popover
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Popover, as: PopoverPrimitive
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require WidthProps

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :modal, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def popover_root(assigns) do
    id =
      assigns[:id] ||
        "popover-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    assigns = assign(assigns, id: id)

    ~H"""
    <PopoverPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      on_open_change={@on_open_change}
      modal={@modal}
      class={["rt-PopoverRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def popover_trigger(assigns) do
    ~H"""
    <PopoverPrimitive.trigger
      id={@id}
      content_id={@content_id}
      as_child
      class={["rt-PopoverTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.trigger>
    """
  end

  @sizes ["1", "2", "3", "4"]

  attr :id, :string, default: nil
  attr :target, :string, default: "body"
  attr :size, :string, values: @sizes, default: "2"
  attr :side, :string, values: ["top", "bottom", "left", "right"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  WidthProps.attrs()
  HeightProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def popover_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true}
      }
      |> Map.merge(WidthProps.prop_defs())
      |> Map.merge(HeightProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id =
      assigns[:id] ||
        "popover-content-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class =
      ["rt-PopperContent", "rt-PopoverContent", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style]]
      |> Enum.filter(&(&1 != "" and &1))
      |> Enum.join("; ")

    assigns =
      assign(assigns,
        id: id,
        portal_id: "#{id}-portal",
        class: class,
        style: style
      )

    ~H"""
    <PopoverPrimitive.portal id={@portal_id} target={@target}>
      <PopoverPrimitive.content
        id={@id}
        side={@side}
        align={@align}
        side_offset={8}
        class={@class}
        style={@style}
        {@rest}
      >
        {render_slot(@inner_block)}
      </PopoverPrimitive.content>
    </PopoverPrimitive.portal>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def popover_close(assigns) do
    ~H"""
    <PopoverPrimitive.close
      id={@id}
      as_child
      class={["rt-PopoverClose", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style="display: inline-flex;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.close>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def popover_anchor(assigns) do
    ~H"""
    <PopoverPrimitive.anchor id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </PopoverPrimitive.anchor>
    """
  end
end
