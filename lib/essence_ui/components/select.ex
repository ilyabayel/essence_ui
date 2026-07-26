defmodule EssenceUI.Components.Select do
  @moduledoc """
  Select component styled per Radix Themes Select.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Select, as: SelectPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps

  require ColorProps
  require HighContrastProps

  @sizes ["1", "2", "3"]
  @trigger_variants ["surface", "classic", "soft", "ghost"]

  @doc """
  The root container for the select component.
  """
  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :on_change, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def select_root(assigns) do
    ~H"""
    <SelectPrimitive.root
      id={@id}
      value={@value}
      phx-change={@on_change}
      disabled={@disabled}
      dir={@dir}
      name={@name}
      required={@required}
      {@rest}
    >
      {render_slot(@inner_block)}
    </SelectPrimitive.root>
    """
  end

  @doc """
  The trigger area that opens the select menu.
  """
  attr :variant, :string, values: @trigger_variants, default: "surface"
  attr :size, :string, values: @sizes, default: "2"
  attr :placeholder, :string, default: nil
  ColorProps.attrs()
  attr :class, :string, default: nil
  attr :value, :string, default: nil, doc: "Initial value for SSR"
  attr :rest, :global
  slot :inner_block, required: false

  def select_trigger(assigns) do
    prop_defs =
      Map.merge(
        %{
          size: %{type: :enum, class: "est-r-size", values: @sizes, default: "2", responsive: true},
          variant: %{type: :enum, class: "est-variant", values: @trigger_variants, default: "surface"}
        },
        ColorProps.color_prop_def()
      )

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        class: ["est-reset", "est-SelectTrigger", extracted.class, assigns.class] |> Enum.filter(& &1) |> Enum.join(" "),
        color: assigns[:color] || false
      )

    ~H"""
    <SelectPrimitive.trigger
      id={@rest[:id] || "select-trigger-#{System.unique_integer([:positive])}"}
      class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      data-accent-color={@color}
      {Map.delete(@rest, :class)}
    >
      <span class="est-SelectTriggerInner">
        <SelectPrimitive.value placeholder={@placeholder} />
      </span>
      <SelectPrimitive.icon class="est-SelectIcon">
        <svg
          width="12"
          height="12"
          viewBox="0 0 12 12"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M3 4.5L6 7.5L9 4.5"
            stroke="currentColor"
            stroke-width="1.5"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
        </svg>
      </SelectPrimitive.icon>
    </SelectPrimitive.trigger>
    """
  end

  @content_variants ["solid", "soft"]

  @doc """
  The select menu content.
  """
  attr :variant, :string, values: @content_variants, default: "solid"
  attr :size, :string, values: @sizes, default: "2"
  attr :position, :string, values: ["item-aligned", "popper"], default: "item-aligned"
  attr :class, :string, default: nil
  ColorProps.attrs()
  HighContrastProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def select_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "est-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "est-variant", values: @content_variants, default: "solid"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        class:
          ["est-SelectContent", extracted.class, assigns.class]
          |> Enum.filter(& &1)
          |> Enum.join(" ")
      )

    ~H"""
    <SelectPrimitive.content
      id={@rest[:id] || "select-content-#{System.unique_integer([:positive])}"}
      class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      data-accent-color={assigns[:color]}
      data-position={@position}
      {Map.delete(@rest, :class)}
    >
      <SelectPrimitive.viewport class="est-SelectViewport">
        {render_slot(@inner_block)}
      </SelectPrimitive.viewport>
    </SelectPrimitive.content>
    """
  end

  @doc """
  An item in the select menu.
  """
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def select_item(assigns) do
    ~H"""
    <SelectPrimitive.item
      value={@value}
      disabled={@disabled}
      class={
        ["est-reset", "est-SelectItem", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
    >
      <SelectPrimitive.item_indicator class="est-SelectItemIndicator">
        <svg
          width="12"
          height="12"
          viewBox="0 0 12 12"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="est-SelectItemIndicatorIcon"
        >
          <path
            d="M10 3L4.5 8.5L2 6"
            stroke="currentColor"
            stroke-width="1.5"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
        </svg>
      </SelectPrimitive.item_indicator>
      <SelectPrimitive.item_text>
        {render_slot(@inner_block)}
      </SelectPrimitive.item_text>
    </SelectPrimitive.item>
    """
  end

  @doc """
  A group of items.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def select_group(assigns) do
    ~H"""
    <SelectPrimitive.group
      class={["est-SelectGroup", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </SelectPrimitive.group>
    """
  end

  @doc """
  A label for a group.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def select_label(assigns) do
    ~H"""
    <SelectPrimitive.label
      class={["est-SelectLabel", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </SelectPrimitive.label>
    """
  end

  @doc """
  A visual separator between items or groups.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  def select_separator(assigns) do
    ~H"""
    <SelectPrimitive.separator
      class={["est-SelectSeparator", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    />
    """
  end
end
