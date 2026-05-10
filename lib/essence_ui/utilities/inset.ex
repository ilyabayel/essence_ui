defmodule EssenceUI.Utilities.Inset do
  @moduledoc """
  A utility for applying negative margins to elements so they "bleed" into their container.

  Based on Radix UI Themes Inset component. Commonly used within `Card` or `Dialog` components.

  ## Examples

      <.card>
        <.inset side="top" clip="border-box">
          <img src="..." />
        </.inset>
        <.text>Card content</.text>
      </.card>

  ## Props

  - `side` - "top", "bottom", "left", "right", "x", "y", "all" (default: "all")
  - `clip` - "border-box", "padding-box" (default: "border-box")
  - Plus margin props
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sides ["top", "bottom", "left", "right", "x", "y", "all"]
  @clips ["border-box", "padding-box"]

  @doc """
  Renders an inset utility container.
  """
  attr :side, :string, values: @sides, default: "all"
  attr :clip, :string, values: @clips, default: "border-box"
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def inset(assigns) do
    prop_defs =
      Map.merge(
        %{
          side: %{type: :enum, class: "rt-r-side", values: @sides, default: "all", responsive: true},
          clip: %{type: :enum, class: "rt-r-clip", values: @clips, default: "border-box", responsive: true}
        },
        MarginProps.prop_defs()
      )

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <div
      class={["rt-Inset", @extracted_class, @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={[@extracted_style, @style] |> Enum.filter(& &1) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
