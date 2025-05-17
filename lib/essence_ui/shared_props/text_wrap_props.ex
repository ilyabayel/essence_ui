defmodule EssenceUI.SharedProps.TextWrapProps do
  @moduledoc """
  Prop definition for wrap (text wrapping).
  """

  @wrap_values ["wrap", "nowrap", "pretty", "balance"]

  def text_wrap_prop_def do
    %{
      wrap: %{type: [:enum, :string], values: @wrap_values, responsive: true, class: "rt-r-tw"}
    }
  end

  def text_wrap_values, do: @wrap_values

  defmacro text_wrap_attrs do
    quote do
      attr :wrap, :string,
        values: unquote(@wrap_values),
        doc: "Text wrapping: one of #{Enum.join(unquote(@wrap_values), ", ")}."
    end
  end
end
