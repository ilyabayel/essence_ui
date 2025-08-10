defmodule EssenceUI.Components.TextArea do
  @moduledoc """
  TextArea component compatible with Radix UI Themes Text Area API.
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"

  attr :name, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :readonly, :boolean, default: false
  attr :rows, :integer, default: nil
  attr :cols, :integer, default: nil
  attr :value, :string, default: nil

  # CSS resize on the root container to enable handle
  attr :resize, :string, values: ["none", "both", "horizontal", "vertical"], default: "none"

  attr :class, :string, default: nil
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required minlength maxlength aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  def text_area(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-reset",
        "rt-TextAreaRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    extra_style = if assigns[:resize] && assigns[:resize] != "none", do: "; resize: #{assigns[:resize]}", else: ""

    assigns =
      assign(assigns,
        class: class,
        style: (extracted.style || "") <> extra_style,
        color: assigns[:color] || false
      )

    ~H"""
    <div class={@class} style={@style} data-accent-color={@color} {@rest}>
      <textarea
        name={@name}
        placeholder={@placeholder}
        class="rt-TextAreaInput rt-reset"
        disabled={@disabled}
        readonly={@readonly}
        rows={@rows}
        cols={@cols}
      ><%= @value %></textarea>
    </div>
    """
  end
end
