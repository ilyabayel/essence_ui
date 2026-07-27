defmodule Storybook.Primitives.NavigationMenuStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.NavigationMenu

  def function, do: &NavigationMenu.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "navigation-menu"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI navigation menu demo",
        template: """
        <NavigationMenu.root
          id="nav-primitive"
          class="DemoNavigationMenuRoot"
        >
          <NavigationMenu.list class="DemoNavigationMenuList">
            <NavigationMenu.item value="learn">
              <NavigationMenu.trigger
                id="learn-trigger"
                content_id="learn-content"
                class="DemoNavigationMenuTrigger"
              >
                Learn <svg class="DemoCaretDown" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M4.18179 6.18181C4.35753 6.00608 4.64245 6.00608 4.81819 6.18181L7.49999 8.86362L10.1818 6.18181C10.3575 6.00608 10.6424 6.00608 10.8182 6.18181C10.9939 6.35755 10.9939 6.64247 10.8182 6.81821L7.81819 9.81821C7.73379 9.9026 7.61933 9.95001 7.49999 9.95001C7.38064 9.95001 7.26618 9.9026 7.18179 9.81821L4.18179 6.81821C4.00605 6.64247 4.00605 6.35755 4.18179 6.18181Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </NavigationMenu.trigger>
              <NavigationMenu.content
                id="learn-content"
                class="DemoNavigationMenuContent"
              >
                <ul class="DemoList one">
                  <li style="grid-row: span 3;">
                    <NavigationMenu.link
                      href="#"
                      class="DemoCallout"
                    >
                      <svg
                        aria-hidden="true"
                        width="38"
                        height="38"
                        viewBox="0 0 25 25"
                        fill="white"
                      >
                        <path d="M12 25C7.58173 25 4 21.4183 4 17C4 12.5817 7.58173 9 12 9V25Z"></path>
                        <path d="M12 0H4V8H12V0Z"></path>
                        <path d="M17 8C19.2091 8 21 6.20914 21 4C21 1.79086 19.2091 0 17 0C14.7909 0 13 1.79086 13 4C13 6.20914 14.7909 8 17 8Z"></path>
                      </svg>
                      <div class="DemoCalloutHeading">Essence UI</div>
                      <p class="DemoCalloutText">Accessible components for Phoenix LiveView.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="https://stitches.dev/"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Stitches</div>
                      <p class="DemoListItemText">CSS-in-JS with best-in-class developer experience.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/colors"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Colors</div>
                      <p class="DemoListItemText">Beautiful, thought-out palettes with auto dark mode.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/colors"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Icons</div>
                      <p class="DemoListItemText">A crisp set of 15x15 icons, balanced and consistent.</p>
                    </NavigationMenu.link>
                  </li>
                </ul>
              </NavigationMenu.content>
            </NavigationMenu.item>

            <NavigationMenu.item value="overview">
              <NavigationMenu.trigger
                id="overview-trigger"
                content_id="overview-content"
                class="DemoNavigationMenuTrigger"
              >
                Overview <svg class="DemoCaretDown" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M4.18179 6.18181C4.35753 6.00608 4.64245 6.00608 4.81819 6.18181L7.49999 8.86362L10.1818 6.18181C10.3575 6.00608 10.6424 6.00608 10.8182 6.18181C10.9939 6.35755 10.9939 6.64247 10.8182 6.81821L7.81819 9.81821C7.73379 9.9026 7.61933 9.95001 7.49999 9.95001C7.38064 9.95001 7.26618 9.9026 7.18179 9.81821L4.18179 6.81821C4.00605 6.64247 4.00605 6.35755 4.18179 6.18181Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </NavigationMenu.trigger>
              <NavigationMenu.content
                id="overview-content"
                class="DemoNavigationMenuContent"
              >
                <ul class="DemoList two">
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/overview/introduction"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Introduction</div>
                      <p class="DemoListItemText">Build high-quality, accessible design systems and web apps.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/overview/getting-started"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Getting started</div>
                      <p class="DemoListItemText">A quick tutorial to get you up and running with Essence UI.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/guides/styling"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Styling</div>
                      <p class="DemoListItemText">Unstyled and compatible with any styling solution.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/guides/animation"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Animation</div>
                      <p class="DemoListItemText">Use CSS keyframes or any animation library of your choice.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/overview/accessibility"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Accessibility</div>
                      <p class="DemoListItemText">Tested in a range of browsers and assistive technologies.</p>
                    </NavigationMenu.link>
                  </li>
                  <li>
                    <NavigationMenu.link
                      href="/primitives/docs/overview/releases"
                      class="DemoListItemLink"
                    >
                      <div class="DemoListItemHeading">Releases</div>
                      <p class="DemoListItemText">Essence UI releases and their changelogs.</p>
                    </NavigationMenu.link>
                  </li>
                </ul>
              </NavigationMenu.content>
            </NavigationMenu.item>

            <NavigationMenu.item value="github">
              <NavigationMenu.link
                class="DemoNavigationMenuLink"
                href="https://github.com/ilyabayel/essence_ui"
              >
                Github
              </NavigationMenu.link>
            </NavigationMenu.item>

            <NavigationMenu.indicator class="DemoNavigationMenuIndicator">
              <div class="DemoArrow"></div>
            </NavigationMenu.indicator>
          </NavigationMenu.list>

          <div class="DemoViewportPosition">
            <NavigationMenu.viewport class="DemoNavigationMenuViewport" />
          </div>
        </NavigationMenu.root>
        """
      }
    ]
  end
end
