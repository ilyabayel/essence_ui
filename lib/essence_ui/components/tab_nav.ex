defmodule EssenceUI.Components.TabNav do
  @moduledoc """
  TabNav component styled per Radix Themes TabNav.

  Wraps `EssenceUI.Primitives.NavigationMenu` root, list, item, and link.

  ## Examples

      <.tab_nav id="account-nav">
        <.tab_nav_link href="/account" active>Account</.tab_nav_link>
        <.tab_nav_link href="/documents">Documents</.tab_nav_link>
        <.tab_nav_link href="/settings">Settings</.tab_nav_link>
      </.tab_nav>
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.NavigationMenu
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @doc """
  TabNav root (NavigationMenu root + list).
  """
  attr :id, :string, default: nil
  attr :size, :string, values: ["1", "2"], default: "2"
  attr :wrap, :string, values: ["nowrap", "wrap", "wrap-reverse"]
  attr :justify, :string, values: ["start", "center", "end"]
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def tab_nav(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: ["1", "2"], default: "2", responsive: true},
        wrap: %{
          type: :enum,
          class: "rt-r-fw",
          values: ["nowrap", "wrap", "wrap-reverse"],
          responsive: true
        },
        justify: %{
          type: :enum,
          class: "rt-r-jc",
          values: ["start", "center", "end"],
          responsive: true
        },
        high_contrast: %{type: :boolean, class: "rt-high-contrast"}
      }
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)
    id = assigns[:id] || "tab-nav-#{System.unique_integer([:positive])}"

    list_class =
      ["rt-reset", "rt-BaseTabList", "rt-TabNavList", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        id: id,
        list_class: list_class,
        list_style: [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join("; "),
        color: assigns[:color]
      )

    ~H"""
    <NavigationMenu.root
      id={@id}
      class="rt-TabNavRoot"
      data-accent-color={@color}
      {@rest}
    >
      <NavigationMenu.list class={@list_class} style={@list_style}>
        {render_slot(@inner_block)}
      </NavigationMenu.list>
    </NavigationMenu.root>
    """
  end

  @doc """
  Individual link within TabNav (NavigationMenu item + link).
  """
  attr :id, :string, default: nil
  attr :href, :string, default: nil
  attr :active, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def tab_nav_link(assigns) do
    class =
      ["rt-reset", "rt-BaseTabListTrigger", "rt-TabNavLink", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <NavigationMenu.item class="rt-TabNavItem">
      <NavigationMenu.link
        id={@id}
        href={@href}
        active={@active}
        class={@class}
        style={@style}
        {@rest}
      >
        <span class="rt-BaseTabListTriggerInner rt-TabNavLinkInner">
          {render_slot(@inner_block)}
        </span>
        <span class="rt-BaseTabListTriggerInnerHidden rt-TabNavLinkInnerHidden" aria-hidden="true">
          {render_slot(@inner_block)}
        </span>
      </NavigationMenu.link>
    </NavigationMenu.item>
    """
  end
end
