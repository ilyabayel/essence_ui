---
title: Popover
description: Floating element for displaying rich content, triggered by a button.
---

<.demo>
  <:heex code={~S|<.popover_root id="docs-popover-hero"><.popover_trigger><.button variant="soft"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"/></svg> Comment</.button></.popover_trigger><.popover_content width="360px"><.flex gap="3"><.avatar size="2" src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" radius="full" /><.box flex_grow="1"><.text_area placeholder="Write a comment…" style="height: 80px" /><.flex gap="3" mt="3" justify="space-between"><.flex align="center" gap="2" as="label"><.checkbox default_checked /><.text size="2">Send to group</.text></.flex><.popover_close><.button size="1">Comment</.button></.popover_close></.flex></.box></.flex></.popover_content></.popover_root>|}>
      <.popover_root id="docs-popover-hero">
        <.popover_trigger>
          <.button variant="soft">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"/></svg>
            Comment
          </.button>
        </.popover_trigger>
        <.popover_content width="360px">
          <.flex gap="3">
            <.avatar size="2" src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" radius="full" />
            <.box flex_grow="1">
              <.text_area placeholder="Write a comment…" style="height: 80px" />
              <.flex gap="3" mt="3" justify="space-between">
                <.flex align="center" gap="2" as="label">
                  <.checkbox default_checked />
                  <.text size="2">Send to group</.text>
                </.flex>
                <.popover_close>
                  <.button size="1">Comment</.button>
                </.popover_close>
              </.flex>
            </.box>
          </.flex>
        </.popover_content>
      </.popover_root>
  </:heex>
</.demo>

## API Reference

This component inherits props from the [Popover primitive](/primitives/docs/components/popover). Content portals into `container` (default `"body"`).

### Root

Contains all the parts of a popover.

<.props_table module={EssenceUI.Components.Popover} function={:popover_root} />

### Trigger

Wraps the control that will open the popover.

<.props_table module={EssenceUI.Components.Popover} function={:popover_trigger} />

### Content

Contains content to be rendered in the open popover.

<.props_table module={EssenceUI.Components.Popover} function={:popover_content} />

### Close

Wraps the control that will close the popover.

<.props_table module={EssenceUI.Components.Popover} function={:popover_close} />

## Examples

### Size

Use the `size` prop to control size of the popover. Use it with `width`, `min_width`, `max_width`, and height props to control dimensions.

<.demo>
  <:heex code={~S|<.flex gap="4" align="center" wrap="wrap"><.popover_root id="docs-popover-size-1"><.popover_trigger><.button variant="soft">Size 1</.button></.popover_trigger><.popover_content size="1" max_width="300px"><.text size="1">The quick brown fox jumps over the lazy dog.</.text></.popover_content></.popover_root><.popover_root id="docs-popover-size-2"><.popover_trigger><.button variant="soft">Size 2</.button></.popover_trigger><.popover_content size="2" max_width="400px"><.text size="2">The quick brown fox jumps over the lazy dog.</.text></.popover_content></.popover_root><.popover_root id="docs-popover-size-3"><.popover_trigger><.button variant="soft">Size 3</.button></.popover_trigger><.popover_content size="3" max_width="500px"><.text size="3">The quick brown fox jumps over the lazy dog.</.text></.popover_content></.popover_root><.popover_root id="docs-popover-size-4"><.popover_trigger><.button variant="soft">Size 4</.button></.popover_trigger><.popover_content size="4"><.text size="4">The quick brown fox jumps over the lazy dog.</.text></.popover_content></.popover_root></.flex>|}>
      <.flex gap="4" align="center" wrap="wrap">
        <.popover_root id="docs-popover-size-1">
          <.popover_trigger><.button variant="soft">Size 1</.button></.popover_trigger>
          <.popover_content size="1" max_width="300px">
            <.text size="1">The quick brown fox jumps over the lazy dog.</.text>
          </.popover_content>
        </.popover_root>
        <.popover_root id="docs-popover-size-2">
          <.popover_trigger><.button variant="soft">Size 2</.button></.popover_trigger>
          <.popover_content size="2" max_width="400px">
            <.text size="2">The quick brown fox jumps over the lazy dog.</.text>
          </.popover_content>
        </.popover_root>
        <.popover_root id="docs-popover-size-3">
          <.popover_trigger><.button variant="soft">Size 3</.button></.popover_trigger>
          <.popover_content size="3" max_width="500px">
            <.text size="3">The quick brown fox jumps over the lazy dog.</.text>
          </.popover_content>
        </.popover_root>
        <.popover_root id="docs-popover-size-4">
          <.popover_trigger><.button variant="soft">Size 4</.button></.popover_trigger>
          <.popover_content size="4">
            <.text size="4">The quick brown fox jumps over the lazy dog.</.text>
          </.popover_content>
        </.popover_root>
      </.flex>
  </:heex>
</.demo>
