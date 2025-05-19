defmodule EssenceUI.SharedProps.GapProps do
  @moduledoc """
  Prop definitions for gap, column_gap, and row_gap utilities (for flex/grid layouts).
  Inspired by Radix UI Themes gap.props.ts.
  """

  @gap_values [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "-1",
    "-2",
    "-3",
    "-4",
    "-5",
    "-6",
    "-7",
    "-8",
    "-9"
  ]

  def prop_defs do
    %{
      # Sets the CSS **row-gap** property.
      # Supports space scale values, CSS strings, and responsive objects.
      #
      # @example
      # gap_y="4"
      # gap_y="20px"
      # gap_y={%{ sm: "2", lg: "3em" }}
      #
      # @link
      # https://developer.mozilla.org/en-US/docs/Web/CSS/row-gap
      gap: %{
        type: [:enum, :string],
        values: @gap_values,
        responsive: true,
        class: "rt-r-gap",
        custom_properties: ["--gap"]
      },
      # Sets the CSS **row-gap** property.
      # Supports space scale values, CSS strings, and responsive objects.
      #
      # @example
      # gap_y="4"
      # gap_y="20px"
      # gap_y={{ sm: '2', lg: '3em' }}
      #
      # @link
      # https://developer.mozilla.org/en-US/docs/Web/CSS/row-gap
      gap_x: %{
        type: [:enum, :string],
        values: @gap_values,
        responsive: true,
        class: "rt-r-cg",
        custom_properties: ["--column-gap"]
      },
      # Sets the CSS **column-gap** property.
      # Supports space scale values, CSS strings, and responsive objects.
      #
      # @example
      # gap_y="4"
      # gap_y="20px"
      # gap_y={{ sm: '2', lg: '3em' }}
      #
      # @link
      # https://developer.mozilla.org/en-US/docs/Web/CSS/column-gap
      gap_y: %{
        type: [:enum, :string],
        values: @gap_values,
        responsive: true,
        class: "rt-r-rg",
        custom_properties: ["--row-gap"]
      }
    }
  end

  def gap_values, do: @gap_values

  defmacro attrs do
    quote do
      attr :gap, :string, values: unquote(@gap_values), doc: "Gap utility class (0-9, -1 to -9)"
      attr :gap_y, :string, values: unquote(@gap_values), doc: "Column gap utility class (0-9, -1 to -9)"
      attr :gap_x, :string, values: unquote(@gap_values), doc: "Row gap utility class (0-9, -1 to -9)"
    end
  end
end
