---
title: Alert Dialog
description: Modal confirmation dialog that interrupts the user and expects a response.
---

<.demo>
  <:heex code={~S|<.button color="red" phx-click={Phoenix.LiveView.JS.dispatch("open", to: "#docs-alert-dialog-hero")}>Revoke access</.button><.alert_dialog id="docs-alert-dialog-hero" target="body" default_state="closed"><:title>Revoke access</:title><:description>Are you sure? This application will no longer be accessible and any existing sessions will be expired.</:description><.flex gap="3" mt="4" justify="end"><.button variant="soft" color="gray" phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#docs-alert-dialog-hero")}>Cancel</.button><.button color="red" phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#docs-alert-dialog-hero")}>Revoke access</.button></.flex></.alert_dialog>|}>
      <.button color="red" phx-click={Phoenix.LiveView.JS.dispatch("open", to: "#docs-alert-dialog-hero")}>
        Revoke access
      </.button>
      <.alert_dialog id="docs-alert-dialog-hero" target="body" default_state="closed">
        <:title>Revoke access</:title>
        <:description>
          Are you sure? This application will no longer be accessible and any existing sessions will be expired.
        </:description>
        <.flex gap="3" mt="4" justify="end">
          <.button
            variant="soft"
            color="gray"
            phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#docs-alert-dialog-hero")}
          >
            Cancel
          </.button>
          <.button color="red" phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#docs-alert-dialog-hero")}>
            Revoke access
          </.button>
        </.flex>
      </.alert_dialog>
  </:heex>
</.demo>

## API Reference

This component inherits behavior from the [Alert Dialog primitive](/primitives/docs/components/alert-dialog). Open and close via `JS.dispatch("open" | "close", to: "#id")` on the dialog root id. A portal `target` selector is required (commonly `"body"`).

Themes Alert Dialog exposes `alert_dialog/1` only — there are no separate Trigger, Action, or Cancel parts. Use `:title` and `:description` slots for accessible labelling, then compose action buttons in the default slot. Size and inset examples are omitted until those props land on the Themes wrapper.

### Root

Contains the portaled overlay, title, description, and action buttons.

<.props_table module={EssenceUI.Components.AlertDialog} function={:alert_dialog} />
