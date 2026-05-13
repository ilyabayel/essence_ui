defmodule EssenceUI.Primitives.Label do
  @moduledoc false
  use EssenceUI.Primitives

  attr :for, :string
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label for={@for} {@rest}>
      {render_slot(@inner_block)}
    </label>
    """
  end
end
