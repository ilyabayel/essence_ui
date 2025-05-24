defmodule EssenceUI.Components.Text do
  @moduledoc """
  The Text component is a foundational text primitive.

  Based on Radix UI Themes Text component.
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.LeadingTrimProps
  alias EssenceUI.SharedProps.TextAlignProps
  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps
  alias EssenceUI.SharedProps.WeightProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require LeadingTrimProps
  require TextAlignProps
  require TextWrapProps
  require TruncateProps
  require WeightProps

  @doc """
  Renders a text component.

  ## Examples

      <.text>The quick brown fox jumps over the lazy dog.</.text>
      <.text as="p" size="3" weight="medium" color="indigo">Custom text</.text>
      <.text as="label" trim="both" truncate={true}>Truncated text</.text>

  ## Props

    * `as` - The element to render. Can be `"span"`, `"div"`, `"label"`, or `"p"`. Defaults to `"span"`.
    * `size` - Text size from `1` to `9`. Controls font size, line height, and letter spacing. Can be a string or a responsive map.
    * `weight` - Font weight: one of `"light"`, `"regular"`, `"medium"`, or `"bold"`.
    * `align` - Text alignment: one of `"left"`, `"center"`, or `"right"`.
    * `trim` - Trim leading space: one of `"normal"`, `"start"`, `"end"`, or `"both"`.
    * `truncate` - Whether to truncate text with ellipsis when it overflows.
    * `wrap` - Text wrapping: one of `"wrap"`, `"nowrap"`, `"pretty"`, or `"balance"`.
    * `color` - The text color. One of: `gray`, `gold`, `bronze`, `brown`, `yellow`, `amber`, `orange`, `tomato`, `red`, `ruby`, `crimson`, `pink`, `plum`, `purple`, `violet`, `iris`, `indigo`, `blue`, `cyan`, `teal`, `jade`, `green`, `grass`, `lime`, `mint`, `sky`.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `as_child` - Composes the component into its immediate child instead of rendering its own HTML element.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes to add to the element.
  """
  ColorProps.attrs()
  TextAlignProps.attrs()
  LeadingTrimProps.attrs()
  TextWrapProps.attrs()
  TruncateProps.attrs()
  WeightProps.attrs()
  AsChildProps.attrs()
  HighContrastProps.attrs()

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
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(WeightProps.prop_defs())
      |> Map.merge(TextAlignProps.prop_defs())
      |> Map.merge(LeadingTrimProps.prop_defs())
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class = ["rt-Text", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns = assign(assigns, class: class, color: assigns[:color] || false)

    ~H"""
    <.dynamic_tag tag_name={@as} class={@class} style={@style} data-accent-color={@color} {@rest}>
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end
end
