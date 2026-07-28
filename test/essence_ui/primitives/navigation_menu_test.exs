defmodule EssenceUI.Primitives.NavigationMenuTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.NavigationMenu

  test "renders navigation menu parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <NavigationMenu.root id="nav" orientation="horizontal" delay_duration={100}>
            <NavigationMenu.list>
              <NavigationMenu.item value="products">
                <NavigationMenu.trigger id="products-trigger" content_id="products-content">
                  Products
                </NavigationMenu.trigger>
                <NavigationMenu.content id="products-content">
                  <NavigationMenu.link href="/a" active>Overview</NavigationMenu.link>
                  <NavigationMenu.link href="/b">Details</NavigationMenu.link>
                </NavigationMenu.content>
              </NavigationMenu.item>
              <NavigationMenu.item value="about">
                <NavigationMenu.link href="/about">About</NavigationMenu.link>
              </NavigationMenu.item>
            </NavigationMenu.list>
            <NavigationMenu.viewport />
            <NavigationMenu.indicator />
            <NavigationMenu.sub>
              Nested
            </NavigationMenu.sub>
          </NavigationMenu.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="NavigationMenuRoot"]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ ~s[data-delay-duration="100"]
    assert html =~ "data-radix-navigation-menu-list"
    assert html =~ "data-radix-navigation-menu-item"
    assert html =~ "data-radix-navigation-menu-trigger"
    assert html =~ "data-radix-navigation-menu-content"
    assert html =~ "data-radix-navigation-menu-link"
    assert html =~ ~s[data-active]
    assert html =~ "data-radix-navigation-menu-viewport"
    assert html =~ "data-radix-navigation-menu-indicator"
    assert html =~ "data-radix-navigation-menu-sub"
  end
end
