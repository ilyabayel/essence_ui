---
title: Hover Card
description: For sighted users to preview content available behind a link.
---

<.demo>
  <:heex code={~S|<.text>Follow <.hover_card_root id="docs-hover-card-hero"><.hover_card_trigger><.es_link href="#">@radix_ui</.es_link></.hover_card_trigger><.hover_card_content max_width="300px"><.flex gap="4"><.avatar size="3" fallback="R" radius="full" src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png" /><.box><.heading size="3" as="h3">Radix</.heading><.box mb="2"><.text as="div" size="2" color="gray">@radix_ui</.text></.box><.text as="div" size="2">React components, icons, and colors for building high-quality, accessible UI.</.text></.box></.flex></.hover_card_content></.hover_card_root> for updates.</.text>|}>
      <.text>
        Follow
        <.hover_card_root id="docs-hover-card-hero">
          <.hover_card_trigger>
            <.es_link href="#">@radix_ui</.es_link>
          </.hover_card_trigger>
          <.hover_card_content max_width="300px">
            <.flex gap="4">
              <.avatar size="3" fallback="R" radius="full" src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png" />
              <.box>
                <.heading size="3" as="h3">Radix</.heading>
                <.box mb="2">
                  <.text as="div" size="2" color="gray">@radix_ui</.text>
                </.box>
                <.text as="div" size="2">
                  React components, icons, and colors for building high-quality, accessible UI.
                </.text>
              </.box>
            </.flex>
          </.hover_card_content>
        </.hover_card_root>
        for updates.
      </.text>
  </:heex>
</.demo>

## API Reference

This component inherits props from the [Hover Card primitive](/primitives/docs/components/hover-card). Content portals into `container` (default `"body"`).

### Root

Contains all the parts of the hover card.

<.props_table module={EssenceUI.Components.HoverCard} function={:hover_card_root} />

### Trigger

Wraps the link that will open the hover card.

<.props_table module={EssenceUI.Components.HoverCard} function={:hover_card_trigger} />

### Content

Contains the content of the open hover card.

<.props_table module={EssenceUI.Components.HoverCard} function={:hover_card_content} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex gap="4" wrap="wrap"><.hover_card_root id="docs-hover-card-size-1"><.hover_card_trigger><.es_link href="#">Size 1</.es_link></.hover_card_trigger><.hover_card_content size="1" max_width="240px"><.text as="div" size="1"><.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.</.text></.hover_card_content></.hover_card_root><.hover_card_root id="docs-hover-card-size-2"><.hover_card_trigger><.es_link href="#">Size 2</.es_link></.hover_card_trigger><.hover_card_content size="2" max_width="280px"><.text as="div" size="2"><.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.</.text></.hover_card_content></.hover_card_root><.hover_card_root id="docs-hover-card-size-3"><.hover_card_trigger><.es_link href="#">Size 3</.es_link></.hover_card_trigger><.hover_card_content size="3" max_width="320px"><.text as="div" size="3"><.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.</.text></.hover_card_content></.hover_card_root></.flex>|}>
      <.flex gap="4" wrap="wrap">
        <.hover_card_root id="docs-hover-card-size-1">
          <.hover_card_trigger><.es_link href="#">Size 1</.es_link></.hover_card_trigger>
          <.hover_card_content size="1" max_width="240px">
            <.text as="div" size="1">
              <.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        <.hover_card_root id="docs-hover-card-size-2">
          <.hover_card_trigger><.es_link href="#">Size 2</.es_link></.hover_card_trigger>
          <.hover_card_content size="2" max_width="280px">
            <.text as="div" size="2">
              <.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        <.hover_card_root id="docs-hover-card-size-3">
          <.hover_card_trigger><.es_link href="#">Size 3</.es_link></.hover_card_trigger>
          <.hover_card_content size="3" max_width="320px">
            <.text as="div" size="3">
              <.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
      </.flex>
  </:heex>
</.demo>
