defmodule EssenceUI.Helpers.ExtractProps do
  @moduledoc false

  @doc """
  Extracts props according to prop definitions, applying defaults, generating class and style, and omitting used keys.
  Prop defs: %{prop_name => %{type: :enum | :string | :boolean, default: any, values: [any], class: String.t, style: map}}
  Returns: %{class: String.t, style: map, ...other_props}
  """
  def call(assigns, prop_defs) do
    Enum.reduce(prop_defs, %{}, fn {key, defs}, acc ->
      value = Map.get(assigns, key)

      if value do
        class = Map.get(defs, :class)

        custom_properties =
          defs
          |> Map.get(:custom_properties, [])
          |> Enum.map(fn prop ->
            "#{prop}: #{value};"
          end)

        responsive = Map.get(defs, :responsive, false)

        acc
        |> Map.put(:classes, [class] ++ (acc[:classes] || []))
        |> Map.put(:custom_properties, custom_properties ++ (acc[:custom_properties] || []))
      else
        acc
      end
    end)
  end
end
