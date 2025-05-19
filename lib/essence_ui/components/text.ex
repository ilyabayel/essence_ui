defmodule EssenceUI.Components.Text do
  @moduledoc """
  The Text component is a foundational text primitive.

  Based on Radix UI Themes Text component.
  """

  use Phoenix.Component

  import EssenceUI.SharedProps.AsChildProps
  import EssenceUI.SharedProps.ColorProps
  import EssenceUI.SharedProps.HighContrastProps
  import EssenceUI.SharedProps.LeadingTrimProps
  import EssenceUI.SharedProps.TextAlignProps
  import EssenceUI.SharedProps.TextWrapProps
  import EssenceUI.SharedProps.TruncateProps
  import EssenceUI.SharedProps.WeightProps

  @doc """
  Renders a text component.

  ## Examples

      <.text>The quick brown fox jumps over the lazy dog.</.text>
      <.text as="p" size="3" weight="medium" color="indigo">Custom text</.text>
      <.text as="label" trim="both" truncate={true}>Truncated text</.text>

  ## Props

    * `as` - The element to render. Can be `span`, `div`, `label`, or `p`. Defaults to `span`.
    * `size` - Text size from `1` to `9`. Controls font size, line height, and letter spacing.
    * `weight` - Font weight: `light`, `regular`, `medium`, or `bold`.
    * `align` - Text alignment: `left`, `center`, or `right`.
    * `trim` - Trim leading space: `normal`, `start`, `end`, or `both`.
    * `truncate` - Whether to truncate text with ellipsis when it overflows.
    * `wrap` - Text wrapping: `wrap`, `nowrap`, `pretty`, or `balance`.
    * `color` - The text color.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `class` - Additional CSS classes to add to the element.
    * `rest` - Additional HTML attributes to add to the element.
  """
  # Remove macro calls, use explicit attr definitions for all props
  color_attrs()
  text_align_attrs()
  leading_trim_attrs()
  text_wrap_attrs()
  truncate_attrs()
  weight_attrs()
  as_child_attrs()
  high_contrast_attrs()

  attr :size, :any,
    doc:
      ~s(Text size from 1 to 9. Controls font size, line height, and letter spacing. Can be "1" or %{xs: "1", sm: "2", md: "3", lg: "4", xl: "5"}. Defaults to 1.)

  attr :as, :string,
    values: ["span", "div", "label", "p"],
    default: "span",
    doc: "The element to render. Can be 'span', 'div', 'label', or 'p'. Defaults to 'span'."

  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def text(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"], responsive: true}
      }
      |> Map.merge(as_child_prop_defs())
      |> Map.merge(weight_prop_def())
      |> Map.merge(text_align_prop_def())
      |> Map.merge(leading_trim_prop_def())
      |> Map.merge(truncate_prop_def())
      |> Map.merge(text_wrap_prop_def())
      |> Map.merge(high_contrast_prop_def())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class = ["rt-Text", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns = assign(assigns, class: class, color: assigns[:color] || "")

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} data-accent-color={@color} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
