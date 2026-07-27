---
title: Scroll Area
description: Custom-styled scrollable area using native functionality.
---

<.demo>
  <:heex code={~S|<.scroll_area id="docs-scroll-area-hero" type="always" scrollbars="vertical" style="height: 180px"><.box p="2" pr="8"><.heading size="4" mb="2">Principles of the typographic craft</.heading><.flex direction="column" gap="4"><.text as="p">Three fundamental aspects of typography are legibility, readability, and aesthetics. Although in a non-technical sense "legible" and "readable" are often used synonymously, typographically they are separate but related concepts.</.text><.text as="p">Legibility describes how easily individual characters can be distinguished from one another. It is described by Walter Tracy as "the quality of being decipherable and recognisable".</.text><.text as="p">Typographers are concerned with legibility insofar as it is their job to select the correct font to use.</.text></.flex></.box></.scroll_area>|}>
      <.scroll_area id="docs-scroll-area-hero" type="always" scrollbars="vertical" style="height: 180px">
        <.box p="2" pr="8">
          <.heading size="4" mb="2">Principles of the typographic craft</.heading>
          <.flex direction="column" gap="4">
            <.text as="p">
              Three fundamental aspects of typography are legibility, readability, and aesthetics. Although in a non-technical sense "legible" and "readable" are often used synonymously, typographically they are separate but related concepts.
            </.text>
            <.text as="p">
              Legibility describes how easily individual characters can be distinguished from one another. It is described by Walter Tracy as "the quality of being decipherable and recognisable".
            </.text>
            <.text as="p">
              Typographers are concerned with legibility insofar as it is their job to select the correct font to use.
            </.text>
          </.flex>
        </.box>
      </.scroll_area>
  </:heex>
</.demo>

## API Reference

This component inherits behavior from the [Scroll Area primitive](/primitives/docs/components/scroll-area) and supports common margin props.

<.props_table module={EssenceUI.Components.ScrollArea} function={:scroll_area} />

## Examples

### Size

Use the `size` prop to control the size of the scrollbar handles.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="2"><.scroll_area id="docs-scroll-area-size-1" size="1" type="always" scrollbars="horizontal" style="width: 300px; height: 12px"><.box width="800px" height="1px" /></.scroll_area><.scroll_area id="docs-scroll-area-size-2" size="2" type="always" scrollbars="horizontal" style="width: 350px; height: 16px"><.box width="900px" height="1px" /></.scroll_area><.scroll_area id="docs-scroll-area-size-3" size="3" type="always" scrollbars="horizontal" style="width: 400px; height: 20px"><.box width="1000px" height="1px" /></.scroll_area></.flex>|}>
      <.flex direction="column" gap="2">
        <.scroll_area id="docs-scroll-area-size-1" size="1" type="always" scrollbars="horizontal" style="width: 300px; height: 12px">
          <.box width="800px" height="1px" />
        </.scroll_area>
        <.scroll_area id="docs-scroll-area-size-2" size="2" type="always" scrollbars="horizontal" style="width: 350px; height: 16px">
          <.box width="900px" height="1px" />
        </.scroll_area>
        <.scroll_area id="docs-scroll-area-size-3" size="3" type="always" scrollbars="horizontal" style="width: 400px; height: 20px">
          <.box width="1000px" height="1px" />
        </.scroll_area>
      </.flex>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius to the handles.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.scroll_area id="docs-scroll-area-radius-none" radius="none" type="always" scrollbars="horizontal" style="width: 350px; height: 20px"><.box width="800px" height="1px" /></.scroll_area><.scroll_area id="docs-scroll-area-radius-full" radius="full" type="always" scrollbars="horizontal" style="width: 350px; height: 20px"><.box width="800px" height="1px" /></.scroll_area></.flex>|}>
      <.flex direction="column" gap="3">
        <.scroll_area id="docs-scroll-area-radius-none" radius="none" type="always" scrollbars="horizontal" style="width: 350px; height: 20px">
          <.box width="800px" height="1px" />
        </.scroll_area>
        <.scroll_area id="docs-scroll-area-radius-full" radius="full" type="always" scrollbars="horizontal" style="width: 350px; height: 20px">
          <.box width="800px" height="1px" />
        </.scroll_area>
      </.flex>
  </:heex>
</.demo>

### Scrollbars

Use the `scrollbars` prop to limit scrollable axes.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="2"><.scroll_area id="docs-scroll-area-vertical" type="always" scrollbars="vertical" style="height: 150px"><.flex p="2" pr="8" direction="column" gap="4"><.text size="2">Three fundamental aspects of typography are legibility, readability, and aesthetics.</.text><.text size="2">Legibility describes how easily individual characters can be distinguished from one another.</.text></.flex></.scroll_area><.scroll_area id="docs-scroll-area-horizontal" type="always" scrollbars="horizontal" style="height: 150px"><.flex gap="4" p="2" style="width: 700px"><.text size="2">Three fundamental aspects of typography are legibility, readability, and aesthetics.</.text><.text size="2">Legibility describes how easily individual characters can be distinguished from one another.</.text></.flex></.scroll_area></.grid>|}>
      <.grid columns="2" gap="2">
        <.scroll_area id="docs-scroll-area-vertical" type="always" scrollbars="vertical" style="height: 150px">
          <.flex p="2" pr="8" direction="column" gap="4">
            <.text size="2">Three fundamental aspects of typography are legibility, readability, and aesthetics.</.text>
            <.text size="2">Legibility describes how easily individual characters can be distinguished from one another.</.text>
          </.flex>
        </.scroll_area>
        <.scroll_area id="docs-scroll-area-horizontal" type="always" scrollbars="horizontal" style="height: 150px">
          <.flex gap="4" p="2" style="width: 700px">
            <.text size="2">Three fundamental aspects of typography are legibility, readability, and aesthetics.</.text>
            <.text size="2">Legibility describes how easily individual characters can be distinguished from one another.</.text>
          </.flex>
        </.scroll_area>
      </.grid>
  </:heex>
</.demo>
