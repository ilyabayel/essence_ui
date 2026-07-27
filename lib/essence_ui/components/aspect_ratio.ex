defmodule EssenceUI.Components.AspectRatio do
  @moduledoc """
  Themed aspect ratio wrapper that preserves layout proportions.
  Wraps `EssenceUI.Primitives.AspectRatio`.

  ## Examples

      <.aspect_ratio ratio={16/9}>
        <img src="..." />
      </.aspect_ratio>

  ## Props

    * `ratio` - The aspect ratio (float or string, e.g. 16/9 or "16:9"). Required.
    * `class` - Additional CSS classes.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
    * `inner_block` - Slot for children.
  """

  use Phoenix.Component

  alias EssenceUI.Primitives.AspectRatio, as: AspectRatioPrimitive

  attr :ratio, :any, required: true, doc: "Aspect ratio as float (e.g. 16/9) or string (e.g. \"16:9\")"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global, doc: "Additional attributes for the root element"
  slot :inner_block, required: true

  def aspect_ratio(assigns) do
    ratio = normalize_ratio(assigns[:ratio])

    assigns = assign(assigns, ratio: ratio)

    ~H"""
    <AspectRatioPrimitive.aspect_ratio ratio={@ratio} class={["rt-AspectRatio", @class]} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </AspectRatioPrimitive.aspect_ratio>
    """
  end

  defp normalize_ratio(ratio) when is_float(ratio), do: ratio
  defp normalize_ratio(ratio) when is_integer(ratio), do: ratio * 1.0

  defp normalize_ratio(ratio) when is_binary(ratio) do
    if String.contains?(ratio, ":") do
      [w, h] = ratio |> String.split(":") |> Enum.map(&parse_number/1)
      w / h
    else
      parse_number(ratio)
    end
  end

  defp normalize_ratio(_), do: 1.0

  defp parse_number(str) do
    case Float.parse(str) do
      {num, _} -> num
      :error -> 1.0
    end
  end
end
