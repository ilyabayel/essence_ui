defmodule EssenceUI.Components.Popover do
  @moduledoc """
  A Popover component for displaying rich floating content, triggered by a button.

  Wraps `EssenceUI.Primitives.Popover` with Themes visual props.
  Based on Radix UI Themes Popover.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Popover, as: PopoverPrimitive
  alias EssenceUI.SharedProps.HeightProps
  alias EssenceUI.SharedProps.WidthProps

  require HeightProps
  require WidthProps

  @doc """
  Root container for popover. Wraps trigger and content.

  ## Examples

      <.popover_root>
        <.popover_trigger>
          <.button variant="soft">Comment</.button>
        </.popover_trigger>
        <.popover_content width="360px">
          <p>Popover content here</p>
          <.popover_close>
            <.button size="1">Submit</.button>
          </.popover_close>
        </.popover_content>
      </.popover_root>
  """
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
    assigns =
      assign(assigns, :id, assigns[:id] || "popover-#{System.unique_integer([:positive])}")

    ~H"""
    <PopoverPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      on_open_change={@on_open_change}
      modal={@modal}
      class={["est-PopoverRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: contents;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.root>
    """
  end

  @doc """
  The trigger area that opens the popover on click.
  Wraps the control (typically a button) that toggles the popover.
  """
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
      as="div"
      class={["est-PopoverTrigger", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.trigger>
    """
  end

  @sizes ["1", "2", "3", "4"]

  @doc """
  The popover content panel that appears on click.

  ## Props

  - `size` - Size of the content: "1", "2", "3", "4" (default: "2")
  - `side` - Placement side: "top", "bottom", "left", "right" (default: "bottom")
  - `align` - Alignment: "start", "center", "end" (default: "start")
  - Plus width/height props (max_width defaults to "480px" in Radix)
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :side, :string, values: ["top", "bottom", "left", "right"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :container, :string, default: "body"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  WidthProps.attrs()
  HeightProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def popover_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "est-r-size", values: @sizes, default: "2", responsive: true}
      }
      |> Map.merge(WidthProps.prop_defs())
      |> Map.merge(HeightProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id = assigns[:id] || "popover-content-#{System.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        id: id,
        portal_id: "#{id}-portal",
        class:
          [
            "essence-ui",
            "est-PopperContent",
            "est-PopoverContent",
            extracted.class,
            assigns.class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style: [extracted.style, assigns.style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")
      )

    ~H"""
    <PopoverPrimitive.portal id={@portal_id} target={@container}>
      <PopoverPrimitive.content
        id={@id}
        side={@side}
        align={@align}
        class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
        style={@style}
        {Map.delete(@rest, :class)}
      >
        {render_slot(@inner_block)}
      </PopoverPrimitive.content>
    </PopoverPrimitive.portal>
    """
  end

  @doc """
  Wraps the control that will close the popover.
  Typically wraps a button inside the popover content.
  """
  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def popover_close(assigns) do
    ~H"""
    <PopoverPrimitive.close
      id={@id}
      as="div"
      class={["est-PopoverClose", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      style="display: inline-flex;"
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </PopoverPrimitive.close>
    """
  end
end
