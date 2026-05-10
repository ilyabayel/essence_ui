defmodule EssenceUI.Utilities.VisuallyHidden do
  @moduledoc """
  Hides content from the screen but keeps it accessible to screen readers.

  Based on Radix UI VisuallyHidden primitive.
  """
  use Phoenix.Component

  @doc """
  Renders content that is visually hidden but remains accessible to screen readers.

  ## Examples

      <.visually_hidden>
        Screen reader only text
      </.visually_hidden>

  ## Props

  - `class` - Additional CSS classes
  - `style` - Additional inline styles
  - `rest` - Additional HTML attributes
  """
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def visually_hidden(assigns) do
    ~H"""
    <span
      class={@class}
      style={styles(@style)}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  defp styles(style) do
    """
    position: absolute;
    border: 0;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    word-wrap: normal;
    #{style}
    """
  end
end
