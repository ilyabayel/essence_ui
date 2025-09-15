defmodule EssenceUI.Components.Spinner do
  @moduledoc """
  A Spinner component that displays a loading animation.

  Based on Radix UI Spinner component with support for various sizes
  and styling options.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]

  @doc """
  Renders a spinner component.

  ## Examples

      <.spinner />
      <.spinner size="2" />
      <.spinner size="3" class="text-blue-500" />

  ## Props

  - `size` - Spinner size: "1", "2", "3" (default: "2")
  - `loading` - Whether the spinner is actively loading (default: true)
  - Plus margin props (m, mx, my, mt, mr, mb, ml)
  """

  MarginProps.attrs()
  attr :size, :string, values: @sizes, default: "2", doc: "Spinner size"
  attr :loading, :boolean, default: true, doc: "Whether spinner is loading"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global

  def spinner(assigns) do
    prop_defs =
      Map.merge(%{size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "2"}}, MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class = ["rt-reset", "rt-Spinner", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    assigns = assign(assigns, class: class, style: extracted.style)

    ~H"""
    <span
      class={@class}
      style={@style}
      data-loading={@loading}
      {@rest}
    >
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
      <span class="rt-SpinnerLeaf"></span>
    </span>
    """
  end
end
