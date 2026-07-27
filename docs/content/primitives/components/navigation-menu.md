---
title: Navigation Menu
description: A collection of links for navigating websites.
aria: https://www.w3.org/TR/wai-aria/#navigation
---

A collection of links for navigating websites.

<.demo theme="light" variant="primitive" component="navigation-menu" css={primitive_css("navigation-menu")}>

  <:heex>
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
                            viewBox="0 0 38 38"
                            fill="none"
                            stroke="white"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                          >
                            <!-- Flask body -->
                            <path d="M14 5 v13 c0 1.5 -0.75 3 -2 4.5 l-4 6 c-2 3 0 7 4 7 h14 c4 0 6-4 4-7 l-4-6 c-1.25-1.5-2-3-2-4.5 V5"/>
                            <!-- Flask liquid (optional, subtle fill) -->
                            <path d="M14 27 q5 3 10 0" stroke="white" fill="none"/>
                            <!-- Flask rim -->
                            <ellipse cx="19" cy="5" rx="5" ry="2"/>
                            <!-- Steam lines -->
                            <path d="M16 2 q-1 1 0 2"/>
                            <path d="M19 1 q1 1 0 2"/>
                            <path d="M22 2 q1 1 0 2"/>
                          </svg>
                     
                          <div class="DemoCalloutHeading">Essence UI</div>
                          <p class="DemoCalloutText">Unstyled, accessible components for Phoenix LiveView.</p>
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
                          href="/primitives/docs/overview/introduction"
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
                          <p class="DemoListItemText">A quick tutorial to get you up and running with Essence UI Primitives.</p>
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
                          <p class="DemoListItemText">Essence UI Primitives releases and their changelogs.</p>
                        </NavigationMenu.link>
                      </li>
                    </ul>
                  </NavigationMenu.content>
                </NavigationMenu.item>

                <NavigationMenu.item value="github">
                  <NavigationMenu.link
                    class="DemoNavigationMenuLink"
                    href="https://github.com/"
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
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Flexible layout structure with managed tab focus.</:item>
  <:item>Supports submenus.</:item>
  <:item>Optional active item indicator.</:item>
  <:item>Full keyboard navigation.</:item>
  <:item>Exposes CSS variables for advanced animation.</:item>
  <:item>Supports custom timings.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<NavigationMenu.root id="…">
  <NavigationMenu.list>
    <NavigationMenu.item>
      <NavigationMenu.trigger content_id="…" />
      <NavigationMenu.content id="…">
        <NavigationMenu.link />
      </NavigationMenu.content>
    </NavigationMenu.item>

    <NavigationMenu.item>
      <NavigationMenu.link />
    </NavigationMenu.item>

    <NavigationMenu.item>
      <NavigationMenu.trigger content_id="…" />
      <NavigationMenu.content id="…">
        <NavigationMenu.sub>
          <NavigationMenu.list />
          <NavigationMenu.viewport />
        </NavigationMenu.sub>
      </NavigationMenu.content>
    </NavigationMenu.item>

    <NavigationMenu.indicator />
  </NavigationMenu.list>

  <NavigationMenu.viewport />
</NavigationMenu.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a navigation menu.</:part>
  <:part name="List">Contains the top level menu items.</:part>
  <:part name="Item">A top level menu item containing a link or trigger/content pair.</:part>
  <:part name="Trigger">The button that toggles the content. Set `content_id` to the content element's `id`.</:part>
  <:part name="Content">Contains the content associated with each trigger.</:part>
  <:part name="Link">A navigational link. Use for all links inside the menu, including within content panels.</:part>
  <:part name="Indicator">Optional element that highlights the active trigger.</:part>
  <:part name="Viewport">Optional viewport that renders active content outside the list.</:part>
  <:part name="Sub">Signifies a submenu. Use in place of `root` when nested inside content.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a navigation menu.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:root} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

### Sub

Signifies a submenu. Use in place of the root part when nested to create a submenu.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:sub} />

### List

Contains the top level menu items.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:list} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

### Item

A top level menu item, contains a link or trigger with content combination.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:item} />

### Trigger

The button that toggles the content.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the content is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the trigger is disabled.</:row>
</.data_attributes_table>

### Content

Contains the content associated with each trigger.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the content is open.</:row>
  <:row name="[data-motion]" values={"to-start | to-end | from-start | from-end"}>Enter/exit direction when animating between items.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

### Link

A navigational link.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:link} />

<.data_attributes_table>
  <:row name="[data-active]" values="Present when active">Present when the link is the active page.</:row>
</.data_attributes_table>

### Indicator

An optional indicator element that renders below the list and highlights the currently active trigger.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:indicator} />

<.data_attributes_table>
  <:row name="[data-state]" values={"visible | hidden"}>Reflects whether the indicator is visible.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

