defmodule EssenceUI.Components.ContextMenu do
  @moduledoc """
  A Context Menu component that displays a menu when a user right-clicks an element.

  Based on Radix UI ContextMenu component.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps

  require ColorProps
  require HighContrastProps

  @doc """
  Root container for context menu.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  slot :inner_block, required: true

  def context_menu_root(assigns) do
    assigns = assign_new(assigns, :id, fn -> "context-menu-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div
      id={@id}
      class={["rt-ContextMenuRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: contents;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      phx-hook="ContextMenu"
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The trigger area that opens the context menu on right-click.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_trigger(assigns) do
    ~H"""
    <div
      class={["rt-ContextMenuTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={@style}
      data-context-menu-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @sizes ["1", "2"]
  @variants ["solid", "soft"]

  @doc """
  The context menu content.
  """
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  ColorProps.attrs()
  HighContrastProps.attrs()
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
      assign(assigns,
        class:
          ["rt-BaseMenuContent", "rt-ContextMenuContent", extracted.class, assigns.class]
          |> Enum.filter(& &1)
          |> Enum.join(" "),
        style:
          ["display: none; position: fixed; z-index: 9999; min-width: 8rem;", extracted.style, assigns.style]
          |> Enum.filter(&(&1 != ""))
          |> Enum.join("; ")
      )

    ~H"""
    <div
      class={@class}
      style={@style}
      data-context-menu-content
      data-accent-color={assigns[:color]}
      tabindex="-1"
    >
      <div class="rt-BaseMenuViewport" role="menu">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  @doc """
  A standard menu item.
  """
  attr :shortcut, :string, default: nil
  attr :color, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global, include: ~w(phx-click phx-target value href)
  slot :inner_block, required: true

  def context_menu_item(assigns) do
    ~H"""
    <div
      role="menuitem"
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={@style}
      data-disabled={if @disabled, do: "", else: nil}
      data-accent-color={@color}
      tabindex="-1"
      {@rest}
    >
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </div>
    """
  end

  @doc """
  Visual separator between items.
  """
  attr :class, :string, default: nil

  def context_menu_separator(assigns) do
    ~H"""
    <div
      role="separator"
      class={
        ["rt-BaseMenuSeparator", "rt-ContextMenuSeparator", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
    >
    </div>
    """
  end

  @doc """
  Non-interactive label.
  """
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def context_menu_label(assigns) do
    ~H"""
    <div class={
      ["rt-BaseMenuLabel", "rt-ContextMenuLabel", @class] |> Enum.filter(& &1) |> Enum.join(" ")
    }>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Menu item with checkbox functionality.
  """
  attr :checked, :boolean, default: false
  attr :shortcut, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def context_menu_checkbox_item(assigns) do
    ~H"""
    <div
      role="menuitemcheckbox"
      aria-checked={to_string(@checked)}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuItem", "rt-BaseMenuCheckboxItem", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-disabled={if @disabled, do: "", else: nil}
      tabindex="-1"
      {@rest}
    >
      <div class="rt-BaseMenuItemIndicator">
        <%= if @checked do %>
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
        <% end %>
      </div>
      {render_slot(@inner_block)}
      <%= if @shortcut do %>
        <div class="rt-BaseMenuShortcut">{@shortcut}</div>
      <% end %>
    </div>
    """
  end

  @doc """
  Sub-menu container.
  """
  slot :inner_block, required: true

  def context_menu_sub(assigns) do
    ~H"""
    <div class="rt-ContextMenuSub" data-context-menu-sub>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Trigger for a sub-menu.
  """
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def context_menu_sub_trigger(assigns) do
    ~H"""
    <div
      role="menuitem"
      aria-haspopup="menu"
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-ContextMenuSubTrigger", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-context-menu-sub-trigger
      tabindex="-1"
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
    </div>
    """
  end

  @doc """
  Content of a sub-menu.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  slot :inner_block, required: true

  def context_menu_sub_content(assigns) do
    ~H"""
    <div
      class={
        ["rt-BaseMenuContent", "rt-ContextMenuSubContent", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={
        ["display: none; position: fixed; z-index: 10001; min-width: 8rem;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      data-context-menu-sub-content
    >
      <div class="rt-BaseMenuViewport" role="menu">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
