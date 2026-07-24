defmodule EssenceUI.Components.TabNavTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.TabNav

  test "renders themes tab nav via navigation menu primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <TabNav.tab_nav id="nav" size="2" color="crimson" high_contrast>
            <TabNav.tab_nav_link href="/account" active>Account</TabNav.tab_nav_link>
            <TabNav.tab_nav_link href="/docs">Documents</TabNav.tab_nav_link>
          </TabNav.tab_nav>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="NavigationMenuRoot")
    assert html =~ "rt-TabNavRoot"
    assert html =~ "rt-BaseTabList"
    assert html =~ "rt-TabNavList"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-high-contrast"
    assert html =~ ~s(data-accent-color="crimson")
    assert html =~ "rt-TabNavItem"
    assert html =~ "rt-TabNavLink"
    assert html =~ "rt-BaseTabListTriggerInner"
    assert html =~ "rt-TabNavLinkInner"
    assert html =~ "rt-TabNavLinkInnerHidden"
    assert html =~ ~s(data-essence-navigation-menu-link)
    assert html =~ ~s(href="/account")
  end
end
