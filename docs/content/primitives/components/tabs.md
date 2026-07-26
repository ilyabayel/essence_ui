---
title: Tabs
description: A set of layered sections of content—known as tab panels—that are displayed one at a time.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/tabs
---

A set of layered sections of content—known as tab panels—that are displayed one at a time.

<.demo variant="primitive" component="tabs" css={primitive_css("tabs")}>

  <:heex>
    <Tabs.root
              id="tabs-primitive"
              class="TabsRoot"
              default_value="tab1"
            >
              <Tabs.list
                class="TabsList"
                aria-label="Manage your account"
              >
                <Tabs.trigger
                  class="TabsTrigger"
                  value="tab1"
                >
                  Account
                </Tabs.trigger>
                <Tabs.trigger
                  class="TabsTrigger"
                  value="tab2"
                >
                  Password
                </Tabs.trigger>
              </Tabs.list>
              <Tabs.content
                class="TabsContent"
                value="tab1"
              >
                <p class="Text">
                  Make changes to your account here. Click save when you're done.
                </p>
                <fieldset class="Fieldset">
                  <label
                    class="Label"
                    for="name"
                  >
                    Name
                  </label>
                  <input
                    class="Input"
                    id="name"
                    value="Pedro Duarte"
                  />
                </fieldset>
                <fieldset class="Fieldset">
                  <label
                    class="Label"
                    for="username"
                  >
                    Username
                  </label>
                  <input
                    class="Input"
                    id="username"
                    value="@peduarte"
                  />
                </fieldset>
                <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
                  <button class="Button green">Save changes</button>
                </div>
              </Tabs.content>
              <Tabs.content
                class="TabsContent"
                value="tab2"
              >
                <p class="Text">
                  Change your password here. After saving, you'll be logged out.
                </p>
                <fieldset class="Fieldset">
                  <label
                    class="Label"
                    for="currentPassword"
                  >
                    Current password
                  </label>
                  <input
                    class="Input"
                    id="currentPassword"
                    type="password"
                  />
                </fieldset>
                <fieldset class="Fieldset">
                  <label
                    class="Label"
                    for="newPassword"
                  >
                    New password
                  </label>
                  <input
                    class="Input"
                    id="newPassword"
                    type="password"
                  />
                </fieldset>
                <fieldset class="Fieldset">
                  <label
                    class="Label"
                    for="confirmPassword"
                  >
                    Confirm password
                  </label>
                  <input
                    class="Input"
                    id="confirmPassword"
                    type="password"
                  />
                </fieldset>
                <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
                  <button class="Button green">Change password</button>
                </div>
              </Tabs.content>
            </Tabs.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Supports horizontal/vertical orientation.</:item>
  <:item>Supports automatic/manual activation.</:item>
  <:item>Full keyboard navigation.</:item>
</.highlights>

## Anatomy

```heex
<Tabs.root>
  <Tabs.list />
  <Tabs.trigger />
  <Tabs.content />
</Tabs.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="List">The `list` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Content">The `content` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Tabs} function={:root} />

### List

<.props_table module={EssenceUI.Primitives.Tabs} function={:list} />

### Trigger

<.props_table module={EssenceUI.Primitives.Tabs} function={:trigger} />

### Content

<.props_table module={EssenceUI.Primitives.Tabs} function={:content} />

## Examples

### Default value

```heex
<Tabs.root id="account-tabs" default_value="tab1" class="TabsRoot">
  …
</Tabs.root>
```

### Vertical orientation

Pass orientation via attrs/classes when supported by your styles (`data-orientation` / layout CSS).

### Animate content

```css
.TabsContent[data-state="active"] {
  animation: fadeIn 150ms ease;
}
```

See `storybook/primitives/tabs.story.exs` for the account/password demo.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tabs).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
