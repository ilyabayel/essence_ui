defmodule EssenceUI.Components.Callout do
  @moduledoc """
  Callout component for displaying informational messages with icons.

  ## Examples

      <.callout>
        <.callout_icon>
          <.lucide_info class="h-4 w-4" />
        </.callout_icon>
        <.callout_text>
          This is an important message.
        </.callout_text>
      </.callout>

      # With different variants and sizes
      <.callout variant="outline" size="3" color="red">
        <.callout_icon>
          <.lucide_alert_triangle class="h-5 w-5" />
        </.callout_icon>
        <.callout_text>
          This is a warning message.
        </.callout_text>
      </.callout>

  ## Props

    * `size` - The size of the callout. One of "1", "2", "3". Default: "2"
    * `variant` - The visual variant. One of "soft", "surface", "outline". Default: "soft"
    * `color` - The accent color. Any valid accent color. Default: "gray"
    * `high_contrast` - Whether to use high contrast colors. Default: false
    * `radius` - Border radius override. One of "none", "small", "medium", "large", "full"
    * `as_child` - When true, merges props into immediate child element
  """

  use Phoenix.Component

  alias EssenceUI.Components.Text
  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require MarginProps
  require RadiusProps

  @sizes ["1", "2", "3"]
  @variants ["soft", "surface", "outline"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()
  AsChildProps.attrs()
  RadiusProps.attrs()
  attr(:size, :string, values: @sizes, default: "2", doc: "Callout size")
  attr(:variant, :string, values: @variants, default: "soft", doc: "Callout variant")
  attr(:class, :string, default: nil, doc: "Additional CSS classes")
  attr(:style, :string, default: nil, doc: "Additional inline styles")
  attr(:rest, :global, include: ~w(id))
  slot(:icon, doc: "Icon for callout")
  slot(:text, required: true, doc: "Text content for callout")

  def callout(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "2"},
        variant: %{type: :enum, values: @variants, class: "rt-variant", default: "soft"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-CalloutRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false,
        radius: assigns[:radius] || false,
        high_contrast: assigns[:high_contrast] || false
      )

    ~H"""
    <div class={@class} style={@style} data-accent-color={@color} data-radius={@radius} {@rest}>
      <div
        :if={@icon != []}
        class="rt-CalloutIcon"
        style="display: flex; align-items: center; justify-content: center; height: 100%;"
      >
        {render_slot(@icon)}
      </div>
      <Text.text class="rt-CalloutText" size={@size}>
        {render_slot(@text)}
      </Text.text>
    </div>
    """
  end
end
