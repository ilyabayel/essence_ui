---
title: Tabs
description: Set of content sections to be displayed one at a time.
---

<.demo>
  <:heex code={~S|<.tabs id="docs-tabs-hero" default_value="account"><:list :let={ctx}><.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs>|}>
      <.tabs id="docs-tabs-hero" default_value="account">
        <:list :let={ctx}>
          <.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
            <:trigger value="account">Account</:trigger>
            <:trigger value="documents">Documents</:trigger>
            <:trigger value="settings">Settings</:trigger>
          </.tabs_list>
        </:list>
        <:content value="account">
          <.box pt="3">
            <.text size="2">Make changes to your account.</.text>
          </.box>
        </:content>
        <:content value="documents">
          <.box pt="3">
            <.text size="2">Access and update your documents.</.text>
          </.box>
        </:content>
        <:content value="settings">
          <.box pt="3">
            <.text size="2">Edit your profile or update contact information.</.text>
          </.box>
        </:content>
      </.tabs>
  </:heex>
</.demo>

## API Reference

This component inherits props from the [Tabs primitive](/primitives/docs/components/tabs) and supports common margin props. Tabs should not be used for page navigation — use [Tab Nav](/themes/docs/components/tab-nav) instead.

Use `:list` and `:content` slots on `tabs/1` rather than separate trigger/content functions. Pass `tabs_id` and `default_value` from the list slot context into `tabs_list/1`.

### Root

Contains all component parts.

<.props_table module={EssenceUI.Components.Tabs} function={:tabs} />

### List

Contains the triggers that sit alongside the active content. Render inside the `:list` slot.

<.props_table module={EssenceUI.Components.Tabs} function={:tabs_list} />

### Trigger

Declared as a `:trigger` slot on `tabs_list/1`. The button that activates its associated content panel.

### Content

Declared as a `:content` slot on `tabs/1`. Contains the content associated with each trigger.

## Examples

### Size

Use the `size` prop on `tabs_list` to control the size of the tab list.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tabs id="docs-tabs-size-1" default_value="account"><:list :let={ctx}><.tabs_list size="1" tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="2"><.text size="1">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="2"><.text size="1">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="2"><.text size="1">Edit your profile or update contact information.</.text></.box></:content></.tabs><.tabs id="docs-tabs-size-2" default_value="account"><:list :let={ctx}><.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs></.flex>|}>
      <.flex direction="column" gap="4">
        <.tabs id="docs-tabs-size-1" default_value="account">
          <:list :let={ctx}>
            <.tabs_list size="1" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account">
            <.box pt="2"><.text size="1">Make changes to your account.</.text></.box>
          </:content>
          <:content value="documents">
            <.box pt="2"><.text size="1">Access and update your documents.</.text></.box>
          </:content>
          <:content value="settings">
            <.box pt="2"><.text size="1">Edit your profile or update contact information.</.text></.box>
          </:content>
        </.tabs>
        <.tabs id="docs-tabs-size-2" default_value="account">
          <:list :let={ctx}>
            <.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account">
            <.box pt="3"><.text size="2">Make changes to your account.</.text></.box>
          </:content>
          <:content value="documents">
            <.box pt="3"><.text size="2">Access and update your documents.</.text></.box>
          </:content>
          <:content value="settings">
            <.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box>
          </:content>
        </.tabs>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop on `tabs` to assign a specific accent color to the tab list.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tabs id="docs-tabs-color-indigo" default_value="account" color="indigo"><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs><.tabs id="docs-tabs-color-cyan" default_value="account" color="cyan"><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs><.tabs id="docs-tabs-color-orange" default_value="account" color="orange"><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs><.tabs id="docs-tabs-color-crimson" default_value="account" color="crimson"><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs></.flex>|}>
      <.flex direction="column" gap="4">
        <.tabs id="docs-tabs-color-indigo" default_value="account" color="indigo">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
        <.tabs id="docs-tabs-color-cyan" default_value="account" color="cyan">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
        <.tabs id="docs-tabs-color-orange" default_value="account" color="orange">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
        <.tabs id="docs-tabs-color-crimson" default_value="account" color="crimson">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop on `tabs` and `tabs_list` to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="4"><.tabs id="docs-tabs-hc-off" default_value="account" color="gray"><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs><.tabs id="docs-tabs-hc-on" default_value="account" color="gray" high_contrast><:list :let={ctx}><.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value} high_contrast={ctx.high_contrast}><:trigger value="account">Account</:trigger><:trigger value="documents">Documents</:trigger><:trigger value="settings">Settings</:trigger></.tabs_list></:list><:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content><:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content><:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content></.tabs></.flex>|}>
      <.flex direction="column" gap="4">
        <.tabs id="docs-tabs-hc-off" default_value="account" color="gray">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
        <.tabs id="docs-tabs-hc-on" default_value="account" color="gray" high_contrast>
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value} high_contrast={ctx.high_contrast}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account"><.box pt="3"><.text size="2">Make changes to your account.</.text></.box></:content>
          <:content value="documents"><.box pt="3"><.text size="2">Access and update your documents.</.text></.box></:content>
          <:content value="settings"><.box pt="3"><.text size="2">Edit your profile or update contact information.</.text></.box></:content>
        </.tabs>
      </.flex>
  </:heex>
</.demo>
