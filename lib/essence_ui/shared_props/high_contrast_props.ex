defmodule EssenceUI.SharedProps.HighContrastProps do
  @moduledoc """
  Prop definition for high_contrast (increases color contrast with the background).
  """

  def high_contrast_prop_def do
    %{
      high_contrast: %{type: :boolean, class: "rt-high-contrast"}
    }
  end

  defmacro high_contrast_attrs do
    quote do
      attr :high_contrast, :boolean, doc: "Whether to increase color contrast with the background."
    end
  end
end
