defmodule EssenceUI.SharedProps.AsChildProps do
  @moduledoc """
  Prop definition for as_child (composes the component into its immediate child instead of rendering its own HTML element).
  """

  def as_child_prop_defs do
    %{
      as_child: %{type: :boolean}
    }
  end

  defmacro as_child_attrs do
    quote do
      attr :as_child, :boolean,
        doc: "Composes the component into its immediate child instead of rendering its own HTML element."
    end
  end
end
