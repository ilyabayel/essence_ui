---
title: Tabs
description: A set of layered sections of content—known as tab panels—that are displayed one at a time.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/tabs
---

A set of layered sections of content—known as tab panels—that are displayed one at a time.

<.demo theme="light" variant="primitive" component="tabs" css={primitive_css("tabs")}>

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

Import all parts and piece them together.

```heex
<Tabs.root>
  <Tabs.list>
    <Tabs.trigger />
  </Tabs.list>
  <Tabs.content />
</Tabs.root>
```

<.anatomy>
  <:part name="Root">Contains all the tabs component parts.</:part>
  <:part name="List">Contains the triggers that are aligned along the edge of the active content.</:part>
  <:part name="Trigger">The button that activates its associated content.</:part>
  <:part name="Content">Contains the content associated with each trigger.</:part>
</.anatomy>

## API Reference

### Root

Contains all the tabs component parts.

Use `value` with `on_value_change` for controlled tab state in LiveView:

```heex
<Tabs.root id="account-tabs" value={@tab} on_value_change="tabs_value_change">
  …
</Tabs.root>
```

```elixir
def handle_event("tabs_value_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :tab, value)}
end
```

<.props_table module={EssenceUI.Primitives.Tabs} function={:root} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the component.</:row>
</.data_attributes_table>

### List

Contains the triggers that are aligned along the edge of the active content.

<.props_table module={EssenceUI.Primitives.Tabs} function={:list} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the component.</:row>
</.data_attributes_table>

### Trigger

The button that activates its associated content.

<.props_table module={EssenceUI.Primitives.Tabs} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"active | inactive"}>Reflects whether the tab is active.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the tab is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the component.</:row>
</.data_attributes_table>

### Content

Contains the content associated with each trigger.

<.props_table module={EssenceUI.Primitives.Tabs} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"active | inactive"}>Reflects whether the tab is active.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the component.</:row>
</.data_attributes_table>

## Examples

### Vertical

You can create vertical tabs by using the `orientation` prop.

```heex
<Tabs.root id="tabs-vertical" default_value="tab1" orientation="vertical" class="TabsRoot TabsRootVertical">
  <Tabs.list aria-label="Tabs example" class="TabsList TabsListVertical">
    <Tabs.trigger value="tab1" class="TabsTrigger">One</Tabs.trigger>
    <Tabs.trigger value="tab2" class="TabsTrigger">Two</Tabs.trigger>
    <Tabs.trigger value="tab3" class="TabsTrigger">Three</Tabs.trigger>
  </Tabs.list>
  <Tabs.content value="tab1" class="TabsContent">Tab one content</Tabs.content>
  <Tabs.content value="tab2" class="TabsContent">Tab two content</Tabs.content>
  <Tabs.content value="tab3" class="TabsContent">Tab three content</Tabs.content>
</Tabs.root>
```

```css
.TabsRootVertical {
  flex-direction: row;
}
.TabsListVertical {
  flex-direction: column;
  border-bottom: none;
  border-right: 1px solid var(--mauve-6);
}
.TabsRootVertical .TabsTrigger:first-child {
  border-top-left-radius: 6px;
  border-top-right-radius: 0;
}
.TabsRootVertical .TabsTrigger:last-child {
  border-top-right-radius: 0;
}
.TabsRootVertical .TabsContent {
  border-bottom-left-radius: 0;
  border-top-right-radius: 6px;
}
```

## Accessibility

Adheres to the [Tabs WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tabs).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Tab">When focus moves onto the tabs, focuses the active trigger. When a trigger is focused, moves focus to the active content.</:row>
  <:row keys="ArrowDown">Moves focus to the next trigger depending on `orientation` and activates its associated content.</:row>
  <:row keys="ArrowRight">Moves focus to the next trigger depending on `orientation` and activates its associated content.</:row>
  <:row keys="ArrowUp">Moves focus to the previous trigger depending on `orientation` and activates its associated content.</:row>
  <:row keys="ArrowLeft">Moves focus to the previous trigger depending on `orientation` and activates its associated content.</:row>
  <:row keys="Home">Moves focus to the first trigger and activates its associated content.</:row>
  <:row keys="End">Moves focus to the last trigger and activates its associated content.</:row>
</.keyboard_table>
