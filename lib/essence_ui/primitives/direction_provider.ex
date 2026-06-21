defmodule EssenceUI.Primitives.DirectionProvider do
  @moduledoc false

  use EssenceUI.Primitives

  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :rest, :global
  slot :inner_block, required: true

  def direction_provider(assigns) do
    ~H"""
    <div dir={@dir} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
