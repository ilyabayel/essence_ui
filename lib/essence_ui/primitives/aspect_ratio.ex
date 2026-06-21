defmodule EssenceUI.Primitives.AspectRatio do
  @moduledoc false
  use EssenceUI.Primitives

  attr :ratio, :float, default: 1.0
  attr :rest, :global
  slot :inner_block, required: true

  def aspect_ratio(assigns) do
    ~H"""
    <div
      style={"position: relative; width: 100%; padding-bottom: #{100 / @ratio}%;"}
      data-radix-aspect-ratio-wrapper
    >
      <div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;" {@rest}>
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
