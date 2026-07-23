defmodule EssenceUI.Components.CheckboxGroup do
  @moduledoc """
  Checkbox Group component styled per Radix Themes Checkbox Group.

  Uses `EssenceUI.Primitives.Checkbox` for each item.

  ## Examples

      <.checkbox_group name="interests" default_value={["coding", "music"]}>
        <:item value="coding">Coding</:item>
        <:item value="music">Music</:item>
        <:item value="sports">Sports</:item>
      </.checkbox_group>
  """

  use Phoenix.Component

  import EssenceUI.Primitives.Checkbox, only: [root: 1, indicator: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  @doc """
  Checkbox group root with `:item` slots.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "surface"
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  attr :default_value, :list, default: []
  attr :value, :list, default: nil
  attr :disabled, :boolean, default: false
  attr :name, :string, required: true
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  MarginProps.attrs()
  attr :rest, :global, include: ~w(form aria-label aria-labelledby aria-describedby dir)

  slot :item, required: true do
    attr :value, :string, required: true
    attr :disabled, :boolean
    attr :id, :string
  end

  def checkbox_group(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "surface"},
        high_contrast: %{type: :boolean, class: "rt-high-contrast"}
      }
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    selected_values = assigns[:value] || assigns[:default_value] || []
    selected_values = if is_list(selected_values), do: selected_values, else: [selected_values]
    selected_values = Enum.map(selected_values, &to_string/1)

    class =
      ["rt-CheckboxGroupRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    id = assigns[:id] || "checkbox-group-#{System.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        id: id,
        class: class,
        style: extracted.style,
        selected_values: selected_values,
        color: assigns[:color],
        checkbox_class:
          [
            "rt-reset",
            "rt-BaseCheckboxRoot",
            "rt-CheckboxGroupItemCheckbox",
            "rt-r-size-#{assigns.size}",
            "rt-variant-#{assigns.variant}",
            assigns.high_contrast && "rt-high-contrast"
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" ")
      )

    ~H"""
    <div
      id={@id}
      role="group"
      dir={assigns[:rest][:dir] || "ltr"}
      data-accent-color={@color}
      class={@class}
      style={@style}
      tabindex="0"
      {@rest}
    >
      <%= for {item, index} <- Enum.with_index(@item) do %>
        <label class={"rt-Text rt-CheckboxGroupItem rt-r-size-#{@size}"}>
          <.root
            id={item[:id] || "#{@id}-item-#{index}"}
            name={@name}
            value={item[:value]}
            default_checked={to_string(item[:value]) in @selected_values}
            disabled={@disabled || Map.get(item, :disabled, false)}
            class={@checkbox_class}
            data-accent-color={@color}
          >
            <.indicator class="rt-BaseCheckboxIndicator">
              <svg
                width="9"
                height="9"
                viewBox="0 0 9 9"
                fill="currentcolor"
                xmlns="http://www.w3.org/2000/svg"
                data-state="checked"
              >
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"
                />
              </svg>
            </.indicator>
          </.root>
          <span class="rt-CheckboxGroupItemInner">
            {render_slot(item)}
          </span>
        </label>
      <% end %>
    </div>
    """
  end
end
