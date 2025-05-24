defmodule EssenceUI.Components.Link do
  @moduledoc """
  Link component 100% compatible with Radix UI Themes Link API.
  See: https://www.radix-ui.com/themes/docs/components/link
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps

  require AsChildProps
  require ColorProps
  require HighContrastProps

  @underline_values ["auto", "always", "hover", "none"]

  @doc """
  Renders a link. All props match Radix UI Link.
  """
  attr :href, :string, default: nil, doc: "The link href. Only for <a> elements."
  attr :target, :string, default: nil, doc: "Target attribute for <a> elements."
  attr :rel, :string, default: nil, doc: "Rel attribute for <a> elements."
  attr :underline, :string, default: "auto", values: @underline_values, doc: "Underline style: auto, always, hover, none."
  ColorProps.attrs()
  HighContrastProps.attrs()
  AsChildProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes."
  attr :style, :string, default: nil, doc: "Additional inline styles."
  attr :rest, :global
  slot :inner_block, required: true

  def link(assigns) do
    prop_defs =
      %{
        underline: %{type: :enum, values: @underline_values, class: "rt-underline", default: "auto"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(AsChildProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-Link rt-reset rt-Text",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style = [extracted.style] |> Enum.filter(& &1) |> Enum.join("; ")
    color = assigns[:color] || ""

    assigns =
      assign(assigns,
        class: class,
        style: style,
        color: color
      )

    ~H"""
    <a
      href={@href}
      target={@target}
      rel={@rel}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block)}
    </a>
    """
  end
end
