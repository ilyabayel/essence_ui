defmodule EssenceUI.Helpers.ExtractProps do
  @moduledoc false

  @doc """
  Extracts props according to prop definitions, applying defaults, generating class and style, and omitting used keys.
  Merges multiple prop_defs, applies defaults, builds responsive class names and custom properties, and returns a map with :classes, :custom_properties, and the remaining assigns.
  """
  def call(assigns, prop_defs_list) when is_list(prop_defs_list) do
    all_prop_defs = Enum.reduce(prop_defs_list, %{}, &Map.merge(&2, &1))
    call(assigns, all_prop_defs)
  end

  def call(assigns, prop_defs) do
    {extracted, _rest} = Enum.split_with(Map.to_list(assigns), fn {k, _v} -> Map.has_key?(prop_defs, k) end)

    {classes, custom_properties, used_keys} =
      Enum.reduce(extracted, {[], [], []}, fn {key, value}, {classes, custom_properties, used_keys} ->
        prop_definition = Map.get(prop_defs, key)
        value = if is_nil(value) and Map.has_key?(prop_definition, :default), do: prop_definition[:default], else: value

        # Enum prop: add class for value, or default if invalid
        cond do
          prop_definition[:type] == :boolean and value ->
            {[prop_definition[:class] | classes], custom_properties, [key | used_keys]}

          Map.has_key?(prop_definition, :custom_properties) and not is_nil(value) ->
            props = Enum.map(prop_definition[:custom_properties], fn prop -> "#{prop}: #{value};" end)
            class = prop_definition[:class]
            {[class | classes], props ++ custom_properties, [key | used_keys]}

          prop_definition[:type] in [:enum, [:enum, :string]] and not is_nil(value) ->
            valid = Map.get(prop_definition, :values, [])
            val = if value in valid, do: value, else: prop_definition[:default]
            class = if prop_definition[:class], do: "#{prop_definition[:class]}-#{val}"
            {[class | classes], custom_properties, [key | used_keys]}

          prop_definition[:type] == :string and not is_nil(value) and prop_definition[:class] ->
            class = "#{prop_definition[:class]}-#{value}"
            {[class | classes], custom_properties, [key | used_keys]}

          true ->
            {classes, custom_properties, used_keys}
        end
      end)

    # Remove used keys from assigns
    rest_assigns = Map.drop(assigns, used_keys)

    %{
      classes: classes |> Enum.filter(& &1) |> Enum.reverse(),
      custom_properties: Enum.reverse(custom_properties),
      rest: rest_assigns
    }
  end
end
