defmodule EssenceUI.Components.Code do
  @moduledoc """
  The Code component marks text to signify a short fragment of computer code.

  Based on Radix UI Themes Code component.
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.TextWrapProps
  alias EssenceUI.SharedProps.TruncateProps
  alias EssenceUI.SharedProps.WeightProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require TextWrapProps
  require TruncateProps
  require WeightProps

  @doc """
  Renders a code component.

  ## Examples

      <.code>IO.inspect()</.code>
      <.code size="4" variant="solid" color="indigo">terminal.start()</.code>
      <.code weight="bold" truncate={true}>const veryLongSyntaxExample = "truncated"</.code>

  ## Props

    * `as_child` - Composes the component into its immediate child instead of rendering its own HTML element.
    * `size` - Code size from `1` to `9`. Controls font size, line height, and letter spacing. Can be a string or a responsive map.
    * `variant` - Visual style variant. One of `"solid"`, `"soft"`, `"outline"`, or `"ghost"`. Defaults to `"soft"`.
    * `weight` - Font weight: one of `"light"`, `"regular"`, `"medium"`, or `"bold"`.
    * `color` - The code color. One of: `gray`, `gold`, `bronze`, `brown`, `yellow`, `amber`, `orange`, `tomato`, `red`, `ruby`, `crimson`, `pink`, `plum`, `purple`, `violet`, `iris`, `indigo`, `blue`, `cyan`, `teal`, `jade`, `green`, `grass`, `lime`, `mint`, `sky`.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `truncate` - Whether to truncate text with ellipsis when it overflows.
    * `wrap` - Text wrapping: one of `"wrap"`, `"nowrap"`, `"pretty"`, or `"balance"`.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes to add to the element.
  """

  ColorProps.attrs()
  HighContrastProps.attrs()
  TruncateProps.attrs()
  TextWrapProps.attrs()
  WeightProps.attrs()
  AsChildProps.attrs()

  attr :size, :any,
    doc:
      ~s(Code size from 1 to 9. Controls font size, line height, and letter spacing. Can be "1" or %{xs: "1", sm: "2", md: "3", lg: "4", xl: "5"}.)

  attr :variant, :string,
    values: ["solid", "soft", "outline", "ghost"],
    default: "soft",
    doc: "Visual style variant. One of 'solid', 'soft', 'outline', or 'ghost'. Defaults to 'soft'."

  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def code(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          class: "rt-r-size",
          values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "rt-variant",
          values: ["solid", "soft", "outline", "ghost"],
          default: "soft"
        }
      }
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(WeightProps.prop_defs())
      |> Map.merge(TruncateProps.prop_defs())
      |> Map.merge(TextWrapProps.prop_defs())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    # Code ghost color prop should work as text color by default
    color =
      if assigns[:variant] == "ghost" do
        assigns[:color] || false
      else
        assigns[:color]
      end

    class = ["rt-Code", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns = assign(assigns, class: class, color: color || false)

    ~H"""
    <code class={@class} style={@style} data-accent-color={@color} {@rest} phx-no-format>{render_slot(@inner_block)}</code>
    """
  end
end
