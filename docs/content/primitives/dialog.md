---
title: Dialog
description: A modal dialog that interrupts the user with important content.
---

Headless dialog primitive. Pair with your own styles (or Themes `Dialog`) for the visual layer.

<.anatomy parts={[
  %{name: "Root", description: "Contains all dialog parts."},
  %{name: "Trigger", description: "The button that opens the dialog."},
  %{name: "Portal", description: "Portals content to the document body."},
  %{name: "Overlay", description: "Dimmed layer behind the content."},
  %{name: "Content", description: "Contains title, description, and actions."},
  %{name: "Title", description: "Accessible title announced on open."},
  %{name: "Description", description: "Optional accessible description."},
  %{name: "Close", description: "Control that closes the dialog."}
]} />

## Example

<.demo
  variant="primitive"
  component="dialog"
  heex={
    ~S"""
    <Dialog.root id="docs-dialog">
      <Dialog.trigger id="docs-dialog-trigger" class="Button violet">
        Edit profile
      </Dialog.trigger>
      <Dialog.portal id="docs-dialog-portal">
        <Dialog.overlay class="DialogOverlay" />
        <Dialog.content id="docs-dialog-content" class="DialogContent">
          <Dialog.title class="DialogTitle">Edit profile</Dialog.title>
          <Dialog.description class="DialogDescription">
            Make changes to your profile here.
          </Dialog.description>
          <div style="display: flex; margin-top: 25px; justify-content: flex-end;">
            <Dialog.close class="Button green">Save changes</Dialog.close>
          </div>
          <Dialog.close class="IconButton" aria-label="Close">×</Dialog.close>
        </Dialog.content>
      </Dialog.portal>
    </Dialog.root>
    """
  }
  css={
    ~S"""
    /* Demo styles live under assets/css/primitives/dialog.css */
    .radix-demo[data-component="dialog"] .DialogOverlay { /* ... */ }
    .radix-demo[data-component="dialog"] .DialogContent { /* ... */ }
    """
  }
>
  <Dialog.root id="docs-dialog">
    <Dialog.trigger id="docs-dialog-trigger" class="Button violet">
      Edit profile
    </Dialog.trigger>
    <Dialog.portal id="docs-dialog-portal">
      <Dialog.overlay class="DialogOverlay" />
      <Dialog.content id="docs-dialog-content" class="DialogContent">
        <Dialog.title class="DialogTitle">Edit profile</Dialog.title>
        <Dialog.description class="DialogDescription">
          Make changes to your profile here.
        </Dialog.description>
        <div style="display: flex; margin-top: 25px; justify-content: flex-end;">
          <Dialog.close class="Button green">Save changes</Dialog.close>
        </div>
        <Dialog.close class="IconButton" aria-label="Close">×</Dialog.close>
      </Dialog.content>
    </Dialog.portal>
  </Dialog.root>
</.demo>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Dialog} function={:root} />
