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
        class="DemoButton violet"
      >
        Delete account
      </AlertDialog.trigger>
      <AlertDialog.portal id="alert-dialog-portal">
        <AlertDialog.overlay class="DemoAlertDialogOverlay" />
        <AlertDialog.content
          id="alert-dialog-content"
          class="DemoAlertDialogContent"
        >
          <AlertDialog.title class="DemoAlertDialogTitle">Are you absolutely sure?</AlertDialog.title>
          <AlertDialog.description class="DemoAlertDialogDescription">
            This action cannot be undone. This will permanently delete your account and remove your data from our servers.
          </AlertDialog.description>
          <div style="display: flex; gap: 25px; justify-content: flex-end;">
            <AlertDialog.cancel class="DemoButton mauve">Cancel</AlertDialog.cancel>
            <AlertDialog.action class="DemoButton red">Yes, delete account</AlertDialog.action>
          </div>
        </AlertDialog.content>
      </AlertDialog.portal>
    </AlertDialog.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Focus is automatically trapped.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Manages screen reader announcements with Title and Description.</:item>
  <:item>Escape closes the dialog automatically.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<AlertDialog.root>
  <AlertDialog.trigger />
  <AlertDialog.portal>
    <AlertDialog.overlay />
    <AlertDialog.content>
      <AlertDialog.title />
      <AlertDialog.description />
      <AlertDialog.cancel />
      <AlertDialog.action />
    </AlertDialog.content>
  </AlertDialog.portal>
</AlertDialog.root>
```

<.anatomy>
  <:part name="Root">Contains all alert dialog parts.</:part>
  <:part name="Trigger">The button that opens the dialog.</:part>
  <:part name="Portal">Portals overlay and content into the document body.</:part>
  <:part name="Overlay">Dimmed layer behind the content.</:part>
  <:part name="Content">Contains title, description, and action buttons.</:part>
  <:part name="Title">Accessible name announced when the dialog opens.</:part>
  <:part name="Description">Accessible description announced when the dialog opens.</:part>
  <:part name="Cancel">Dismisses the dialog without confirming the action.</:part>
  <:part name="Action">Confirms the destructive or irreversible action and closes the dialog.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of an alert dialog.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Present on the root reflecting open state.</:row>
</.data_attributes_table>

### Trigger

A button that opens the dialog.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Portal

When used, portals your overlay and content parts into the target (default `body`).

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:portal} />

### Overlay

A layer that covers the inert portion of the view when the dialog is open.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:overlay} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Content

Contains content to be rendered when the dialog is open.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Title

An accessible name to be announced when the dialog is opened. Alternatively, provide `aria-label` or `aria-labelledby` on `AlertDialog.content` and omit this part.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:title} />

### Description

An accessible description to be announced when the dialog is opened. Alternatively, provide `aria-describedby` on `AlertDialog.content` and omit this part.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:description} />

### Cancel

A button that closes the dialog. Distinguish this visually from `AlertDialog.action` buttons.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:cancel} />

### Action

A button that closes the dialog after confirming the action. Distinguish this visually from `AlertDialog.cancel`.

<.props_table module={EssenceUI.Primitives.AlertDialog} function={:action} />

## Examples

### Close after asynchronous form submission

Use controlled `open` and `on_open_change` to close the alert dialog after an async LiveView event completes.

```heex
<AlertDialog.root id="async-alert" open={@open} on_open_change="alert_open_change">
  <AlertDialog.trigger id="async-alert-trigger" class="DemoButton violet">
    Delete account
  </AlertDialog.trigger>
  <AlertDialog.portal id="async-alert-portal">
    <AlertDialog.overlay class="DemoAlertDialogOverlay" />
    <AlertDialog.content id="async-alert-content" class="DemoAlertDialogContent">
      <AlertDialog.title class="DemoAlertDialogTitle">Delete account</AlertDialog.title>
      <AlertDialog.description class="DemoAlertDialogDescription">
        This action cannot be undone.
      </AlertDialog.description>
      <form phx-submit="delete_account">
        …
        <div style="display: flex; gap: 25px; justify-content: flex-end;">
          <AlertDialog.cancel class="DemoButton mauve">Cancel</AlertDialog.cancel>
          <button type="submit" class="DemoButton red">Yes, delete account</button>
        </div>
      </form>
    </AlertDialog.content>
  </AlertDialog.portal>
</AlertDialog.root>
```

```elixir
def handle_event("alert_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open)}
end

def handle_event("delete_account", _params, socket) do
  # Perform async work, then close the dialog
  {:noreply, assign(socket, :open, false)}
end
```

### Custom portal target

Portal into a specific container via `target`:

```heex
<AlertDialog.portal id="alert-dialog-portal" target="#app-portal-root">
  <AlertDialog.overlay class="DemoAlertDialogOverlay" />
  <AlertDialog.content id="alert-dialog-content" class="DemoAlertDialogContent">
    …
  </AlertDialog.content>
</AlertDialog.portal>
```

## Accessibility

Adheres to the [Alert and Message Dialogs WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/alertdialog).

<.keyboard_table>
  <:row keys="Space">Opens/closes the dialog.</:row>
  <:row keys="Enter">Opens/closes the dialog.</:row>
  <:row keys="Tab">Moves focus to the next focusable element.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element.</:row>
  <:row keys="Escape">Closes the dialog and returns focus to the trigger.</:row>
</.keyboard_table>