### Viewport

An optional viewport element used to render active content outside of the list.

<.props_table module={EssenceUI.Primitives.NavigationMenu} function={:viewport} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the viewport is open.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the menu.</:row>
</.data_attributes_table>

## Examples

### Vertical

You can create a vertical menu by using the `orientation` prop:

```heex
<NavigationMenu.root id="nav-vertical" orientation="vertical" class="DemoNavigationMenuRoot">
  <NavigationMenu.list class="DemoNavigationMenuList">
    <NavigationMenu.item value="one">
      <NavigationMenu.trigger id="nav-v-one-trigger" content_id="nav-v-one-content" class="DemoNavigationMenuTrigger">
        Item one
      </NavigationMenu.trigger>
      <NavigationMenu.content id="nav-v-one-content" class="DemoNavigationMenuContent">
        Item one content
      </NavigationMenu.content>
    </NavigationMenu.item>
    <NavigationMenu.item value="two">
      <NavigationMenu.trigger id="nav-v-two-trigger" content_id="nav-v-two-content" class="DemoNavigationMenuTrigger">
        Item two
      </NavigationMenu.trigger>
      <NavigationMenu.content id="nav-v-two-content" class="DemoNavigationMenuContent">
        Item two content
      </NavigationMenu.content>
    </NavigationMenu.item>
  </NavigationMenu.list>
</NavigationMenu.root>
```

### Flexible layouts

Use the `viewport` part when you need extra control over where `content` is rendered. Tab focus is maintained automatically.

```heex
<NavigationMenu.root id="nav-viewport" class="DemoNavigationMenuRoot">
  <NavigationMenu.list class="DemoNavigationMenuList">
    <NavigationMenu.item value="one">
      <NavigationMenu.trigger id="nav-one-trigger" content_id="nav-one-content" class="DemoNavigationMenuTrigger">
        Item one
      </NavigationMenu.trigger>
      <NavigationMenu.content id="nav-one-content" class="DemoNavigationMenuContent">
        Item one content
      </NavigationMenu.content>
    </NavigationMenu.item>
    <NavigationMenu.item value="two">
      <NavigationMenu.trigger id="nav-two-trigger" content_id="nav-two-content" class="DemoNavigationMenuTrigger">
        Item two
      </NavigationMenu.trigger>
      <NavigationMenu.content id="nav-two-content" class="DemoNavigationMenuContent">
        Item two content
      </NavigationMenu.content>
    </NavigationMenu.item>
  </NavigationMenu.list>

  <%!-- NavigationMenu.content is rendered here when active --%>
  <NavigationMenu.viewport class="DemoNavigationMenuViewport" />
</NavigationMenu.root>
```

### With indicator

Use the optional `indicator` part to highlight the active trigger:

```heex
<NavigationMenu.list class="DemoNavigationMenuList">
  …
  <NavigationMenu.indicator class="DemoNavigationMenuIndicator">
    <div class="DemoArrow"></div>
  </NavigationMenu.indicator>
</NavigationMenu.list>
<NavigationMenu.viewport class="DemoNavigationMenuViewport" />
```

```css
.DemoNavigationMenuIndicator {
  background-color: var(--violet-9);
}
.DemoNavigationMenuIndicator[data-orientation="horizontal"] {
  height: 3px;
  transition: width, transform, 250ms ease;
}
```

### With submenus

Create a submenu by nesting `NavigationMenu.sub` inside `content`:

```heex
<NavigationMenu.item value="two">
  <NavigationMenu.trigger id="nav-sub-trigger" content_id="nav-sub-content" class="DemoNavigationMenuTrigger">
    Item two
  </NavigationMenu.trigger>
  <NavigationMenu.content id="nav-sub-content" class="DemoNavigationMenuContent">
    <NavigationMenu.sub>
      <NavigationMenu.list class="DemoNavigationMenuList">
        <NavigationMenu.item value="sub1">
          <NavigationMenu.trigger id="nav-sub1-trigger" content_id="nav-sub1-content" class="DemoNavigationMenuTrigger">
            Sub item one
          </NavigationMenu.trigger>
          <NavigationMenu.content id="nav-sub1-content" class="DemoNavigationMenuContent">
            Sub item one content
          </NavigationMenu.content>
        </NavigationMenu.item>
        <NavigationMenu.item value="sub2">
          <NavigationMenu.trigger id="nav-sub2-trigger" content_id="nav-sub2-content" class="DemoNavigationMenuTrigger">
            Sub item two
          </NavigationMenu.trigger>
          <NavigationMenu.content id="nav-sub2-content" class="DemoNavigationMenuContent">
            Sub item two content
          </NavigationMenu.content>
        </NavigationMenu.item>
      </NavigationMenu.list>
    </NavigationMenu.sub>
  </NavigationMenu.content>
</NavigationMenu.item>
```

