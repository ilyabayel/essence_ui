---
title: Accordion
description: A vertically stacked set of interactive headings that each reveal an associated section of content.
---

<.demo>
  <:heex code={~S|<.accordion id="docs-accordion-hero" default_value="item-1"><:item value="item-1" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Is it accessible?</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Yes. It adheres to the WAI-ARIA design pattern.</.accordion_content></:item><:item value="item-2" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Is it unstyled?</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Yes. It's unstyled by default, giving you freedom over the look and feel.</.accordion_content></:item><:item value="item-3" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Can it be animated?</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Yes! You can use CSS transitions or animations to animate it.</.accordion_content></:item></.accordion>|}>
      <.accordion id="docs-accordion-hero" default_value="item-1">
        <:item value="item-1" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
              Is it accessible?
            </.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Yes. It adheres to the WAI-ARIA design pattern.
          </.accordion_content>
        </:item>
        <:item value="item-2" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
              Is it unstyled?
            </.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Yes. It's unstyled by default, giving you freedom over the look and feel.
          </.accordion_content>
        </:item>
        <:item value="item-3" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
              Can it be animated?
            </.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Yes! You can use CSS transitions or animations to animate it.
          </.accordion_content>
        </:item>
      </.accordion>
  </:heex>
</.demo>

## API Reference

Wraps the [Accordion primitive](/primitives/docs/components/accordion). Declare items with the `:item` slot; each item receives a context map (`state`, `id`, `trigger_id`) for wiring `accordion_trigger` and `accordion_content`.

### Root

Contains all accordion items.

<.props_table module={EssenceUI.Components.Accordion} function={:accordion} />

### Header

The header component for an accordion item.

<.props_table module={EssenceUI.Components.Accordion} function={:accordion_header} />

### Trigger

The trigger that toggles the accordion item. Pass `state`, `id`, and `trigger_id` from the item slot context.

<.props_table module={EssenceUI.Components.Accordion} function={:accordion_trigger} />

### Content

The content revealed when the accordion item is open. Pass `state`, `id`, and `trigger_id` from the item slot context.

<.props_table module={EssenceUI.Components.Accordion} function={:accordion_content} />

## Examples

### Multiple

Use `type="multiple"` to allow more than one item to be open at a time.

<.demo>
  <:heex code={~S|<.accordion id="docs-accordion-multiple" type="multiple"><:item value="item-1" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 1</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Content for item 1</.accordion_content></:item><:item value="item-2" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 2</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Content for item 2</.accordion_content></:item></.accordion>|}>
      <.accordion id="docs-accordion-multiple" type="multiple">
        <:item value="item-1" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 1</.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Content for item 1
          </.accordion_content>
        </:item>
        <:item value="item-2" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 2</.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Content for item 2
          </.accordion_content>
        </:item>
      </.accordion>
  </:heex>
</.demo>

### Collapsible

Use `collapsible` with `type="single"` to allow closing the open item.

<.demo>
  <:heex code={~S|<.accordion id="docs-accordion-collapsible" type="single" collapsible><:item value="item-1" :let={ctx}><.accordion_header><.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 1</.accordion_trigger></.accordion_header><.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Content for item 1</.accordion_content></:item></.accordion>|}>
      <.accordion id="docs-accordion-collapsible" type="single" collapsible>
        <:item value="item-1" :let={ctx}>
          <.accordion_header>
            <.accordion_trigger state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>Item 1</.accordion_trigger>
          </.accordion_header>
          <.accordion_content state={ctx.state} id={ctx.id} trigger_id={ctx.trigger_id}>
            Content for item 1
          </.accordion_content>
        </:item>
      </.accordion>
  </:heex>
</.demo>
