defmodule EssenceUI.Utilities.Reset do
  @moduledoc """
  A component that resets the styles of its children.

  Based on Radix UI Themes Reset component.
  """
  use Phoenix.Component

  @doc """
  Resets the styles of the provided content.

  ## Examples

      <.reset>
        <button>Native Button</button>
      </.reset>

  ## Props

  - `class` - Additional CSS classes
  - `style` - Additional inline styles
  - `rest` - Additional HTML attributes
  """
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def reset(assigns) do
    ~H"""
    <div
      class={["rt-reset", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
