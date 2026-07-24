defmodule EssenceUI.Components.ContextMenu do
  @moduledoc """
  Context Menu styled per Radix Themes Context Menu.

  Wraps `EssenceUI.Primitives.ContextMenu` with Themes visual props
  (`size`, `variant`, `color`, `high_contrast`, `shortcut`).
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

  @doc """
  Root container for the context menu.
  """
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
    assigns =
      assign_new(assigns, :id, fn -> "context-menu-#{System.unique_integer([:positive])}" end)

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

  @doc """
  The area that opens the context menu on right-click.
  """
  attr :id, :string, default: nil
  attr :content_id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_trigger(assigns) do
    ~H"""
    <ContextMenuPrimitive.trigger
      id={@id}
      content_id={@content_id}
      disabled={@disabled}
      class={["rt-ContextMenuTrigger", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.trigger>
    """
  end

  @doc """
  The menu content. Portals into `container` (default `"body"`) like Radix Themes.
  """
  attr :id, :string, default: nil
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :container, :string, default: "body"
  attr :class, :string, default: nil
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

    assigns =
      assign_new(assigns, :id, fn -> "context-menu-content-#{System.unique_integer([:positive])}" end)

    assigns =
      assign(assigns,
        class:
          [
            "rt-PopperContent",
            "rt-BaseMenuContent",
            "rt-ContextMenuContent",
            extracted.class,
            assigns.class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        portal_id: "#{assigns.id}-portal"
      )

    ~H"""
    <ContextMenuPrimitive.portal id={@portal_id} target={@container}>
      <ContextMenuPrimitive.content
        id={@id}
        class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
        data-accent-color={assigns[:color]}
        style="display: none; position: fixed; z-index: 9999; min-width: 8rem;"
        {Map.delete(@rest, :class)}
      >
        <div class="rt-BaseMenuViewport">
          {render_slot(@inner_block)}
        </div>
      </ContextMenuPrimitive.content>
    </ContextMenuPrimitive.portal>
    """
  end

  @doc """
  A standard menu item.
  """
  attr :shortcut, :string, default: nil
  attr :color, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(phx-click phx-target value href)
  slot :inner_block, required: true

  def context_menu_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.item
      disabled={@disabled}
      text_value={@text_value}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", @class, @rest[:class]]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-accent-color={@color}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
      <div :if={@shortcut} class="rt-BaseMenuShortcut">{@shortcut}</div>
    </ContextMenuPrimitive.item>
    """
  end

  @doc """
  Groups multiple items.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_group(assigns) do
    ~H"""
    <ContextMenuPrimitive.group
      class={
        ["rt-BaseMenuGroup", "rt-ContextMenuGroup", @class, @rest[:class]]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.group>
    """
  end

  @doc """
  Visual separator between items.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  def context_menu_separator(assigns) do
    ~H"""
    <ContextMenuPrimitive.separator
      class={
        ["rt-BaseMenuSeparator", "rt-ContextMenuSeparator", @class, @rest[:class]]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
    />
    """
  end

  @doc """
  Non-interactive label.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_label(assigns) do
    ~H"""
    <ContextMenuPrimitive.label
      class={
        ["rt-BaseMenuLabel", "rt-ContextMenuLabel", @class, @rest[:class]]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.label>
    """
  end

  @doc """
  Menu item with checkbox behavior.
  """
  attr :checked, :boolean, default: false
  attr :shortcut, :string, default: nil
  attr :color, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_checkbox_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.checkbox_item
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        [
          "rt-reset",
          "rt-BaseMenuItem",
          "rt-BaseMenuCheckboxItem",
          "rt-ContextMenuItem",
          "rt-ContextMenuCheckboxItem",
          @class,
          @rest[:class]
        ]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-accent-color={@color}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
      <ContextMenuPrimitive.item_indicator
        force_mount={@checked}
        class="rt-BaseMenuItemIndicator rt-ContextMenuItemIndicator"
      >
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
      <div :if={@shortcut} class="rt-BaseMenuShortcut">{@shortcut}</div>
    </ContextMenuPrimitive.checkbox_item>
    """
  end

  @doc """
  Groups radio items.
  """
  attr :value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_radio_group(assigns) do
    ~H"""
    <ContextMenuPrimitive.radio_group
      value={@value}
      class={
        ["rt-BaseMenuRadioGroup", "rt-ContextMenuRadioGroup", @class, @rest[:class]]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.radio_group>
    """
  end

  @doc """
  A radio menu item.
  """
  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :color, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_radio_item(assigns) do
    ~H"""
    <ContextMenuPrimitive.radio_item
      value={@value}
      checked={@checked}
      disabled={@disabled}
      text_value={@text_value}
      class={
        [
          "rt-reset",
          "rt-BaseMenuItem",
          "rt-BaseMenuRadioItem",
          "rt-ContextMenuItem",
          "rt-ContextMenuRadioItem",
          @class,
          @rest[:class]
        ]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-accent-color={@color}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
      <ContextMenuPrimitive.item_indicator
        force_mount={@checked}
        class="rt-BaseMenuItemIndicator rt-ContextMenuItemIndicator"
      >
        <svg
          width="15"
          height="15"
          viewBox="0 0 15 15"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="rt-BaseMenuItemIndicatorIcon"
        >
          <path
            d="M9.875 7.5C9.875 8.81168 8.81168 9.875 7.5 9.875C6.18832 9.875 5.125 8.81168 5.125 7.5C5.125 6.18832 6.18832 5.125 7.5 5.125C8.81168 5.125 9.875 6.18832 9.875 7.5Z"
            fill="currentColor"
          >
          </path>
        </svg>
      </ContextMenuPrimitive.item_indicator>
    </ContextMenuPrimitive.radio_item>
    """
  end

  @doc """
  Sub-menu container.
  """
  attr :open, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_sub(assigns) do
    ~H"""
    <ContextMenuPrimitive.sub
      open={@open}
      class={["rt-ContextMenuSub", @class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      {Map.delete(@rest, :class)}
    >
      {render_slot(@inner_block)}
    </ContextMenuPrimitive.sub>
    """
  end

  @doc """
  Trigger for a sub-menu.
  """
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_sub_trigger(assigns) do
    ~H"""
    <ContextMenuPrimitive.sub_trigger
      disabled={@disabled}
      text_value={@text_value}
      class={
        [
          "rt-reset",
          "rt-BaseMenuItem",
          "rt-BaseMenuSubTrigger",
          "rt-ContextMenuItem",
          "rt-ContextMenuSubTrigger",
          @class,
          @rest[:class]
        ]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      {Map.delete(@rest, :class)}
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

  @doc """
  Content of a sub-menu.
  """
  attr :id, :string, default: nil
  attr :side, :string, values: ["top", "right", "bottom", "left"], default: "right"
  attr :align, :string, values: ["start", "center", "end"], default: "start"
  attr :side_offset, :integer, default: 1
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :class, :string, default: nil
  ColorProps.attrs()
  HighContrastProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_sub_content(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        variant: %{type: :enum, class: "rt-variant", values: @variants, default: "solid"}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        class:
          [
            "rt-PopperContent",
            "rt-BaseMenuContent",
            "rt-BaseMenuSubContent",
            "rt-ContextMenuContent",
            "rt-ContextMenuSubContent",
            extracted.class,
            assigns.class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" ")
      )

    ~H"""
    <ContextMenuPrimitive.sub_content
      id={@id}
      side={@side}
      align={@align}
      side_offset={@side_offset}
      class={[@class, @rest[:class]] |> Enum.filter(& &1) |> Enum.join(" ")}
      data-accent-color={assigns[:color]}
      style="display: none; position: fixed; z-index: 10001; min-width: 8rem;"
      {Map.delete(@rest, :class)}
    >
      <div class="rt-BaseMenuViewport">
        {render_slot(@inner_block)}
      </div>
    </ContextMenuPrimitive.sub_content>
    """
  end
end
