---
title: Dialog
description: Modal dialog window displayed above the page.
---

Themes Dialog wraps the headless [Primitives Dialog](/primitives/docs/components/dialog) with Themes tokens. Prefer Primitives when you need the full part tree (Trigger, Title, Description, Close).

<.demo>
  <:heex code={~S|<.button phx-click={Phoenix.LiveView.JS.dispatch("open", to: "#themes-docs-dialog")}>Edit profile</.button><.dialog id="themes-docs-dialog" target="body" default_state="closed"><.flex direction="column" gap="4"><.box><.heading as="h2" size="5" mb="2">Edit profile</.heading><.text size="2" color="gray">Make changes to your profile.</.text></.box><.flex direction="column" gap="3"><.flex direction="column" gap="1"><.text as="div" size="2" weight="bold">Name</.text><.text_field value="Freja Johnsen" placeholder="Enter your full name" /></.flex><.flex direction="column" gap="1"><.text as="div" size="2" weight="bold">Email</.text><.text_field value="freja@example.com" placeholder="Enter your email" /></.flex></.flex><.flex gap="3" justify="end"><.button variant="soft" color="gray" phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#themes-docs-dialog")}>Cancel</.button><.button phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#themes-docs-dialog")}>Save</.button></.flex></.flex></.dialog>|}>
      <.button phx-click={Phoenix.LiveView.JS.dispatch("open", to: "#themes-docs-dialog")}>
        Edit profile
      </.button>
      <.dialog id="themes-docs-dialog" target="body" default_state="closed">
        <.flex direction="column" gap="4">
          <.box>
            <.heading as="h2" size="5" mb="2">Edit profile</.heading>
            <.text size="2" color="gray">Make changes to your profile.</.text>
          </.box>
          <.flex direction="column" gap="3">
            <.flex direction="column" gap="1">
              <.text as="div" size="2" weight="bold">Name</.text>
              <.text_field value="Freja Johnsen" placeholder="Enter your full name" />
            </.flex>
            <.flex direction="column" gap="1">
              <.text as="div" size="2" weight="bold">Email</.text>
              <.text_field value="freja@example.com" placeholder="Enter your email" />
            </.flex>
          </.flex>
          <.flex gap="3" justify="end">
            <.button
              variant="soft"
              color="gray"
              phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#themes-docs-dialog")}
            >
              Cancel
            </.button>
            <.button phx-click={Phoenix.LiveView.JS.dispatch("close", to: "#themes-docs-dialog")}>
              Save
            </.button>
          </.flex>
        </.flex>
      </.dialog>
  </:heex>
</.demo>

## API Reference

This component inherits behavior from the [Dialog primitive](/primitives/docs/components/dialog). Open and close via `JS.dispatch("open" | "close", to: "#id")` on the dialog root id. A portal `target` selector is required (commonly `"body"`).

Themes Dialog currently exposes `dialog` and `dialog_content` only — there are no separate Trigger, Title, Description, or Close parts. Compose headings, text, and buttons yourself. Size and inset examples from Radix Themes are omitted until those props land on the Themes wrapper.

### Root

Contains the portaled overlay and content. Pass children that render inside `dialog_content`.

<.props_table module={EssenceUI.Components.Dialog} function={:dialog} />

### Content

The themed content surface inside the overlay. Usually rendered for you by `dialog/1`; call `dialog_content/1` only when composing manually.

<.props_table module={EssenceUI.Components.Dialog} function={:dialog_content} />
