---
title: Accordion
description: A vertically stacked set of interactive headings that each reveal an associated section of content.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/accordion
---

A vertically stacked set of interactive headings that each reveal an associated section of content.

<.demo variant="primitive" component="accordion" css={primitive_css("accordion")}>
  <:heex>
    <Accordion.root
      id="accordion-primitive"
      type="single"
      default_value="item-1"
      collapsible={true}
      class="DemoAccordionRoot"
    >
      <Accordion.item
        id="accordion-primitive-1-root"
        value="item-1"
        class="DemoAccordionItem"
      >
        <Accordion.header class="DemoAccordionHeader">
          <Accordion.trigger
            id="accordion-primitive-1-content"
            trigger_id="accordion-primitive-1-trigger"
            class="DemoAccordionTrigger"
          >
            Is it accessible?
            <svg
              class="DemoAccordionChevron"
              width="15"
              height="15"
              viewBox="0 0 15 15"
              fill="none"
              aria-hidden="true"
            >
              <path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/>
            </svg>
          </Accordion.trigger>
        </Accordion.header>
        <Accordion.content
          id="accordion-primitive-1-content"
          trigger_id="accordion-primitive-1-trigger"
          class="DemoAccordionContent"
        >
          <div class="DemoAccordionContentText">Yes. It adheres to the WAI-ARIA design pattern.</div>
        </Accordion.content>
      </Accordion.item>
      <Accordion.item
        id="accordion-primitive-2-root"
        value="item-2"
        class="DemoAccordionItem"
      >
        <Accordion.header class="DemoAccordionHeader">
          <Accordion.trigger
            id="accordion-primitive-2-content"
            trigger_id="accordion-primitive-2-trigger"
            class="DemoAccordionTrigger"
          >
            Is it unstyled?
            <svg
              class="DemoAccordionChevron"
              width="15"
              height="15"
              viewBox="0 0 15 15"
              fill="none"
              aria-hidden="true"
            >
              <path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/>
            </svg>
          </Accordion.trigger>
        </Accordion.header>
        <Accordion.content
          id="accordion-primitive-2-content"
          trigger_id="accordion-primitive-2-trigger"
          class="DemoAccordionContent"
        >
          <div class="DemoAccordionContentText">Yes. It's unstyled by default, giving you freedom over the look and feel.</div>
        </Accordion.content>
      </Accordion.item>
      <Accordion.item
        id="accordion-primitive-3-root"
        value="item-3"
        class="DemoAccordionItem"
      >
        <Accordion.header class="DemoAccordionHeader">
          <Accordion.trigger
            id="accordion-primitive-3-content"
            trigger_id="accordion-primitive-3-trigger"
            class="DemoAccordionTrigger"
          >
            Can it be animated?
            <svg
              class="DemoAccordionChevron"
              width="15"
              height="15"
              viewBox="0 0 15 15"
              fill="none"
              aria-hidden="true"
            >
              <path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/>
            </svg>
          </Accordion.trigger>
        </Accordion.header>
        <Accordion.content
          id="accordion-primitive-3-content"
          trigger_id="accordion-primitive-3-trigger"
          class="DemoAccordionContent"
        >
          <div class="DemoAccordionContentText">Yes! You can animate the Accordion with CSS or JavaScript.</div>
        </Accordion.content>
      </Accordion.item>
    </Accordion.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Supports horizontal/vertical orientation.</:item>
  <:item>Supports Right to Left direction.</:item>
  <:item>Can expand one or multiple items.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Accordion.root>
  <Accordion.item>
    <Accordion.header>
      <Accordion.trigger />
    </Accordion.header>
    <Accordion.content />
  </Accordion.item>
</Accordion.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of an accordion.</:part>
  <:part name="Item">Contains all the parts of a collapsible section.</:part>
  <:part name="Header">Wraps an `Accordion.trigger`. Renders as an `h3` by default.</:part>
  <:part name="Trigger">Toggles the collapsed state of its associated item. It should be nested inside of an `Accordion.header`.</:part>
  <:part name="Content">Contains the collapsible content for an item.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of an accordion.

Use `value` with `on_value_change` for controlled open state in LiveView:

```heex
<Accordion.root id="faq" type="single" value={@value} on_value_change="accordion_value_change">
  …
</Accordion.root>
```

```elixir
def handle_event("accordion_value_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, :value, value)}
end
```

<.props_table module={EssenceUI.Primitives.Accordion} function={:root} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the accordion.</:row>
</.data_attributes_table>

### Item

Contains all the parts of a collapsible section.

<.props_table module={EssenceUI.Primitives.Accordion} function={:item} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the item is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the accordion.</:row>
</.data_attributes_table>

### Header

Wraps an `Accordion.trigger`.

<.props_table module={EssenceUI.Primitives.Accordion} function={:header} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the item is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the accordion.</:row>
</.data_attributes_table>

