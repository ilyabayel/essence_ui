---
title: Toast
description: A succinct message that is displayed temporarily.
aria: https://www.w3.org/TR/wai-aria/#aria-live
---

A succinct message that is displayed temporarily.

<.demo variant="primitive" component="toast" css={primitive_css("toast")}>

  <:heex>
    <Toast.provider duration={8000} swipe_direction="right" label="Notification">
      <button type="button" id="docs-toast-show-btn" class="Button large violet">
        Add to calendar
      </button>
      <Toast.viewport id="docs-toast-viewport" class="ToastViewport">
        <Toast.root id="docs-toast-primitive" duration={3000} type="foreground" default_open={true} class="ToastRoot">
          <Toast.title class="ToastTitle">Scheduled: Catch up</Toast.title>
          <Toast.description class="ToastDescription">Friday at 5:30 PM</Toast.description>
          <Toast.action alt_text="Goto schedule to undo" class="ToastAction Button small green">Undo</Toast.action>
          <Toast.close class="ToastClose" aria-label="Close">×</Toast.close>
        </Toast.root>
      </Toast.viewport>
    </Toast.provider>
  </:heex>
</.demo>

<.highlights>
  <:item>Automatically closes.</:item>
  <:item>Pauses closing on hover, focus and window blur.</:item>
  <:item>Supports hotkey to jump to toast viewport.</:item>
  <:item>Supports closing via swipe gesture.</:item>
  <:item>Exposes CSS variables for swipe gesture animations.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

```heex
<Toast.provider>
  <Toast.viewport>
    <Toast.root>
      <Toast.title />
      <Toast.description />
      <Toast.action />
      <Toast.close />
    </Toast.root>
  </Toast.viewport>
</Toast.provider>
```

<.anatomy>
  <:part name="Provider">Provides global config for toasts.</:part>
  <:part name="Viewport">The area where toasts appear.</:part>
  <:part name="Root">Contains all toast parts for one message.</:part>
  <:part name="Title">Accessible title.</:part>
  <:part name="Description">Accessible description.</:part>
  <:part name="Action">Optional action button.</:part>
  <:part name="Close">Dismiss control.</:part>
</.anatomy>

## API Reference

### Provider

<.props_table module={EssenceUI.Primitives.Toast} function={:provider} />

### Viewport

<.props_table module={EssenceUI.Primitives.Toast} function={:viewport} />

### Root

<.props_table module={EssenceUI.Primitives.Toast} function={:root} />

### Title

<.props_table module={EssenceUI.Primitives.Toast} function={:title} />

### Description

<.props_table module={EssenceUI.Primitives.Toast} function={:description} />

### Action

<.props_table module={EssenceUI.Primitives.Toast} function={:action} />

### Close

<.props_table module={EssenceUI.Primitives.Toast} function={:close} />

## Examples

Open toasts from LiveView by setting `open` / `default_open`, or dispatch client events as shown in `storybook/primitives/toast.story.exs`. Style with classes and `data-state` — see the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Uses an aria-live region so announcements are polite and timely.

<.keyboard_table>
  <:row keys="F8">Focuses the toast viewport when supported by the hook.</:row>
  <:row keys="Escape">Closes the focused toast when applicable.</:row>
</.keyboard_table>

## Custom APIs

Wrap Provider + Viewport + Root into a friendlier `notify/1` helper for your app.

### Usage

```heex
<.app_toast id="saved" title="Saved" description="Your changes were stored." />
```

### Implementation

Compose `Toast` parts inside your own function component, encoding classes and defaults once.
