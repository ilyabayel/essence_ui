defmodule EssenceUI.Components.DropdownMenu do
  @moduledoc """
  A Dropdown Menu component that displays a menu when a user clicks a button.

  Based on Radix UI DropdownMenu component.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps

  require ColorProps
  require HighContrastProps

  @doc """
  Root container for dropdown menu.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  slot :inner_block, required: true

  def dropdown_menu_root(assigns) do
    assigns = assign_new(assigns, :id, fn -> "dropdown-menu-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div
      id={@id}
      class={["rt-DropdownMenuRoot", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={
        ["display: inline-block; position: relative;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      phx-hook="DropdownMenu"
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The trigger area that opens the dropdown menu on click.
  """
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_trigger(assigns) do
    ~H"""
    <div
      class={["rt-DropdownMenuTrigger", @class] |> Enum.filter(& &1) |> Enum.join(" ")}
      style={["display: inline-flex;", @style] |> Enum.filter(&(&1 != "")) |> Enum.join("; ")}
      data-dropdown-menu-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  An optional icon part for the trigger.
  """
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

  @sizes ["1", "2"]
  @variants ["solid", "soft"]

  @doc """
  The dropdown menu content.
  """
  attr :size, :string, values: @sizes, default: "2"
  attr :variant, :string, values: @variants, default: "solid"
  attr :class, :string, default: nil
  attr :style, :string, default: ""
  ColorProps.attrs()
  HighContrastProps.attrs()
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

    assigns =
      assign(assigns,
        class:
          ["rt-BaseMenuContent", "rt-DropdownMenuContent", extracted.class, assigns.class]
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
      data-dropdown-menu-content
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

  def dropdown_menu_item(assigns) do
    ~H"""
    <div
      role="menuitem"
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", @class]
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

  def dropdown_menu_separator(assigns) do
    ~H"""
    <div
      role="separator"
      class={
        ["rt-BaseMenuSeparator", "rt-DropdownMenuSeparator", @class]
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

  def dropdown_menu_label(assigns) do
    ~H"""
    <div class={
      ["rt-BaseMenuLabel", "rt-DropdownMenuLabel", @class] |> Enum.filter(& &1) |> Enum.join(" ")
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

  def dropdown_menu_checkbox_item(assigns) do
    ~H"""
    <div
      role="menuitemcheckbox"
      aria-checked={to_string(@checked)}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", "rt-BaseMenuCheckboxItem", @class]
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
  Menu item with radio functionality.
  """
  attr :checked, :boolean, default: false
  attr :shortcut, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown_menu_radio_item(assigns) do
    ~H"""
    <div
      role="menuitemradio"
      aria-checked={to_string(@checked)}
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuItem", "rt-BaseMenuRadioItem", @class]
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
              d="M7.5 10C8.88071 10 10 8.88071 10 7.5C10 6.11929 8.88071 5 7.5 5C6.11929 5 5 6.11929 5 7.5C5 8.88071 6.11929 10 7.5 10Z"
              fill="currentColor"
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

  def dropdown_menu_sub(assigns) do
    ~H"""
    <div class="rt-DropdownMenuSub" data-dropdown-menu-sub>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Trigger for a sub-menu.
  """
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def dropdown_menu_sub_trigger(assigns) do
    ~H"""
    <div
      role="menuitem"
      aria-haspopup="menu"
      class={
        ["rt-reset", "rt-BaseMenuItem", "rt-DropdownMenuSubTrigger", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      data-dropdown-menu-sub-trigger
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

  def dropdown_menu_sub_content(assigns) do
    ~H"""
    <div
      class={
        ["rt-BaseMenuContent", "rt-DropdownMenuSubContent", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={
        ["display: none; position: fixed; z-index: 10001; min-width: 8rem;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
      data-dropdown-menu-sub-content
    >
      <div class="rt-BaseMenuViewport" role="menu">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
