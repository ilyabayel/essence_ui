defmodule EssenceUI.SharedProps.AsChildProps do
  @moduledoc """
  Prop definition for as_child (composes the component into its immediate child instead of rendering its own HTML element).
  """

  def prop_defs do
    %{
      as_child: %{type: :boolean, default: false}
    }
  end

  defmacro attrs do
    quote do
      attr :as_child, :boolean,
        default: false,
        doc: "Composes the component into its immediate child instead of rendering its own HTML element."
    end
  end
end
