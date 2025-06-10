defmodule EssenceUI.Components.Card do
  @moduledoc """
  A Card component that groups related content and actions.

  Based on Radix UI Themes Card component with support for various sizes, variants,
  and styling options. Cards are container elements that provide visual separation
  and hierarchy for content sections.

  ## Examples

      <.card>
        <p>Simple card content</p>
      </.card>

      <.card size="3" variant="classic">
        <h3>Card Title</h3>
        <p>Card content with classic styling</p>
      </.card>

      <.card variant="ghost" m="4">
        <p>Ghost card with margin</p>
      </.card>

      <.card as_child>
        <a href="/profile">
          <p>Interactive card as link</p>
        </a>
      </.card>

  ## Props

  - `size` - Card size: "1", "2", "3", "4", "5" (default: "1")
  - `variant` - Card variant: "surface", "classic", "ghost" (default: "surface")
  - `as_child` - When true, merges props into immediate child element (default: false)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.MarginProps

  require AsChildProps
  require MarginProps

  @sizes ["1", "2", "3", "4", "5"]
  @variants ["surface", "classic", "ghost"]

  MarginProps.attrs()
  AsChildProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "1",
    doc: "Card size from 1 to 5. Controls padding and border radius."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'ghost'."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def card(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          class: "rt-r-size",
          values: @sizes,
          default: "1",
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "rt-variant",
          values: @variants,
          default: "surface"
        }
      }
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-reset", "rt-BaseCard", "rt-Card", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns = assign(assigns, class: class, style: extracted.style)

    ~H"""
    <div class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
