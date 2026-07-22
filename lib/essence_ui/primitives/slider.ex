defmodule EssenceUI.Primitives.Slider do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :value, :any, default: nil
  attr :default_value, :any, default: [0]
  attr :min, :integer, default: 0
  attr :max, :integer, default: 100
  attr :step, :integer, default: 1
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :disabled, :boolean, default: false
  attr :name, :string, default: nil
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :inverted, :boolean, default: false
  attr :min_steps_between_thumbs, :integer, default: 0
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    values = normalize_values(assigns.value || assigns.default_value)
    multi? = length(values) > 1

    assigns =
      assigns
      |> assign(:value_attr, encode_values(values))
      |> assign(:values, values)
      |> assign(:role, if(multi?, do: "group", else: nil))

    ~H"""
    <span
      id={@id}
      phx-hook="SliderRoot"
      role={@role}
      data-essence-slider-root
      data-value={@value_attr}
      data-min={@min}
      data-max={@max}
      data-step={@step}
      data-orientation={@orientation}
      data-disabled={if @disabled, do: ""}
      data-name={@name}
      data-inverted={if @inverted, do: ""}
      data-min-steps-between-thumbs={@min_steps_between_thumbs}
      data-on-value-change={@on_value_change}
      aria-disabled={if @disabled, do: "true"}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true

  def track(assigns) do
    ~H"""
    <span data-essence-slider-track {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :rest, :global
  slot :inner_block, required: false

  def range(assigns) do
    ~H"""
    <span data-essence-slider-range {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :index, :integer, default: 0
  attr :rest, :global
  slot :inner_block, required: false

  def thumb(assigns) do
    ~H"""
    <span
      data-essence-slider-thumb
      data-index={@index}
      role="slider"
      tabindex="0"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  defp normalize_values(nil), do: [0]
  defp normalize_values(value) when is_list(value), do: value
  defp normalize_values(value) when is_number(value), do: [value]
  defp normalize_values(value) when is_binary(value) do
    value
    |> String.trim()
    |> then(fn
      "[" <> _ = json ->
        case Jason.decode(json) do
          {:ok, list} when is_list(list) -> list
          _ -> parse_space_separated(value)
        end

      other ->
        parse_space_separated(other)
    end)
  end

  defp normalize_values(_), do: [0]

  defp parse_space_separated(value) do
    value
    |> String.split(~r/[\s,]+/, trim: true)
    |> Enum.map(&String.to_integer/1)
  rescue
    _ -> [0]
  end

  defp encode_values(values) when is_list(values), do: Jason.encode!(values)
end
