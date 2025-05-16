defmodule EssenceUI.SharedProps.PaddingProps do
  @moduledoc """
  Padding prop definitions for Box and other components.
  Inspired by Radix UI Themes.
  """

  def padding_prop_defs do
    %{
      p: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-p",
        custom_properties: ["--p"]
      },
      px: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-px",
        custom_properties: ["--pl", "--pr"]
      },
      py: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-py",
        custom_properties: ["--pt", "--pb"]
      },
      pt: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-pt",
        custom_properties: ["--pt"]
      },
      pr: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-pr",
        custom_properties: ["--pr"]
      },
      pb: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-pb",
        custom_properties: ["--pb"]
      },
      pl: %{
        type: [:enum, :string],
        values: padding_values(),
        responsive: true,
        class: "rt-r-pl",
        custom_properties: ["--pl"]
      }
    }
  end

  def padding_values do
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

  @doc """
  Generates padding attributes for components.
  """
  defmacro padding_attrs do
    quote do
      attr :p, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :px, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :py, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :pt, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :pr, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :pb, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
      attr :pl, :any, doc: "Padding utility class string or map. Example: `1` or `%{xs: '1', sm: '2'}`"
    end
  end
end
