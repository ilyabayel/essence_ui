defmodule EssenceUI.Components.Text do
  @moduledoc """
  The Text component is a foundational text primitive.

  Based on Radix UI Themes Text component.
  """

  use Phoenix.Component

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
  attr :as, :string, default: "span", values: ["span", "div", "label", "p"]
  attr :size, :string, values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  attr :weight, :string, values: ["light", "regular", "medium", "bold"]
  attr :align, :string, values: ["left", "center", "right"]
  attr :trim, :string, values: ["normal", "start", "end", "both"]
  attr :truncate, :boolean, default: false
  attr :wrap, :string, values: ["wrap", "nowrap", "pretty", "balance"]
  attr :color, :string
  attr :high_contrast, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def text(assigns) do
    class =
      [
        "essence-text",
        assigns[:size] && "essence-text-size-#{assigns[:size]}",
        assigns[:weight] && "essence-text-weight-#{assigns[:weight]}",
        assigns[:align] && "essence-text-align-#{assigns[:align]}",
        assigns[:trim] && "essence-text-trim-#{assigns[:trim]}",
        assigns[:truncate] && "essence-text-truncate",
        assigns[:wrap] && "essence-text-wrap-#{assigns[:wrap]}",
        assigns[:color] && "essence-text-color-#{assigns[:color]}",
        assigns[:high_contrast] && "essence-text-high-contrast",
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, :class, class)

    case assigns.as do
      "span" ->
        ~H"""
        <span class={@class} {@rest}>
          {render_slot(@inner_block)}
        </span>
        """

      "div" ->
        ~H"""
        <div class={@class} {@rest}>
          {render_slot(@inner_block)}
        </div>
        """

      "label" ->
        ~H"""
        <label class={@class} {@rest}>
          {render_slot(@inner_block)}
        </label>
        """

      "p" ->
        ~H"""
        <p class={@class} {@rest}>
          {render_slot(@inner_block)}
        </p>
        """
    end
  end
end
