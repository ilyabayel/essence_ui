defmodule EssenceUI.SharedProps.LeadingTrimProps do
  @moduledoc """
  Prop definition for trim (leading trim for text).
  """

  @leading_trim_values ["normal", "start", "end", "both"]

  def leading_trim_prop_def do
    %{
      trim: %{type: [:enum, :string], values: @leading_trim_values, responsive: true, class: "rt-r-lt"}
    }
  end

  def leading_trim_values, do: @leading_trim_values

  defmacro leading_trim_attrs do
    quote do
      attr :trim, :string,
        values: unquote(@leading_trim_values),
        doc: "Trim leading space: one of #{Enum.join(@leading_trim_values, ", ")}."
    end
  end
end
