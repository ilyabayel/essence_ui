defmodule EssenceUI.Components.Text do
  @moduledoc """
  The Text component is a foundational text primitive.

  Based on Radix UI Themes Text component.
  """

  use Phoenix.Component

  import EssenceUI.SharedProps.ColorProps

  @doc """
  Renders a text component.

  ## Examples

      <.text>The quick brown fox jumps over the lazy dog.</.text>
      <.text as="p" size="3" weight="medium" color="indigo">Custom text</.text>
      <.text as="label" trim="both" truncate={true}>Truncated text</.text>

  ## Props

    * `as` - The element to render. Can be "span", "div", "label", or "p". Defaults to "span".
    * `size` - Text size from "1" to "9". Controls font size, line height, and letter spacing.
    * `weight` - Font weight: "light", "regular", "medium", or "bold".
    * `align` - Text alignment: "left", "center", or "right".
    * `trim` - Trim leading space: "normal", "start", "end", or "both".
    * `truncate` - Whether to truncate text with ellipsis when it overflows.
    * `wrap` - Text wrapping: "wrap", "nowrap", "pretty", or "balance".
    * `color` - The text color.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `class` - Additional CSS classes to add to the element.
    * `rest` - Additional HTML attributes to add to the element.
  """
  color_attrs()
  attr :as, :string, default: "span", values: ["span", "div", "label", "p"]
  attr :size, :string, values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  attr :weight, :string, values: ["light", "regular", "medium", "bold"]
  attr :align, :string, values: ["left", "center", "right"]
  attr :trim, :string, values: ["normal", "start", "end", "both"]
  attr :truncate, :boolean, default: false
  attr :wrap, :string, values: ["wrap", "nowrap", "pretty", "balance"]
  attr :high_contrast, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def text(assigns) do
    dbg(assigns)

    class =
      [
        "rt-Text",
        assigns[:size] && "rt-r-size-#{assigns[:size]}",
        assigns[:weight] && "rt-r-weight-#{assigns[:weight]}",
        assigns[:align] && "rt-r-ta-#{assigns[:align]}",
        assigns[:trim] && "rt-r-lt-#{assigns[:trim]}",
        assigns[:truncate] && "rt-truncate",
        assigns[:wrap] && "rt-r-tw-#{assigns[:wrap]}",
        assigns[:high_contrast] && "rt-high-contrast",
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    extra_attrs = if assigns[:color], do: %{"data-accent-color" => assigns[:color]}, else: %{}
    assigns = assign(assigns, :class, class)
    assigns = assign(assigns, :extra_attrs, extra_attrs)

    case assigns.as do
      "span" ->
        ~H"""
        <span class={@class} {@extra_attrs} {@rest}>
          {render_slot(@inner_block)}
        </span>
        """

      "div" ->
        ~H"""
        <div class={@class} {@extra_attrs} {@rest}>
          {render_slot(@inner_block)}
        </div>
        """

      "label" ->
        ~H"""
        <label class={@class} {@extra_attrs} {@rest}>
          {render_slot(@inner_block)}
        </label>
        """

      "p" ->
        ~H"""
        <p class={@class} {@extra_attrs} {@rest}>
          {render_slot(@inner_block)}
        </p>
        """
    end
  end
end
