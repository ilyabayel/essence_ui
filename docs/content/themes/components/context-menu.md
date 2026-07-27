---
title: Context Menu
description: Menu representing a set of actions, displayed at the point of right click or long press.
---

<.demo>
  <:heex code={~S|<.context_menu_root id="docs-context-menu-hero"><.context_menu_trigger><div style="height: 150px; width: 300px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Right-click here</.text></div></.context_menu_trigger><.context_menu_content><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item>Share</.context_menu_item><.context_menu_item>Add to favorites</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root>|}>
      <.context_menu_root id="docs-context-menu-hero">
        <.context_menu_trigger>
          <div style="height: 150px; width: 300px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
            <.text>Right-click here</.text>
          </div>
        </.context_menu_trigger>
        <.context_menu_content>
          <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
          <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
          <.context_menu_separator />
          <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
          <.context_menu_separator />
          <.context_menu_item>Share</.context_menu_item>
          <.context_menu_item>Add to favorites</.context_menu_item>
          <.context_menu_separator />
          <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
        </.context_menu_content>
      </.context_menu_root>
  </:heex>
</.demo>

## API Reference

This component inherits props from the [Context Menu primitive](/primitives/docs/components/context-menu). Content portals into `container` (default `"body"`).

### Root

Contains all the parts of a context menu.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_root} />

### Trigger

Wraps the element that will open the context menu.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_trigger} />

### Content

The component that pops out when the context menu is open.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_content} />

### Label

Used to render a label. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_label} />

### Item

The component that contains the context menu items.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_item} />

### Group

Used to group multiple items.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_group} />

### Separator

Visual separator between items.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_separator} />

### CheckboxItem

An item that can be controlled and rendered like a checkbox.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_checkbox_item} />

### RadioGroup

Used to group multiple radio items.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_radio_group} />

### RadioItem

An item that can be controlled and rendered like a radio.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_radio_item} />

### Sub

Contains all the parts of a submenu.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_sub} />

### SubTrigger

An item that opens a submenu. Must be rendered inside `context_menu_sub`.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_sub_trigger} />

### SubContent

The component that pops out when a submenu is open. Must be rendered inside `context_menu_sub`.

<.props_table module={EssenceUI.Components.ContextMenu} function={:context_menu_sub_content} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3"><.context_menu_root id="docs-context-menu-size-1"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Size one</.text></div></.context_menu_trigger><.context_menu_content size="1"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-size-2"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Size two</.text></div></.context_menu_trigger><.context_menu_content size="2"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root></.grid>|}>
      <.grid columns="2" gap="3">
        <.context_menu_root id="docs-context-menu-size-1">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Size one</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content size="1">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-size-2">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Size two</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content size="2">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
      </.grid>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to customize the visual style of the context menu.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3"><.context_menu_root id="docs-context-menu-variant-solid"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Solid</.text></div></.context_menu_trigger><.context_menu_content variant="solid"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-variant-soft"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Soft</.text></div></.context_menu_trigger><.context_menu_content variant="soft"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root></.grid>|}>
      <.grid columns="2" gap="3">
        <.context_menu_root id="docs-context-menu-variant-solid">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Solid</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content variant="solid">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-variant-soft">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Soft</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content variant="soft">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
      </.grid>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color. You can also pass `color` to a specific item for semantic emphasis (for example, a destructive action).

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3"><.context_menu_root id="docs-context-menu-color-indigo"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Indigo</.text></div></.context_menu_trigger><.context_menu_content color="indigo"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-color-cyan"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Cyan</.text></div></.context_menu_trigger><.context_menu_content color="cyan"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-color-orange"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Orange</.text></div></.context_menu_trigger><.context_menu_content color="orange"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-color-crimson"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Crimson</.text></div></.context_menu_trigger><.context_menu_content color="crimson"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item></.context_menu_content></.context_menu_root></.grid>|}>
      <.grid columns="2" gap="3">
        <.context_menu_root id="docs-context-menu-color-indigo">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Indigo</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="indigo">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-color-cyan">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Cyan</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="cyan">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-color-orange">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Orange</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="orange">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-color-crimson">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Crimson</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="crimson">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
      </.grid>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3"><.context_menu_root id="docs-context-menu-hc-off"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>Standard</.text></div></.context_menu_trigger><.context_menu_content color="gray"><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item></.context_menu_content></.context_menu_root><.context_menu_root id="docs-context-menu-hc-on"><.context_menu_trigger><div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;"><.text>High-contrast</.text></div></.context_menu_trigger><.context_menu_content color="gray" high_contrast><.context_menu_item shortcut="⌘ E">Edit</.context_menu_item><.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item><.context_menu_separator /><.context_menu_item shortcut="⌘ N">Archive</.context_menu_item></.context_menu_content></.context_menu_root></.grid>|}>
      <.grid columns="2" gap="3">
        <.context_menu_root id="docs-context-menu-hc-off">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Standard</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="gray">
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        <.context_menu_root id="docs-context-menu-hc-on">
          <.context_menu_trigger>
            <div style="height: 150px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>High-contrast</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content color="gray" high_contrast>
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
      </.grid>
  </:heex>
</.demo>
