defmodule EssenceUI.Components.AspectRatio do
  @moduledoc """
  AspectRatio component compatible with Radix UI Themes AspectRatio API.

  Based on EssenceUI.Primitives.AspectRatio.
  See: https://www.radix-ui.com/themes/docs/components/aspect-ratio
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

    assigns =
      assign(assigns,
        ratio: ratio,
        class: ["rt-AspectRatio", assigns[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
      )

    ~H"""
    <AspectRatioPrimitive.aspect_ratio ratio={@ratio} class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </AspectRatioPrimitive.aspect_ratio>
    """
  end

  defp normalize_ratio(ratio) when is_float(ratio), do: ratio
  defp normalize_ratio(ratio) when is_integer(ratio), do: ratio * 1.0

  defp normalize_ratio(ratio) when is_binary(ratio) do
    if String.contains?(ratio, ":") do
      [w, h] =
        ratio
        |> String.split(":")
        |> Enum.map(fn part ->
          case Float.parse(part) do
            {float, _} -> float
            :error -> 1.0
          end
        end)

      w / h
    else
      case Float.parse(ratio) do
        {float, _} -> float
        :error -> 1.0
      end
    end
  end

  defp normalize_ratio(_), do: 1.0
end
