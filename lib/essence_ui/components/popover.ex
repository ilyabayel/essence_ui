defmodule EssenceUI.Components.Popover do
  @moduledoc """
  A Popover component for displaying rich floating content, triggered by a button.

  Based on Radix UI Popover component. Opens on click with support for
  positioning, sizing, close button, and click-outside dismissal.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
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
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  slot :inner_block, required: true

  def popover_root(assigns) do
    assigns = assign_new(assigns, :id, fn -> "popover-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div
      id={@id}
      class={["rt-PopoverRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={
        ["display: inline-block; position: relative;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      phx-hook="Popover"
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The trigger area that opens the popover on click.
  Wraps the control (typically a button) that toggles the popover.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def popover_trigger(assigns) do
    ~H"""
    <div
      class={["rt-PopoverTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      data-popover-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
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

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <div
      class={
        ["rt-PopperContent", "rt-PopoverContent", @extracted_class, @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={
        ["display: none; position: fixed; z-index: 9999;", @extracted_style, @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      data-popover-content
      data-side={@side}
      data-align={@align}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Wraps the control that will close the popover.
  Typically wraps a button inside the popover content.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def popover_close(assigns) do
    ~H"""
    <div
      class={["rt-PopoverClose", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style="display: inline-flex;"
      data-popover-close
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
