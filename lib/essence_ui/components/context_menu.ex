defmodule EssenceUI.Components.ContextMenu do
  @moduledoc """
  Context Menu component compatible with Radix UI Themes ContextMenu API.

  Based on EssenceUI.Primitives.ContextMenu.
  See: https://www.radix-ui.com/themes/docs/components/context-menu
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.ContextMenu, as: ContextMenuPrimitive
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

  def context_menu_root(assigns) do
    id =
      assigns[:id] ||
        "context-menu-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    assigns = assign(assigns, id: id)

    ~H"""
    <ContextMenuPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      on_open_change={@on_open_change}
      dir={@dir}
      modal={@modal}
      class={["rt-ContextMenuRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: contents;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_trigger(assigns) do
    ~H"""
    <ContextMenuPrimitive.trigger
      id={@id}
      content_id={@content_id}
      disabled={@disabled}
      as_child
      class={["rt-ContextMenuTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.trigger>
    """
  end

  attr :id, :string, default: nil
  attr :target, :string, default: "body"
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :loop, :boolean, default: true
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  ColorProps.attrs()
  HighContrastProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_content(assigns) do
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
        "context-menu-content-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class =
      [
        "rt-PopperContent",
        "rt-BaseMenuContent",
        "rt-ContextMenuContent",
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
    <ContextMenuPrimitive.portal id={@portal_id} target={@target}>
      <ContextMenuPrimitive.content
        id={@id}
        loop={@loop}
        class={@class}
        style={@style}
        data-accent-color={assigns[:color]}
        {@rest}
      >
        <div class="rt-BaseMenuViewport">
          {render_slot(@inner_block)}
        </div>
      </ContextMenuPrimitive.content>
    </ContextMenuPrimitive.portal>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_label(assigns) do
    ~H"""
    <ContextMenuPrimitive.label
      id={@id}
      class={
        ["rt-BaseMenuLabel", "rt-ContextMenuLabel", @class] |> Enum.filter(& &1) |> Enum.join(" ")
      }
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.label>
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

  def context_menu_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.item
      id={@id}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", @class]
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
    </ContextMenuPrimitive.item>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_group(assigns) do
    ~H"""
    <ContextMenuPrimitive.group
      id={@id}
      class={["rt-ContextMenuGroup", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.group>
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

  def context_menu_checkbox_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.checkbox_item
      id={@id}
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", "rt-BaseMenuCheckboxItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    >
      <ContextMenuPrimitive.item_indicator class="rt-BaseMenuItemIndicator" force_mount={@checked}>
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
      </ContextMenuPrimitive.item_indicator>
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </ContextMenuPrimitive.checkbox_item>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_radio_group(assigns) do
    ~H"""
    <ContextMenuPrimitive.radio_group
      id={@id}
      value={@value}
      class={["rt-ContextMenuRadioGroup", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.radio_group>
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

  def context_menu_radio_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.radio_item
      id={@id}
      value={@value}
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", "rt-BaseMenuRadioItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {@rest}
    >
      <ContextMenuPrimitive.item_indicator class="rt-BaseMenuItemIndicator" force_mount={@checked}>
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
      </ContextMenuPrimitive.item_indicator>
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </ContextMenuPrimitive.radio_item>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  def context_menu_separator(assigns) do
    ~H"""
    <ContextMenuPrimitive.separator
      id={@id}
      class={
        ["rt-BaseMenuSeparator", "rt-ContextMenuSeparator", @class]
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

  def context_menu_sub(assigns) do
    ~H"""
    <ContextMenuPrimitive.sub
      id={@id}
      open={@open}
      class={["rt-ContextMenuSub", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      {@rest}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.sub>
    """
  end

  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_sub_trigger(assigns) do
    ~H"""
    <ContextMenuPrimitive.sub_trigger
      id={@id}
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuSubTrigger", @class]
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
    </ContextMenuPrimitive.sub_trigger>
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

  def context_menu_sub_content(assigns) do
    class =
      ["rt-PopperContent", "rt-BaseMenuContent", "rt-ContextMenuSubContent", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <ContextMenuPrimitive.sub_content
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
    </ContextMenuPrimitive.sub_content>
    """
  end
end
