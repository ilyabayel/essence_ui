defmodule EssenceUI.SharedProps.TextAlignProps do
  @moduledoc """
  Prop definition for align (text alignment).
  """

  @alignments ["left", "center", "right"]

  def prop_defs do
    %{
      align: %{type: [:enum, :string], values: @alignments, responsive: true, class: "rt-r-ta"}
    }
  end

  def text_align_values, do: @alignments

  defmacro attrs do
    quote do
      attr :align, :string,
        values: unquote(@alignments),
        doc: "Text alignment: one of #{Enum.join(unquote(@alignments), ", ")}."
    end
  end
end
