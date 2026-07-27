defmodule EssenceUI.Components.Kbd do
  @moduledoc """
  Keyboard key label for shortcuts and key hints.
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps

  @size_values Enum.map(1..9, &Integer.to_string/1)

  @doc """
  Renders a keyboard key label.
  """
  attr :size, :string, values: @size_values, doc: "Kbd size (1-9). Responsive supported."
  attr :rest, :any, default: %{}, doc: "Additional HTML attributes."
  slot :inner_block, required: true

  def kbd(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, values: @size_values, class: "rt-r-size", responsive: true}
      }

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      ["rt-Kbd", extracted.class]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style]
      |> Enum.filter(& &1)
      |> Enum.join("; ")

    color = assigns[:color] || false

    assigns = assign(assigns, class: class, style: style, color: color)

    ~H"""
    <kbd class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </kbd>
    """
  end
end
