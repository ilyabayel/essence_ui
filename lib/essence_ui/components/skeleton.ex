defmodule EssenceUI.Components.Skeleton do
  @moduledoc """
  A loading placeholder component that replaces content with a same-shape placeholder.

  Based on Radix UI Themes Skeleton component for indicating loading states while
  maintaining layout consistency. The skeleton preserves the dimensions and structure
  of the content it replaces.

  ## Examples

      <.skeleton width="48px" height="48px" />

      <.skeleton>
        <.button>Loading button</.button>
      </.skeleton>

      <.skeleton loading={false}>
        <.text>Actual content</.text>
      </.skeleton>

      <.skeleton loading={@loading}>
        <.text>Dynamic loading state</.text>
      </.skeleton>

  ## Props

  - `loading` - Whether to show skeleton or content (default: true)
  - `width` - Explicit width (e.g., "100px", "50%")
  - `height` - Explicit height (e.g., "20px", "2rem")
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  MarginProps.attrs()

  attr :loading, :boolean,
    default: true,
    doc: "Whether to show skeleton placeholder or actual content."

  attr :width, :string,
    default: nil,
    doc: "Explicit width for the skeleton (e.g., '100px', '50%')."

  attr :height, :string,
    default: nil,
    doc: "Explicit height for the skeleton (e.g., '20px', '2rem')."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, doc: "Content to show when not loading, or to preserve dimensions when loading."

  def skeleton(assigns) do
    prop_defs = MarginProps.prop_defs()

    extracted = ExtractProps.call(assigns, prop_defs)

    # Build inline styles
    inline_styles =
      [
        if(assigns[:width], do: "width: #{assigns.width};"),
        if(assigns[:height], do: "height: #{assigns.height};"),
        assigns.style
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style,
        inline_styles: inline_styles
      )

    ~H"""
    <%= if @loading do %>
      <span
        class={["rt-Skeleton", @extracted_class, @class]}
        style={@extracted_style <> @inline_styles}
        {@rest}
      >
        <%= if @inner_block && @inner_block != [] do %>
          <span style="visibility: hidden;">
            {render_slot(@inner_block)}
          </span>
        <% end %>
      </span>
    <% else %>
      <%= if @inner_block && @inner_block != [] do %>
        {render_slot(@inner_block)}
      <% else %>
        <span
          class={[@extracted_class, @class]}
          style={@extracted_style <> @inline_styles}
          {@rest}
        >
        </span>
      <% end %>
    <% end %>
    """
  end
end