### With LiveView routing

Use `NavigationMenu.link` with the `active` prop to mark the current page:

```heex
<NavigationMenu.root id="nav-routes" class="DemoNavigationMenuRoot">
  <NavigationMenu.list class="DemoNavigationMenuList">
    <NavigationMenu.item value="home">
      <NavigationMenu.link href="/" class="DemoNavigationMenuLink" active={@current_path == "/"}>
        Home
      </NavigationMenu.link>
    </NavigationMenu.item>
    <NavigationMenu.item value="about">
      <NavigationMenu.link href="/about" class="DemoNavigationMenuLink" active={@current_path == "/about"}>
        About
      </NavigationMenu.link>
    </NavigationMenu.item>
  </NavigationMenu.list>
</NavigationMenu.root>
```

```css
.DemoNavigationMenuLink {
  text-decoration: none;
}
.DemoNavigationMenuLink[data-active] {
  text-decoration: underline;
}
```

### Advanced animation

Essence exposes `--radix-navigation-menu-viewport-width`, `--radix-navigation-menu-viewport-height`, and `data-motion` on content to animate viewport size and content position based on enter/exit direction:

```heex
<NavigationMenu.content id="nav-anim-content" class="DemoNavigationMenuContent">
  Item one content
</NavigationMenu.content>
…
<NavigationMenu.viewport class="DemoNavigationMenuViewport" />
```

```css
.DemoNavigationMenuContent {
  position: absolute;
  top: 0;
  left: 0;
  animation-duration: 250ms;
  animation-timing-function: ease;
}
.DemoNavigationMenuContent[data-motion="from-start"] {
  animation-name: enterFromLeft;
}
.DemoNavigationMenuContent[data-motion="from-end"] {
  animation-name: enterFromRight;
}
.DemoNavigationMenuContent[data-motion="to-start"] {
  animation-name: exitToLeft;
}
.DemoNavigationMenuContent[data-motion="to-end"] {
  animation-name: exitToRight;
}

.DemoNavigationMenuViewport {
  position: relative;
  width: var(--radix-navigation-menu-viewport-width);
  height: var(--radix-navigation-menu-viewport-height);
  transition: width, height, 250ms ease;
}

@keyframes enterFromRight {
  from { opacity: 0; transform: translateX(200px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes enterFromLeft {
  from { opacity: 0; transform: translateX(-200px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes exitToRight {
  from { opacity: 1; transform: translateX(0); }
  to { opacity: 0; transform: translateX(200px); }
}

@keyframes exitToLeft {
  from { opacity: 1; transform: translateX(0); }
  to { opacity: 0; transform: translateX(-200px); }
}
```

## Accessibility

Adheres to the [`navigation` role requirements](https://www.w3.org/TR/wai-aria-1.2/#navigation).

### Differences to menubar

`NavigationMenu` should not be confused with `menubar`. Although this primitive shares the colloquial name "menu", it does not use the WAI-ARIA `menu` role. Native application menus use complex focus management that is often [unnecessary for website navigation](https://github.com/w3c/aria-practices/issues/353).

See the W3C [Disclosure Navigation Menu](https://w3c.github.io/aria-practices/examples/disclosure/disclosure-navigation.html) example for more information.

### Link usage and aria-current

Use `NavigationMenu.link` for all navigational links within a menu—including links inside `NavigationMenu.content`. This ensures consistent keyboard interactions and gives access to the `active` prop for `aria-current` and active styles. See [With LiveView routing](#with-liveview-routing) above.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space, Enter">When focus is on `NavigationMenu.trigger`, opens the content.</:row>
  <:row keys="Tab">Moves focus to the next focusable element.</:row>
  <:row keys="ArrowDown">When horizontal and focus is on an open `NavigationMenu.trigger`, moves focus into `NavigationMenu.content`. Moves focus to the next `NavigationMenu.trigger` or `NavigationMenu.link`.</:row>
  <:row keys="ArrowUp">Moves focus to the previous `NavigationMenu.trigger` or `NavigationMenu.link`.</:row>
  <:row keys="ArrowRight, ArrowLeft">When vertical and focus is on an open `NavigationMenu.trigger`, moves focus into its `NavigationMenu.content`. Moves focus to the next/previous `NavigationMenu.trigger` or `NavigationMenu.link`.</:row>
  <:row keys="Home, End">Moves focus to the first/last `NavigationMenu.trigger` or `NavigationMenu.link`.</:row>
  <:row keys="Escape">Closes open `NavigationMenu.content` and moves focus to its `NavigationMenu.trigger`.</:row>
</.keyboard_table>
