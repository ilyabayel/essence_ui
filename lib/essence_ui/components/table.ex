defmodule EssenceUI.Components.Table do
  @moduledoc """
  A semantic table component for presenting tabular data.

  Based on Radix UI Themes Table component with support for various sizes, variants,
  and layouts. The table provides proper semantic structure with separate header
  and body sections, and supports different types of cells.

  ## Examples

      <.table>
        <.table_header>
          <.table_row>
            <.table_column_header_cell>Name</.table_column_header_cell>
            <.table_column_header_cell>Email</.table_column_header_cell>
          </.table_row>
        </.table_header>
        <.table_body>
          <.table_row>
            <.table_row_header_cell>John Doe</.table_row_header_cell>
            <.table_cell>john@example.com</.table_cell>
          </.table_row>
        </.table_body>
      </.table>

  ## Props

  - `size` - Table size: "1", "2", "3" (default: "2")
  - `variant` - Table variant: "surface", "ghost" (default: "surface")
  - `layout` - Table layout: "auto", "fixed" (default: "auto")
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "ghost"]
  @layouts ["auto", "fixed"]

  MarginProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Table size from 1 to 3. Controls text size and cell padding."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface' or 'ghost'."

  attr :layout, :string,
    values: @layouts,
    default: "auto",
    doc: "Table layout algorithm. One of 'auto' or 'fixed'."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "Table content (header and body)."

  def table(assigns) do
    prop_defs =
      Map.merge(
        %{
          size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
          variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"},
          layout: %{type: :enum, class: "rt-r-layout", values: @layouts, default: "auto"}
        },
        MarginProps.prop_defs()
      )

    extracted = ExtractProps.call(assigns, prop_defs)

    # Build CSS classes for the wrapper div
    wrapper_class =
      [
        "rt-TableRoot",
        extracted.class,
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        wrapper_class: wrapper_class,
        style: extracted.style
      )

    ~H"""
    <div
      class={@wrapper_class}
      style={@style}
    >
      <table class="rt-TableRootTable" {@rest}>
        {render_slot(@inner_block)}
      </table>
    </div>
    """
  end

  slot :inner_block, required: true, doc: "Header cells content."

  def table_header(assigns) do
    ~H"""
    <thead class="rt-TableHeader">
      {render_slot(@inner_block)}
    </thead>
    """
  end

  slot :inner_block, required: true, doc: "Body rows content."

  def table_body(assigns) do
    ~H"""
    <tbody class="rt-TableBody">
      {render_slot(@inner_block)}
    </tbody>
    """
  end

  # Table Row Component
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "Row cells content."

  def table_row(assigns) do
    class =
      ["rt-TableRow", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <tr class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </tr>
    """
  end

  # Table Cell Component
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id colspan rowspan aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "Cell content."

  def table_cell(assigns) do
    class =
      ["rt-TableCell", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <td class={@class} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </td>
    """
  end

  # Table Column Header Cell Component
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id colspan rowspan aria-label aria-labelledby aria-describedby scope),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "Header cell content."

  def table_column_header_cell(assigns) do
    class =
      ["rt-TableCell rt-TableColumnHeaderCell", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <th class={@class} style={@style} scope="col" {@rest}>
      {render_slot(@inner_block)}
    </th>
    """
  end

  # Table Row Header Cell Component
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id colspan rowspan aria-label aria-labelledby aria-describedby scope),
    doc: "Global attributes and event handlers."

  slot :inner_block, required: true, doc: "Header cell content."

  def table_row_header_cell(assigns) do
    class =
      ["rt-TableCell rt-TableRowHeaderCell", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <th class={@class} style={@style} scope="row" {@rest}>
      {render_slot(@inner_block)}
    </th>
    """
  end
end
