defmodule EssenceUI.Primitives.Progress do
  @moduledoc false

  use EssenceUI.Primitives

  attr :value, :any, default: nil
  attr :max, :any, default: 100
  attr :get_value_label, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def root(assigns) do
    max = valid_max(assigns.max)
    value = valid_value(assigns.value, max)

    assigns =
      assigns
      |> assign(:value, value)
      |> assign(:max, max)
      |> assign(:value_label, value_label(value, max, assigns.get_value_label))

    ~H"""
    <div
      role="progressbar"
      aria-valuemin="0"
      aria-valuemax={@max}
      aria-valuenow={@value}
      aria-valuetext={@value_label}
      data-state={state(@value, @max)}
      data-value={@value}
      data-max={@max}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :value, :any, default: nil
  attr :max, :any, default: 100
  attr :rest, :global

  def indicator(assigns) do
    max = valid_max(assigns.max)

    assigns =
      assigns
      |> assign(:value, valid_value(assigns.value, max))
      |> assign(:max, max)

    ~H"""
    <div data-state={state(@value, @max)} data-value={@value} data-max={@max} {@rest} />
    """
  end

  defp valid_max(max) when is_number(max) and max == max and max > 0, do: max
  defp valid_max(_), do: 100

  defp valid_value(nil, _max), do: nil
  defp valid_value(value, max) when is_number(value) and value == value and value >= 0 and value <= max, do: value
  defp valid_value(_, _), do: nil

  defp value_label(nil, _max, _fun), do: nil
  defp value_label(value, max, fun) when is_function(fun, 2), do: fun.(value, max)
  defp value_label(value, max, _fun), do: "#{round(value / max * 100)}%"

  defp state(nil, _max), do: "indeterminate"
  defp state(value, max) when value == max, do: "complete"
  defp state(_value, _max), do: "loading"
end
