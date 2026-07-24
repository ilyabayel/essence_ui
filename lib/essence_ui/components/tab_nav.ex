defmodule EssenceUI.Components.TabNav do
  @moduledoc """
  A set of links for navigating between different views.

  Based on Radix UI Themes TabNav component. Use `TabNav` for navigation links
  that styled like tabs.

  ## Examples

      <.tab_nav>
        <.tab_nav_link href="/account" active>Account</.tab_nav_link>
        <.tab_nav_link href="/documents">Documents</.tab_nav_link>
        <.tab_nav_link href="/settings">Settings</.tab_nav_link>
      </.tab_nav>

      <.tab_nav color="blue" size="1">
        <.tab_nav_link href="/overview" active>Overview</.tab_nav_link>
        <.tab_nav_link href="/details">Details</.tab_nav_link>
      </.tab_nav>
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @doc """
  TabNav root component.
  """
  attr :size, :string, values: ["1", "2"], default: "2"
  attr :wrap, :string, values: ["nowrap", "wrap", "wrap-reverse"], doc: "Flex wrap. Responsive supported."
  attr :justify, :string, values: ["start", "center", "end"], doc: "Justify content. Responsive supported."
  ColorProps.attrs()
  HighContrastProps.attrs()
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
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        extracted_class: extracted.class,
        extracted_style: extracted.style,
        color: assigns[:color] || false
      )

    ~H"""
    <nav
      class={
        [
          "rt-BaseTabList",
          "rt-TabNavRoot",
          @extracted_class,
          @class
        ]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={[@extracted_style, @style] |> Enum.filter(& &1) |> Enum.join("; ")}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block)}
    </nav>
    """
  end

  @doc """
  Individual link within TabNav.
  """
  attr :href, :string, default: nil
  attr :as, :string, default: "a"
  attr :active, :boolean, default: false
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def tab_nav_link(assigns) do
    ~H"""
    <.dynamic_tag
      tag_name={@as}
      class={
        ["rt-reset", "rt-BaseTabListTrigger", "rt-TabNavLink", @class]
        |> Enum.filter(& &1)
        |> Enum.join(" ")
      }
      style={@style}
      data-active={@active}
      {Map.merge(%{href: @href}, @rest)}
    >
      <span class="rt-BaseTabListTriggerInner rt-TabNavLinkInner">
        {render_slot(@inner_block)}
      </span>
      <span class="rt-BaseTabListTriggerInnerHidden rt-TabNavLinkInnerHidden" aria-hidden="true">
        {render_slot(@inner_block)}
      </span>
    </.dynamic_tag>
    """
  end
end
