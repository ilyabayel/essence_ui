defmodule EssenceUI.SharedProps.WeightProps do
  @moduledoc """
  Prop definition for weight (font weight).
  """

  @weights ["light", "regular", "medium", "bold"]

  def weight_prop_def do
    %{
      weight: %{type: [:enum, :string], values: @weights, responsive: true, class: "rt-r-weight"}
    }
  end

  def weight_values, do: @weights

  defmacro weight_attrs do
    quote do
      attr :weight, :string, values: unquote(@weights), doc: "Font weight: one of #{Enum.join(@weights, ", ")}."
    end
  end
end
