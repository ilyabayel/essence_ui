defmodule EssenceUI.SharedProps.LeadingTrimProps do
  @moduledoc """
  Prop definition for trim (leading trim for text).
  """

  @leading_trim_values ["normal", "start", "end", "both"]

  def prop_defs do
    %{
      trim: %{type: [:enum, :string], values: @leading_trim_values, responsive: true, class: "rt-r-lt"}
    }
  end

  def leading_trim_values, do: @leading_trim_values

  defmacro attrs do
    quote do
      attr :trim, :string,
        values: unquote(@leading_trim_values),
        doc: "Trim leading space: one of #{Enum.join(unquote(@leading_trim_values), ", ")}."
    end
  end
end
