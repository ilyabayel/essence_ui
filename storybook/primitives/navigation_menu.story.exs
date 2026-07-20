defmodule Storybook.Primitives.NavigationMenuStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.NavigationMenu

  def function, do: &NavigationMenu.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless navigation menu primitive",
        template: """
        <NavigationMenu.root id="nav-primitive" delay_duration={100} style="position: relative;">
          <NavigationMenu.list style="display: flex; gap: 8px; list-style: none; margin: 0; padding: 0;">
            <NavigationMenu.item value="products" style="position: relative;">
              <NavigationMenu.trigger id="products-trigger" content_id="products-content" style="padding: 6px 12px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
                Products
              </NavigationMenu.trigger>
              <NavigationMenu.content id="products-content" style="position: absolute; top: 100%; left: 0; margin-top: 4px; background: white; border: 1px solid #ccc; border-radius: 6px; padding: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); min-width: 180px;">
                <NavigationMenu.link href="#" style="display: block; padding: 4px 0; color: #333; text-decoration: none;">Overview</NavigationMenu.link>
                <NavigationMenu.link href="#" style="display: block; padding: 4px 0; color: #333; text-decoration: none;">Features</NavigationMenu.link>
              </NavigationMenu.content>
            </NavigationMenu.item>
            <NavigationMenu.item value="about">
              <NavigationMenu.link href="#" style="display: inline-block; padding: 6px 12px; color: #333; text-decoration: none;">About</NavigationMenu.link>
            </NavigationMenu.item>
          </NavigationMenu.list>
          <NavigationMenu.viewport />
          <NavigationMenu.indicator style="height: 2px; background: #333; bottom: 0;" />
        </NavigationMenu.root>
        """
      }
    ]
  end
end
