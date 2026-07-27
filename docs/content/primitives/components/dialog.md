---
title: Dialog
description: A window overlaid on the primary window, rendering the content underneath inert.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal
---

A window overlaid on either the primary window or another dialog window, rendering the content underneath inert. Headless dialog primitive—pair with your own styles (or Themes Dialog) for the visual layer.

<.demo theme="light" variant="primitive" component="dialog" css={primitive_css("dialog")}>

  <:heex>
    <Dialog.root id="dialog-primitive">
              <Dialog.trigger
                id="dialog-trigger"
                class="DemoButton violet"
              >
                Edit profile
              </Dialog.trigger>
              <Dialog.portal id="dialog-portal">
                <Dialog.overlay class="DemoDialogOverlay" />
                <Dialog.content
                  id="dialog-content"
                  class="DemoDialogContent"
                >
                  <Dialog.title class="DemoDialogTitle">Edit profile</Dialog.title>
                  <Dialog.description class="DemoDialogDescription">
                    Make changes to your profile here. Click save when you're done.
                  </Dialog.description>
                  <fieldset class="DemoFieldset">
                    <label
                      class="DemoLabel"
                      for="dialog-name"
                    >
                      Name
                    </label>
                    <input
                      class="DemoInput"
                      id="dialog-name"
                      value="Pedro Duarte"
                    />
                  </fieldset>
                  <fieldset class="DemoFieldset">
                    <label
                      class="DemoLabel"
                      for="dialog-username"
                    >
                      Username
                    </label>
                    <input
                      class="DemoInput"
                      id="dialog-username"
                      value="@peduarte"
                    />
                  </fieldset>
                  <div style="display: flex; margin-top: 25px; justify-content: flex-end;">
                    <Dialog.close class="DemoButton green">Save changes</Dialog.close>
                  </div>
                  <Dialog.close
                    class="DemoIconButton"
                    aria-label="Close"
                  >
                    ×
                  </Dialog.close>
                </Dialog.content>
              </Dialog.portal>
            </Dialog.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports modal and non-modal modes.</:item>
  <:item>Focus is trapped within modal dialogs.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Manages screen reader announcements with Title and Description.</:item>
  <:item>Escape closes the dialog automatically.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Dialog.root>
  <Dialog.trigger />
  <Dialog.portal>
    <Dialog.overlay />
    <Dialog.content>
      <Dialog.title />
      <Dialog.description />
      <Dialog.close />
    </Dialog.content>
  </Dialog.portal>
</Dialog.root>
```

<.anatomy>
  <:part name="Root">Contains all dialog parts.</:part>
  <:part name="Trigger">The button that opens the dialog.</:part>
  <:part name="Portal">Portals overlay and content into the document body.</:part>
  <:part name="Overlay">Dimmed layer behind the content.</:part>
  <:part name="Content">Contains title, description, and actions.</:part>
  <:part name="Title">Accessible title announced on open.</:part>
  <:part name="Description">Optional accessible description.</:part>
  <:part name="Close">Control that closes the dialog.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a dialog.

Use `open` with `on_open_change` for controlled open state in LiveView:

```heex
<Dialog.root id="profile-dialog" open={@open} on_open_change="dialog_open_change">
  …
</Dialog.root>
```

```elixir
def handle_event("dialog_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open)}
end
```

<.props_table module={EssenceUI.Primitives.Dialog} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Present on the root reflecting open state.</:row>
</.data_attributes_table>

### Trigger

The button that opens the dialog.

<.props_table module={EssenceUI.Primitives.Dialog} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Portal

Portals your overlay and content parts into the target (default `body`).

<.props_table module={EssenceUI.Primitives.Dialog} function={:portal} />

### Overlay

A layer that covers the inert portion of the view when the dialog is open.

<.props_table module={EssenceUI.Primitives.Dialog} function={:overlay} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Content

Contains content to be rendered in the open dialog.

<.props_table module={EssenceUI.Primitives.Dialog} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the dialog is open.</:row>
</.data_attributes_table>

### Title

An accessible title announced when the dialog is opened. Hide with [Visually Hidden](/primitives/docs/utilities/visually-hidden) if needed—still provide a title for accessibility.

<.props_table module={EssenceUI.Primitives.Dialog} function={:title} />

### Description

An optional accessible description announced when the dialog is opened.

<.props_table module={EssenceUI.Primitives.Dialog} function={:description} />

### Close

The button that closes the dialog.

<.props_table module={EssenceUI.Primitives.Dialog} function={:close} />

## Examples

### Close after async action

Close from LiveView by setting controlled `open={false}` after a successful event, or use `Dialog.close` inside the content for immediate dismiss.

```heex
<Dialog.root id="async-dialog" open={@open} on_open_change="dialog_open_change">
  <Dialog.trigger id="async-dialog-trigger" class="DemoButton">Edit</Dialog.trigger>
  <Dialog.portal id="async-dialog-portal">
    <Dialog.overlay class="DemoDialogOverlay" />
    <Dialog.content id="async-dialog-content" class="DemoDialogContent">
      <Dialog.title>Edit</Dialog.title>
      <form phx-submit="save">
        …
        <Dialog.close class="DemoButton">Cancel</Dialog.close>
        <button type="submit" class="DemoButton green">Save</button>
      </form>
    </Dialog.content>
  </Dialog.portal>
</Dialog.root>
```

### Scrollable overlay

Make the overlay the scroll container so long content scrolls within the viewport:

```css
.DemoDialogOverlay {
  overflow-y: auto;
  display: grid;
  place-items: center;
}
```

### Custom portal target

Portal into a specific container via `target`:

```heex
<Dialog.portal id="dialog-portal" target="#app-portal-root">
  …
</Dialog.portal>
```

## Accessibility

Adheres to the [Dialog WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal).

<.keyboard_table>
  <:row keys="Space">Opens/closes the dialog when focus is on the trigger or close control.</:row>
  <:row keys="Enter">Opens/closes the dialog when focus is on the trigger or close control.</:row>
  <:row keys="Tab">Moves focus to the next focusable element inside the dialog.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element inside the dialog.</:row>
  <:row keys="Escape">Closes the dialog and returns focus to the trigger.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by wrapping the primitive parts into a friendlier abstraction for your design system.

### Abstract the overlay and the close button

This example abstracts `Dialog.overlay` and `Dialog.close` into a reusable confirm dialog.

#### Usage

```heex
<.confirm_dialog id="delete-confirm" title="Are you sure?">
  This action cannot be undone.
</.confirm_dialog>
```

#### Implementation

```elixir
def confirm_dialog(assigns) do
  ~H"""
  <Dialog.root id={@id}>
    <Dialog.trigger id={"#{@id}-trigger"} class="DemoButton">
      {render_slot(@trigger) || "Open"}
    </Dialog.trigger>
    <Dialog.portal id={"#{@id}-portal"}>
      <Dialog.overlay class="DemoDialogOverlay" />
      <Dialog.content id={"#{@id}-content"} class="DemoDialogContent">
        <Dialog.title class="DemoDialogTitle">{@title}</Dialog.title>
        <Dialog.description class="DemoDialogDescription">
          {render_slot(@inner_block)}
        </Dialog.description>
        <Dialog.close class="DemoButton">Cancel</Dialog.close>
        <Dialog.close class="DemoButton violet">Confirm</Dialog.close>
      </Dialog.content>
    </Dialog.portal>
  </Dialog.root>
  """
end
```
