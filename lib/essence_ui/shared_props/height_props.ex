defmodule EssenceUI.SharedProps.HeightProps do
  @moduledoc """
  Height prop definitions for Box and other components.
  Inspired by Radix UI Themes.
  """

  def height_prop_defs do
    %{
      height: %{type: :string, class: "rt-r-h", custom_properties: ["--height"], responsive: true},
      max_height: %{type: :string, class: "rt-r-max-h", custom_properties: ["--max-height"], responsive: true},
      min_height: %{type: :string, class: "rt-r-min-h", custom_properties: ["--min-height"], responsive: true}
    }
  end

  defmacro height_attrs do
    quote do
      attr :height, :any, doc: "Height utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
      attr :max_height, :any, doc: "Max height utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
      attr :min_height, :any, doc: "Min height utility class string or map. `100px` or `%{xs: '100px', sm: '200px'}`"
    end
  end
end
