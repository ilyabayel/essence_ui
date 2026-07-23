defmodule EssenceUI.Components.DropdownMenu do
  @moduledoc """
  Dropdown Menu component compatible with Radix UI Themes DropdownMenu API.

  Based on EssenceUI.Primitives.DropdownMenu.
  See: https://www.radix-ui.com/themes/docs/components/dropdown-menu
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.DropdownMenu, as: DropdownMenuPrimitive
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps

  require ColorProps
  require HighContrastProps

  @sizes ["1", "2"]
  @variants ["solid", "soft"]

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :modal, :boolean, default: true
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_root(assigns) do
    id =
      assigns[:id] ||
        "dropdown-menu-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    assigns = assign(assigns, id: id)

    ~H"""
    <DropdownMenuPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      on_open_change={@on_open_change}
      dir={@dir}
      modal={@modal}
      class={["rt-DropdownMenuRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={
        ["display: inline-block; position: relative;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_trigger(assigns) do
    ~H"""
    <DropdownMenuPrimitive.trigger
      id={@id}
      content_id={@content_id}
      disabled={@disabled}
      as_child
      class={["rt-DropdownMenuTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.trigger>
    """
  end

  attr :class, :string, default: nil

  def dropdown_menu_trigger_icon(assigns) do
    ~H"""
    <svg
      width="15"
      height="15"
      viewBox="0 0 15 15"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      class={["rt-DropdownMenuTriggerIcon", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style="margin-left: 4px; opacity: 0.7;"
    >
      <path
        d="M3.13523 6.15803C3.3241 5.95657 3.64052 5.93845 3.84197 6.12733L7.50005 9.55663L11.1581 6.12733C11.3596 5.93845 11.676 5.95657 11.8649 6.15803C12.0538 6.35949 12.0357 6.67591 11.8342 6.86477L7.83423 10.6148C7.64964 10.788 7.35046 10.788 7.16587 10.6148L3.16587 6.86477C2.96441 6.67591 2.9463 6.35949 3.13523 6.15803Z"
        fill="currentColor"
        fill-rule="evenodd"
        clip-rule="evenodd"
      >
      </path>
    </svg>
    """
  end

  attr :id, :string, default: nil
  attr :target, :string, default: "body"
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "bottom"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 4
  attr :loop, :boolean, default: true
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  ColorProps.attrs()
  HighContrastProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "solid"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    id =
      assigns[:id] ||
        "dropdown-menu-content-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class =
      [
        "rt-PopperContent",
        "rt-BaseMenuContent",
        "rt-DropdownMenuContent",
        extracted.class,
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    style =
      [extracted.style, assigns[:style]]
      |> Enum.filter(&(&1 != "" and &1))
      |> Enum.join("; ")

    assigns =
      assign(assigns,
        id: id,
        portal_id: "#{id}-portal",
        class: class,
        style: style
      )

    ~H"""
    <DropdownMenuPrimitive.portal id={@portal_id} target={@target}>
      <DropdownMenuPrimitive.content
        id={@id}
        side={@side}
        align={@align}
        side_offset={@side_offset}
        loop={@loop}
        class={@class}
        style={@style}
        data-accent-color={assigns[:color]}
        {@rest}
      >
        <div class="rt-BaseMenuViewport">
          {render_slot(@inner_block)}
        </div>
      </DropdownMenuPrimitive.content>
    </DropdownMenuPrimitive.portal>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_label(assigns) do
    ~H"""
    <DropdownMenuPrimitive.label
      id={@id}
      class={
        ["rt-BaseMenuLabel", "rt-DropdownMenuLabel", @class] |> Enum.filter(& &1) |> Enum.join(" ")
      }
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.label>
    """
  end

  attr :id, :string, default: nil
  attr :shortcut, :string, default: nil
  attr :color, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global, include: ~w(phx-click phx-target value href)
  slot :inner_block, required: true

  def dropdown_menu_item(assigns) do
    ~H"""
    <DropdownMenuPrimitive.item
      id={@id}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </DropdownMenuPrimitive.item>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_group(assigns) do
    ~H"""
    <DropdownMenuPrimitive.group
      id={@id}
      class={["rt-DropdownMenuGroup", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.group>
    """
  end

  attr :id, :string, default: nil
  attr :checked, :boolean, default: false
  attr :shortcut, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_checkbox_item(assigns) do
    ~H"""
    <DropdownMenuPrimitive.checkbox_item
      id={@id}
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", "rt-BaseMenuCheckboxItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    >
      <DropdownMenuPrimitive.item_indicator class="rt-BaseMenuItemIndicator" force_mount={@checked}>
        <svg
          width="15"
          height="15"
          viewBox="0 0 15 15"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="rt-BaseMenuItemIndicatorIcon"
        >
          <path
            d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z"
            fill="currentColor"
            fill-rule="evenodd"
            clip-rule="evenodd"
          >
          </path>
        </svg>
      </DropdownMenuPrimitive.item_indicator>
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </DropdownMenuPrimitive.checkbox_item>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_radio_group(assigns) do
    ~H"""
    <DropdownMenuPrimitive.radio_group
      id={@id}
      value={@value}
      class={["rt-DropdownMenuRadioGroup", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.radio_group>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :shortcut, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_radio_item(assigns) do
    ~H"""
    <DropdownMenuPrimitive.radio_item
      id={@id}
      value={@value}
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", "rt-BaseMenuRadioItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    >
      <DropdownMenuPrimitive.item_indicator class="rt-BaseMenuItemIndicator" force_mount={@checked}>
        <svg
          width="15"
          height="15"
          viewBox="0 0 15 15"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="rt-BaseMenuItemIndicatorIcon"
        >
          <path
            d="M7.5 10C8.88071 10 10 8.88071 10 7.5C10 6.11929 8.88071 5 7.5 5C6.11929 5 5 6.11929 5 7.5C5 8.88071 6.11929 10 7.5 10Z"
            fill="currentColor"
          >
          </path>
        </svg>
      </DropdownMenuPrimitive.item_indicator>
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </DropdownMenuPrimitive.radio_item>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  def dropdown_menu_separator(assigns) do
    ~H"""
    <DropdownMenuPrimitive.separator
      id={@id}
      class={
        ["rt-BaseMenuSeparator", "rt-DropdownMenuSeparator", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    />
    """
  end

  attr :id, :string, default: nil
  attr :open, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_sub(assigns) do
    ~H"""
    <DropdownMenuPrimitive.sub
      id={@id}
      open={@open}
      class={["rt-DropdownMenuSub", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </DropdownMenuPrimitive.sub>
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_sub_trigger(assigns) do
    ~H"""
    <DropdownMenuPrimitive.sub_trigger
      id={@id}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuSubTrigger", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    >
      {render_slot(@inner_block)}
      <div class="rt-BaseMenuShortcut">
        <svg
          width="15"
          height="15"
          viewBox="0 0 15 15"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="rt-BaseMenuSubTriggerIcon"
        >
          <path
            d="M6.1584 3.13508C6.35985 2.95662 6.66436 2.97508 6.84282 3.17653L10.0928 6.8432C10.2458 7.01594 10.2458 7.26941 10.0928 7.44215L6.84282 11.1088C6.66436 11.3103 6.35985 11.3287 6.1584 11.1503C5.95696 10.9718 5.93849 10.6673 6.11695 10.4659L9.04351 7.14267L6.11695 3.81946C5.93849 3.61801 5.95696 3.3135 6.1584 3.13508Z"
            fill="currentColor"
            fill-rule="evenodd"
            clip-rule="evenodd"
          >
          </path>
        </svg>
      </div>
    </DropdownMenuPrimitive.sub_trigger>
    """
  end

  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "right"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 0
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_sub_content(assigns) do
    class =
      ["rt-PopperContent", "rt-BaseMenuContent", "rt-DropdownMenuSubContent", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <DropdownMenuPrimitive.sub_content
      id={@id}
      side={@side}
      align={@align}
      side_offset={@side_offset}
      class={@class}
      style={@style}
      {@rest}
    >
      <div class="rt-BaseMenuViewport">
        {render_slot(@inner_block)}
      </div>
    </DropdownMenuPrimitive.sub_content>
    """
  end
end
