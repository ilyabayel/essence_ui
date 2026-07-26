---
title: Alert Dialog
description: A modal dialog that interrupts the user with important content and expects a response.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/alertdialog
---

A modal dialog that interrupts the user with important content and expects a response.

<.demo variant="primitive" component="alert-dialog" css={primitive_css("alert-dialog")}>

  <:heex>
    <AlertDialog.root id="alert-dialog-primitive">
      <AlertDialog.trigger
        id="alert-dialog-trigger"
        class="Button violet"
      >
        Delete account
      </AlertDialog.trigger>
      <AlertDialog.portal id="alert-dialog-portal">
        <AlertDialog.overlay class="AlertDialogOverlay" />
        <AlertDialog.content
          id="alert-dialog-content"
          class="AlertDialogContent"
        >
          <AlertDialog.title class="AlertDialogTitle">Are you absolutely sure?</AlertDialog.title>
          <AlertDialog.description class="AlertDialogDescription">
            This action cannot be undone. This will permanently delete your account and remove your data from our servers.
          </AlertDialog.description>
          <div style="display: flex; gap: 25px; justify-content: flex-end;">
            <AlertDialog.cancel class="Button mauve">Cancel</AlertDialog.cancel>
            <AlertDialog.action class="Button red">Yes, delete account</AlertDialog.action>
          </div>
        </AlertDialog.content>
      </AlertDialog.portal>
    </AlertDialog.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Focus is automatically trapped.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item> </:item>
  <:item>Esc closes the component automatically.</:item>
  <:item>Manages screen reader announcements with</:item>
  <:item>Description</:item>
</.highlights>

## Anatomy

```heex
<AlertDialog.root>
  <AlertDialog.trigger />
  <AlertDialog.portal />
  <AlertDialog.overlay />
  <AlertDialog.content />
  <AlertDialog.title />
  <AlertDialog.description />
  <AlertDialog.action />
  <AlertDialog.cancel />
</AlertDialog.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Portal">The `portal` part.</:part>
  <:part name="Overlay">The `overlay` part.</:part>
  <:part name="Content">The `content` part.</:part>
  <:part name="Title">The `title` part.</:part>
  <:part name="Description">The `description` part.</:part>
  <:part name="Action">The `action` part.</:part>
  <:part name="Cancel">The `cancel` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:trigger} />

### Portal

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:portal} />

### Overlay

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:overlay} />

### Content

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:content} />

### Title

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:title} />

### Description

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:description} />

### Action

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:action} />

### Cancel

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:cancel} />

## Examples

See the live demo above and `storybook/primitives/alert_dialog.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/alertdialog).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
