defmodule EssenceUI.SharedProps.MarginProps do
  @moduledoc """
  Margin prop definitions for Box and other components.
  Inspired by Radix UI Themes.
  """

  def margin_prop_defs do
    %{
      m: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-m",
        custom_properties: ["--m"]
      },
      mx: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-mx",
        custom_properties: ["--ml", "--mr"]
      },
      my: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-my",
        custom_properties: ["--mt", "--mb"]
      },
      mt: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-mt",
        custom_properties: ["--mt"]
      },
      mr: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-mr",
        custom_properties: ["--mr"]
      },
      mb: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-mb",
        custom_properties: ["--mb"]
      },
      ml: %{
        type: [:enum, :string],
        values: margin_values(),
        responsive: true,
        class: "rt-r-ml",
        custom_properties: ["--ml"]
      }
    }
  end

  def margin_values do
    [
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
  end

  defmacro margin_attrs do
    quote do
      attr :m, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :mx, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :my, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :mt, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :mr, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :mb, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :ml, :any, doc: "Margin utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
    end
  end
end
