defmodule EssenceUI.Components.TextField do
  @moduledoc """
  TextField component compatible with Radix UI Themes Text Field API.

  Supports size, variant, accent color, disabled/read-only states, and optional left/right slots.
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

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "TextField size from 1 to 3. Controls height and paddings."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :type, :string,
    values: [
      "text",
      "email",
      "password",
      "search",
      "number",
      "date",
      "datetime-local",
      "time",
      "week",
      "month",
      "url",
      "tel"
    ],
    default: "text",
    doc: "Native input type."

  attr :value, :string, default: nil
  attr :name, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :readonly, :boolean, default: false
  attr :autocomplete, :string, default: nil
  attr :autofocus, :boolean, default: false
  attr :inputmode, :string, default: nil

  attr :class, :string, default: nil
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required minlength maxlength min max step pattern aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :slot, doc: "Optional adornment slot. Use :side => 'left' or 'right'.", do: [
         attr(:side, :string, values: ["left", "right"]) 
       ]

  def text_field(assigns) do
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
        "rt-TextFieldRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        color: assigns[:color] || false
      )

    ~H"""
    <div class={@class} style={@style} data-accent-color={@color} {@rest}>
      <input
        type={@type}
        name={@name}
        value={@value}
        placeholder={@placeholder}
        class={"rt-TextFieldInput rt-reset"}
        disabled={@disabled}
        readonly={@readonly}
        autocomplete={@autocomplete}
        autofocus={@autofocus}
        inputmode={@inputmode}
      />
      <%= for slot <- @slot do %>
        <span class="rt-TextFieldSlot" data-side={if slot[:side] == "right", do: "right", else: nil}>
          <%= render_slot(slot) %>
        </span>
      <% end %>
    </div>
    """
  end
end


