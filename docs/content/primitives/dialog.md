---
title: Dialog
description: A modal dialog that interrupts the user with important content.
---

Headless dialog primitive. Pair with your own styles (or Themes `Dialog`) for the visual layer.

<.anatomy>
  <:part name="Root">Contains all dialog parts.</:part>
  <:part name="Trigger">The button that opens the dialog.</:part>
  <:part name="Portal">Portals content to the document body.</:part>
  <:part name="Overlay">Dimmed layer behind the content.</:part>
  <:part name="Content">Contains title, description, and actions.</:part>
  <:part name="Title">Accessible title announced on open.</:part>
  <:part name="Description">Optional accessible description.</:part>
  <:part name="Close">Control that closes the dialog.</:part>
</.anatomy>

## Example

<.demo variant="primitive" component="dialog" heex={~s[<Dialog.root id="docs-dialog"><Dialog.trigger id="docs-dialog-trigger" class="Button violet">Edit profile</Dialog.trigger>...</Dialog.root>]} css={~s[/* See assets/css/primitives/dialog.css */]}>
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
        <Dialog.close class="Button green">Save changes</Dialog.close>
        <Dialog.close class="IconButton" aria-label="Close">×</Dialog.close>
      </Dialog.content>
    </Dialog.portal>
  </Dialog.root>
</.demo>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Dialog} function={:root} />
