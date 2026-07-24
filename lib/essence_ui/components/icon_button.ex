defmodule EssenceUI.Components.IconButton do
  @moduledoc """
  Icon Button component 100% compatible with Radix UI Themes Icon Button API.
  See: https://www.radix-ui.com/themes/docs/components/icon-button
  """

  use Phoenix.Component

  import EssenceUI.Components.Flex

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.PaddingProps
  alias EssenceUI.SharedProps.RadiusProps

  require ColorProps
  require HighContrastProps
  require MarginProps
  require PaddingProps
  require RadiusProps

  @variants ["classic", "solid", "soft", "surface", "outline", "ghost"]
  @sizes ["1", "2", "3", "4"]

  @doc """
  Renders an icon button. All props match Radix UI Icon Button.

  ## Examples
      <.icon_button><Icons.plus /></.icon_button>
      <.icon_button variant="soft" color="crimson"><Icons.heart /></.icon_button>
      <.icon_button size="3" radius="full"><Icons.star /></.icon_button>

  ## Props
    * `variant` - Button style variant: solid, soft, outline, ghost. Default: soft.
    * `color` - Accent color. One of: gray, gold, bronze, brown, yellow, amber, orange, tomato, red, ruby, crimson, pink, plum, purple, violet, iris, indigo, blue, cyan, teal, jade, green, grass, lime, mint, sky.
    * `size` - Button size: 1, 2, 3, 4. Default: 2.
    * `radius` - Border radius: none, small, medium, large, full.
    * `high_contrast` - Increase color contrast.
    * `disabled` - Disabled state.
    * `loading` - Show loading spinner (not implemented, for API compatibility).
    * `as` - Render as: button, a, or any tag. Default: button.
    * `type` - Button type: button, submit, reset. Default: button.
    * `class` - Additional CSS classes.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes.
  """
  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  PaddingProps.attrs()
  RadiusProps.attrs()
  attr :as, :string, default: "button", values: ["button", "a"], doc: "Render as button or a tag."
  attr :variant, :string, values: @variants, default: "soft", doc: "Button style variant."
  attr :size, :string, values: @sizes, default: "2", doc: "Button size."
  attr :type, :string, values: ["button", "submit", "reset"], default: "button", doc: "Button type."
  attr :disabled, :boolean, default: false, doc: "Disabled state."
  attr :loading, :boolean, default: false, doc: "Show loading spinner (API only)."
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :global
  slot :inner_block, required: true

  def icon_button(assigns) do
    prop_defs =
      %{
        variant: %{type: :enum, values: @variants, class: "rt-variant", default: "soft"},
        size: %{type: :enum, values: @sizes, class: "rt-r-size"},
        loading: %{type: :boolean, class: "rt-loading"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(PaddingProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    tag = assigns[:as] || "button"
    type = if tag == "button", do: assigns[:type] || "button"

    class =
      [
        "rt-IconButton",
        "rt-BaseButton",
        "rt-reset",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        tag: tag,
        type: type,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        radius: assigns[:radius] || false,
        rest: assigns[:rest],
        props: %{
          disabled: assigns[:disabled] or assigns[:loading]
        }
      )

    ~H"""
    <.dynamic_tag
      tag_name={@tag}
      type={@type}
      class={@class}
      style={@style}
      data-disabled={@disabled or @loading}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
      {@props}
    >
      <%= if @loading do %>
        <.flex
          align="center"
          justify="center"
          gap="2"
          class="rt-ButtonLoading"
          position="absolute"
          width="100%"
        >
          <span class="rt-Spinner rt-r-size-2">
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
            <span class="rt-SpinnerLeaf"></span>
          </span>
        </.flex>
        <span style="position: absolute; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;">
          {render_slot(@inner_block)}
        </span>
        <span style="display: contents; visibility: hidden;" aria-hidden>
          {render_slot(@inner_block)}
        </span>
      <% else %>
        {render_slot(@inner_block)}
      <% end %>
    </.dynamic_tag>
    """
  end
end
