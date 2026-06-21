defmodule EssenceUI.Primitives.AccessibleIcon do
  @moduledoc false

  use EssenceUI.Primitives

  attr :label, :string, required: true
  slot :inner_block, required: true

  def accessible_icon(assigns) do
    ~H"""
    <span aria-hidden="true" focusable="false">{render_slot(@inner_block)}</span>
    <EssenceUI.Primitives.VisuallyHidden.visually_hidden>
      {@label}
    </EssenceUI.Primitives.VisuallyHidden.visually_hidden>
    """
  end
end