### Trigger

Toggles the collapsed state of its associated item. It should be nested inside of an `Accordion.header`.

<.props_table module={EssenceUI.Primitives.Accordion} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the item is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the accordion.</:row>
</.data_attributes_table>

### Content

Contains the collapsible content for an item.

<.props_table module={EssenceUI.Primitives.Accordion} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the item is open.</:row>
  <:row name="[data-disabled]" values="Present when disabled">Present when the item is disabled.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the accordion.</:row>
</.data_attributes_table>

Essence exposes CSS variables on content for size animations:

| CSS variable | Description |
| --- | --- |
| `--essence-accordion-content-width` | The width of the content when it opens/closes |
| `--essence-accordion-content-height` | The height of the content when it opens/closes |

## Examples

### Expanded by default

Use the `default_value` prop to define the open item by default.

```heex
<Accordion.root id="accordion-default" type="single" default_value="item-2">
  <Accordion.item id="accordion-default-1" value="item-1">…</Accordion.item>
  <Accordion.item id="accordion-default-2" value="item-2">…</Accordion.item>
</Accordion.root>
```

### Allow collapsing all items

Use the `collapsible` prop to allow all items to close.

```heex
<Accordion.root id="accordion-collapsible" type="single" collapsible={true}>
  <Accordion.item id="accordion-collapsible-1" value="item-1">…</Accordion.item>
  <Accordion.item id="accordion-collapsible-2" value="item-2">…</Accordion.item>
</Accordion.root>
```

### Multiple items open at the same time

Set the `type` prop to `multiple` to enable opening multiple items at once.

```heex
<Accordion.root id="accordion-multiple" type="multiple">
  <Accordion.item id="accordion-multiple-1" value="item-1">…</Accordion.item>
  <Accordion.item id="accordion-multiple-2" value="item-2">…</Accordion.item>
</Accordion.root>
```

### Rotated icon when open

You can add extra decorative elements, such as chevrons, and rotate them when the item is open.

```heex
<Accordion.trigger id="item-1-content" trigger_id="item-1-trigger" class="DemoAccordionTrigger">
  <span>Trigger text</span>
  <svg class="DemoAccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
    <path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/>
  </svg>
</Accordion.trigger>
```

```css
.DemoAccordionChevron {
  transition: transform 300ms;
}
.DemoAccordionTrigger[data-state="open"] > .DemoAccordionChevron {
  transform: rotate(180deg);
}
```

### Horizontal orientation

Use the `orientation` prop to create a horizontal accordion.

```heex
<Accordion.root id="accordion-horizontal" orientation="horizontal">
  <Accordion.item id="accordion-horizontal-1" value="item-1">…</Accordion.item>
  <Accordion.item id="accordion-horizontal-2" value="item-2">…</Accordion.item>
</Accordion.root>
```

### Animating content size

Use the `--essence-accordion-content-width` and/or `--essence-accordion-content-height` CSS variables to animate the size of the content when it opens/closes:

```heex
<Accordion.content id="item-1-content" trigger_id="item-1-trigger" class="DemoAccordionContent">
  …
</Accordion.content>
```

```css
.DemoAccordionContent {
  overflow: hidden;
}
.DemoAccordionContent[data-state="open"] {
  animation: slideDown 300ms ease-out;
}
.DemoAccordionContent[data-state="closed"] {
  animation: slideUp 300ms ease-out;
}

@keyframes slideDown {
  from { height: 0; }
  to { height: var(--essence-accordion-content-height); }
}

@keyframes slideUp {
  from { height: var(--essence-accordion-content-height); }
  to { height: 0; }
}
```

## Accessibility

Adheres to the [Accordion WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/accordion).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">When focus is on an `Accordion.trigger` of a collapsed section, expands the section.</:row>
  <:row keys="Enter">When focus is on an `Accordion.trigger` of a collapsed section, expands the section.</:row>
  <:row keys="Tab">Moves focus to the next focusable element.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element.</:row>
  <:row keys="ArrowDown">Moves focus to the next `Accordion.trigger` when `orientation` is `vertical`.</:row>
  <:row keys="ArrowUp">Moves focus to the previous `Accordion.trigger` when `orientation` is `vertical`.</:row>
  <:row keys="ArrowRight">Moves focus to the next `Accordion.trigger` when `orientation` is `horizontal`.</:row>
  <:row keys="ArrowLeft">Moves focus to the previous `Accordion.trigger` when `orientation` is `horizontal`.</:row>
  <:row keys="Home">When focus is on an `Accordion.trigger`, moves focus to the first `Accordion.trigger`.</:row>
  <:row keys="End">When focus is on an `Accordion.trigger`, moves focus to the last `Accordion.trigger`.</:row>
</.keyboard_table>
