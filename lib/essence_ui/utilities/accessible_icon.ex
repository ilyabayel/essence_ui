defmodule EssenceUI.Utilities.AccessibleIcon do
  @moduledoc """
  A wrapper for icons that provides a label for screen readers.

  Based on Radix UI AccessibleIcon primitive.
  """
  use Phoenix.Component

  import EssenceUI.Utilities.VisuallyHidden

  @doc """
  Renders an icon with a hidden label for screen readers.

  ## Examples

      <.accessible_icon label="Edit">
        <svg>...</svg>
      </.accessible_icon>

  ## Props

  - `label` - The label for screen readers (required)
  """
  attr :label, :string, required: true
  slot :inner_block, required: true

  def accessible_icon(assigns) do
    ~H"""
    {render_slot(@inner_block)}
    <.visually_hidden>
      {@label}
    </.visually_hidden>
    """
  end
end
