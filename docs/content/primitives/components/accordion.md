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

```heex
<Accordion.root>
  <Accordion.item />
  <Accordion.header />
  <Accordion.trigger />
  <Accordion.content />
</Accordion.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Item">The `item` part.</:part>
  <:part name="Header">The `header` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Content">The `content` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Accordion} function={:root} />

### Item

<.props_table module={EssenceUI.Primitives.Accordion} function={:item} />

### Header

<.props_table module={EssenceUI.Primitives.Accordion} function={:header} />

### Trigger

<.props_table module={EssenceUI.Primitives.Accordion} function={:trigger} />

### Content

<.props_table module={EssenceUI.Primitives.Accordion} function={:content} />

## Examples

See the live demo above and `storybook/primitives/accordion.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/accordion).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
