defmodule EssenceUI.Components.DataList do
  @moduledoc """
  A component for displaying a list of key-value pairs.

  Based on Radix UI Themes DataList component.

  ## Examples

      <.data_list>
        <.data_list_item>
          <:label>Status</:label>
          <:value>
            <.badge color="green">Active</.badge>
          </:value>
        </.data_list_item>
        <.data_list_item>
          <:label>ID</:label>
          <:value>12345</:value>
        </.data_list_item>
      </.data_list>

  ## Props

  ### DataList
  - `size` - "1", "2", "3" (default: "2")
  - `orientation` - "horizontal", "vertical" (default: "horizontal")
  - `trim` - "normal", "start", "end", "both"
  - Plus margin props

  ### DataListItem
  - `align` - "start", "center", "end", "baseline", "stretch" (default: "baseline")
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]
  @orientations ["horizontal", "vertical"]
  @trims ["normal", "start", "end", "both"]
  @aligns ["start", "center", "end", "baseline", "stretch"]

  @doc """
  DataList root component.
  """
  attr :size, :string, values: @sizes, default: "2"
  attr :orientation, :string, values: @orientations, default: "horizontal"
  attr :trim, :string, values: @trims
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def data_list(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        orientation: %{
          type: :enum,
          class: "rt-r-orientation",
          values: @orientations,
          default: "horizontal",
          responsive: true
        },
        trim: %{type: :enum, class: "rt-r-trim", values: @trims, responsive: true}
      }
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <dl
      class={["rt-DataListRoot", @extracted_class, @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={[@extracted_style, @style] |> Enum.filter(& &1) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </dl>
    """
  end

  @doc """
  Individual item within DataList.
  """
  attr :align, :string, values: @aligns, default: "baseline"
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :label, required: true
  slot :value, required: true

  def data_list_item(assigns) do
    prop_defs = %{
      align: %{type: :enum, class: "rt-r-ai", values: @aligns, default: "baseline", responsive: true}
    }

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style
      )

    ~H"""
    <div
      class={["rt-DataListItem", @extracted_class, @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={[@extracted_style, @style] |> Enum.filter(& &1) |> Enum.join("; ")}
      {@rest}
    >
      <dt class="rt-DataListLabel">
        {render_slot(@label)}
      </dt>
      <dd class="rt-DataListValue">
        {render_slot(@value)}
      </dd>
    </div>
    """
  end
end
