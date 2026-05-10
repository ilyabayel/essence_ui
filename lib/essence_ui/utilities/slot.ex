defmodule EssenceUI.Utilities.Slot do
  @moduledoc """
  A component for prop composition.

  Based on Radix UI Slot primitive. In Elixir/Phoenix, this is implemented as a
  wrapper around `dynamic_tag` to allow for tag-based composition.

  ## Examples

      <.slot as="button" class="my-btn">
        Click me
      </.slot>
  """
  use Phoenix.Component

  @doc """
  Renders a slot with the specified tag and merged props.

  ## Props

  - `as` - The HTML tag to render (default: "div")
  - `class` - Additional CSS classes
  - `style` - Additional inline styles
  - `rest` - Additional HTML attributes
  """
  attr :as, :string, default: "div"
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def slot(assigns) do
    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
