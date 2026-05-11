defmodule EssenceUI.Primitives do
  use Phoenix.Component

  defmacro __using__(_) do
    quote do
      import EssenceUI.Primitives
      use Phoenix.Component
    end
  end

  # Shared logic for generating data-attributes from boolean assigns
  def data_attributes(assigns, keys) do
    for key <- keys, into: %{} do
      {"data-#{key |> Atom.to_string() |> String.replace("_", "-")}", to_string(Map.get(assigns, key))}
    end
  end
end
