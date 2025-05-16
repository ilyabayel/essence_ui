defmodule EssenceUI.SharedProps.WidthProps do
  @moduledoc """
  Width prop definitions for Box and other components.
  Inspired by Radix UI Themes.
  """

  def width_prop_defs do
    %{
      width: %{type: :string, class: "rt-r-w", custom_properties: ["--width"], responsive: true},
      max_width: %{type: :string, class: "rt-r-max-w", custom_properties: ["--max-width"], responsive: true},
      min_width: %{type: :string, class: "rt-r-min-w", custom_properties: ["--min-width"], responsive: true}
    }
  end

  defmacro width_attrs do
    quote do
      attr :width, :any, doc: "Width utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
      attr :max_width, :any, doc: "Max width utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
      attr :min_width, :any, doc: "Min width utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
    end
  end
end
