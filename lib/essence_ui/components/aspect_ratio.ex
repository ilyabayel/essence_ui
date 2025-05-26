defmodule EssenceUI.Components.AspectRatio do
  @moduledoc """
  AspectRatio component 100% compatible with Radix UI Themes AspectRatio API.
  See: https://www.radix-ui.com/primitives/docs/components/aspect-ratio

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

  attr :ratio, :any, required: true, doc: "Aspect ratio as float (e.g. 16/9) or string (e.g. \"16:9\")"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global, doc: "Additional attributes for the root element"
  slot :inner_block, required: true

  def aspect_ratio(assigns) do
    ratio =
      cond do
        is_float(assigns[:ratio]) ->
          assigns[:ratio]

        is_integer(assigns[:ratio]) ->
          assigns[:ratio] * 1.0

        is_binary(assigns[:ratio]) && String.contains?(assigns[:ratio], ":") ->
          [w, h] = assigns[:ratio] |> String.split(":") |> Enum.map(&String.to_float/1)
          w / h

        is_binary(assigns[:ratio]) ->
          String.to_float(assigns[:ratio])

        true ->
          1.0
      end

    style =
      [
        "position: relative; width: 100%; padding-bottom: #{100 / ratio}%;",
        assigns[:style]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns, style: style)

    ~H"""
    <div class={["rt-AspectRatio", @class]} style={@style} {@rest}>
      <div class="rt-AspectRatioInner" style="position: absolute; inset: 0;">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
