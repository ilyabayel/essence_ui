defmodule EssenceUI.Primitives.Slot do
  @moduledoc false

  use EssenceUI.Primitives

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
