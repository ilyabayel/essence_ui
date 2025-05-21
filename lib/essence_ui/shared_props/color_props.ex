defmodule EssenceUI.SharedProps.ColorProps do
  @moduledoc """
  Color prop definitions for Box and other components.
  Inspired by Radix UI Themes and Radix Colors.
  """

  @accent_colors [
    "gray",
    "gold",
    "bronze",
    "brown",
    "yellow",
    "amber",
    "orange",
    "tomato",
    "red",
    "ruby",
    "crimson",
    "pink",
    "plum",
    "purple",
    "violet",
    "iris",
    "indigo",
    "blue",
    "cyan",
    "teal",
    "jade",
    "green",
    "grass",
    "lime",
    "mint",
    "sky"
  ]

  @gray_colors [
    "auto",
    "gray",
    "mauve",
    "slate",
    "sage",
    "olive",
    "sand"
  ]

  def color_prop_def do
    %{
      color: %{
        type: [:enum, :string],
        values: @accent_colors,
        responsive: false,
        class: "rt-r-color"
      }
    }
  end

  def accent_color_prop_def do
    %{
      color: %{
        type: [:enum, :string],
        values: @accent_colors,
        responsive: false,
        class: "rt-r-accent-color"
      }
    }
  end

  def accent_colors, do: @accent_colors
  def gray_colors, do: @gray_colors

  defmacro attrs do
    quote do
      attr :color, :string,
        doc: "Color utility class string. One of: #{Enum.join(unquote(@accent_colors), ", ")}.",
        values: unquote(@accent_colors)
    end
  end
end
