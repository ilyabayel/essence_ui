defmodule EssenceUI.Primitives.VisuallyHidden do
  @moduledoc false

  use EssenceUI.Primitives

  attr :rest, :global
  slot :inner_block, required: true

  def visually_hidden(assigns) do
    ~H"""
    <span
      style="position: absolute; border: 0; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); white-space: nowrap; word-wrap: normal;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end
end
