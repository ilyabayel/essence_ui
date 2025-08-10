defmodule EssenceUI.Helpers.ExtractProps do
  @moduledoc false

  @responsive_breakpoints [:initial, :xs, :sm, :md, :lg, :xl]

  @doc """
  Extracts props according to prop definitions, applying defaults, generating class and style, and omitting used keys.
  Merges multiple prop_defs, applies defaults, builds responsive class names and custom properties, and returns a map with :classes, :custom_properties, and the remaining assigns.
  """
  def call(%{} = assigns, %{} = prop_defs) do
    other_assigns = Map.drop(assigns, Map.keys(prop_defs))

    props =
      for {property, definition} <- prop_defs do
        handle_prop(definition, Map.get(assigns, property, definition[:default]))
      end

    class =
      props
      |> Enum.map(fn %{class: class} -> class end)
      |> Enum.dedup()
      |> Enum.join(" ")

    style =
      props
      |> Enum.flat_map(fn %{custom_properties: custom_properties} -> custom_properties end)
      |> Enum.dedup_by(fn {property, _} -> property end)
      |> Enum.map_join("; ", fn {property, value} -> "#{property}: #{value}" end)

    Map.merge(other_assigns, %{
      class: "#{assigns[:class] || ""} #{class}",
      style: (assigns[:style] || "") <> style
    })
  end

  # boolean
  defp handle_prop(%{type: :boolean} = definition, true = _value) do
    %{class: definition[:class], custom_properties: []}
  end

  # string
  defp handle_prop(%{type: :string} = definition, value) when is_binary(value) and value != "" do
    %{class: definition[:class], custom_properties: Enum.map(definition[:custom_properties], &{&1, value})}
  end

  # enum
  defp handle_prop(%{type: :enum, values: values} = definition, value) when is_binary(value) and value != "" do
    if value in values do
      {sign, value} = split_value(value)

      %{class: "#{sign}#{definition[:class]}-#{value}", custom_properties: []}
    else
      %{class: "", custom_properties: []}
    end
  end

  # responsive
  defp handle_prop(%{responsive: true} = definition, value) when is_map(value) do
    props_for_each_breakpoint =
      for breakpoint <- Enum.filter(@responsive_breakpoints, fn br -> br in Map.keys(value) end) do
        extracted_prop = handle_prop(definition, value[breakpoint])

        if breakpoint == :initial do
          extracted_prop
        else
          class = "#{breakpoint}:#{extracted_prop.class}"

          custom_properties =
            Enum.map(extracted_prop.custom_properties, fn {property, val} -> {"#{property}-#{breakpoint}", val} end)

          %{class: class, custom_properties: custom_properties}
        end
      end

    %{
      class: Enum.map_join(props_for_each_breakpoint, " ", & &1.class),
      custom_properties: Enum.flat_map(props_for_each_breakpoint, & &1.custom_properties)
    }
  end

  # multiple types
  defp handle_prop(%{type: type, values: values} = definition, value) when is_list(type) do
    cond do
      :enum in type and value in values ->
        handle_prop(%{definition | type: :enum}, value)

      :boolean in type and value == true ->
        handle_prop(%{definition | type: :boolean}, value)

      :string in type ->
        handle_prop(%{definition | type: :string}, value)
    end
  end

  defp handle_prop(_, _) do
    %{class: "", custom_properties: []}
  end

  defp split_value(value) do
    case Integer.parse(value) do
      {int_value, ""} when int_value < 0 ->
        {"-", "#{abs(int_value)}"}

      {int_value, ""} ->
        {"", "#{int_value}"}

      _ ->
        {"", value}
    end
  end
end
