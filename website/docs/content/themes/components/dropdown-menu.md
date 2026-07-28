---
title: Dropdown Menu
description: Menu representing a set of actions, triggered by a button.
---

<.demo>
  <:heex code={~S|<.dropdown_menu_root id="docs-dropdown-menu-hero"><.dropdown_menu_trigger><.button variant="soft">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item>Share</.dropdown_menu_item><.dropdown_menu_item>Add to favorites</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root>|}>
      <.dropdown_menu_root id="docs-dropdown-menu-hero">
        <.dropdown_menu_trigger>
          <.button variant="soft">
            Options
            <.dropdown_menu_trigger_icon />
          </.button>
        </.dropdown_menu_trigger>
        <.dropdown_menu_content>
          <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
          <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
          <.dropdown_menu_separator />
          <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          <.dropdown_menu_separator />
          <.dropdown_menu_item>Share</.dropdown_menu_item>
          <.dropdown_menu_item>Add to favorites</.dropdown_menu_item>
          <.dropdown_menu_separator />
          <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
        </.dropdown_menu_content>
      </.dropdown_menu_root>
  </:heex>
</.demo>

## API Reference

This component inherits props from the [Dropdown Menu primitive](/primitives/docs/components/dropdown-menu). Content portals into `container` (default `"body"`).

### Root

Contains all the parts of a dropdown menu.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_root} />

### Trigger

Wraps the control that will open the dropdown menu.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_trigger} />

### Trigger Icon

An optional icon part for the trigger.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_trigger_icon} />

### Content

The component that pops out when the dropdown menu is open.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_content} />

### Label

Used to render a label. It won't be focusable using arrow keys.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_label} />

### Item

The component that contains the dropdown menu items.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_item} />

### Separator

Visual separator between items.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_separator} />

### CheckboxItem

An item that can be controlled and rendered like a checkbox.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_checkbox_item} />

### RadioItem

An item that can be controlled and rendered like a radio.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_radio_item} />

### Sub

Contains all the parts of a submenu.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_sub} />

### SubTrigger

An item that opens a submenu. Must be rendered inside `dropdown_menu_sub`.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_sub_trigger} />

### SubContent

The component that pops out when a submenu is open. Must be rendered inside `dropdown_menu_sub`.

<.props_table module={EssenceUI.Components.DropdownMenu} function={:dropdown_menu_sub_content} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center"><.dropdown_menu_root id="docs-dropdown-menu-size-1"><.dropdown_menu_trigger><.button variant="soft" size="1">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content size="1"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-size-2"><.dropdown_menu_trigger><.button variant="soft" size="2">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content size="2"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root></.flex>|}>
      <.flex gap="3" align="center">
        <.dropdown_menu_root id="docs-dropdown-menu-size-1">
          <.dropdown_menu_trigger>
            <.button variant="soft" size="1">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content size="1">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-size-2">
          <.dropdown_menu_trigger>
            <.button variant="soft" size="2">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content size="2">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to customize the visual style of the dropdown menu.

<.demo>
  <:heex code={~S|<.flex gap="3" align="center"><.dropdown_menu_root id="docs-dropdown-menu-variant-solid"><.dropdown_menu_trigger><.button variant="solid">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="solid"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-variant-soft"><.dropdown_menu_trigger><.button variant="soft">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="soft"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root></.flex>|}>
      <.flex gap="3" align="center">
        <.dropdown_menu_root id="docs-dropdown-menu-variant-solid">
          <.dropdown_menu_trigger>
            <.button variant="solid">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="solid">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-variant-soft">
          <.dropdown_menu_trigger>
            <.button variant="soft">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="soft">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific color. You can also pass `color` to a specific item for semantic emphasis.

<.demo>
  <:heex code={~S|<.flex gap="3" wrap="wrap"><.dropdown_menu_root id="docs-dropdown-menu-color-indigo"><.dropdown_menu_trigger><.button variant="soft" color="indigo">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="soft" color="indigo"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-color-cyan"><.dropdown_menu_trigger><.button variant="soft" color="cyan">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="soft" color="cyan"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-color-orange"><.dropdown_menu_trigger><.button variant="soft" color="orange">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="soft" color="orange"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-color-crimson"><.dropdown_menu_trigger><.button variant="soft" color="crimson">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content variant="soft" color="crimson"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root></.flex>|}>
      <.flex gap="3" wrap="wrap">
        <.dropdown_menu_root id="docs-dropdown-menu-color-indigo">
          <.dropdown_menu_trigger>
            <.button variant="soft" color="indigo">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="soft" color="indigo">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-color-cyan">
          <.dropdown_menu_trigger>
            <.button variant="soft" color="cyan">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="soft" color="cyan">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-color-orange">
          <.dropdown_menu_trigger>
            <.button variant="soft" color="orange">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="soft" color="orange">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-color-crimson">
          <.dropdown_menu_trigger>
            <.button variant="soft" color="crimson">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content variant="soft" color="crimson">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid columns="2" gap="3"><.dropdown_menu_root id="docs-dropdown-menu-hc-solid-off"><.dropdown_menu_trigger><.button color="gray">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content color="gray"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-hc-solid-on"><.dropdown_menu_trigger><.button color="gray" high_contrast>Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content color="gray" high_contrast><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-hc-soft-off"><.dropdown_menu_trigger><.button color="gray" variant="soft">Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content color="gray" variant="soft"><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root><.dropdown_menu_root id="docs-dropdown-menu-hc-soft-on"><.dropdown_menu_trigger><.button color="gray" variant="soft" high_contrast>Options<.dropdown_menu_trigger_icon /></.button></.dropdown_menu_trigger><.dropdown_menu_content color="gray" variant="soft" high_contrast><.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item><.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item><.dropdown_menu_separator /><.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item></.dropdown_menu_content></.dropdown_menu_root></.grid>|}>
      <.grid columns="2" gap="3">
        <.dropdown_menu_root id="docs-dropdown-menu-hc-solid-off">
          <.dropdown_menu_trigger>
            <.button color="gray">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content color="gray">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-hc-solid-on">
          <.dropdown_menu_trigger>
            <.button color="gray" high_contrast>
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content color="gray" high_contrast>
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-hc-soft-off">
          <.dropdown_menu_trigger>
            <.button color="gray" variant="soft">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content color="gray" variant="soft">
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        <.dropdown_menu_root id="docs-dropdown-menu-hc-soft-on">
          <.dropdown_menu_trigger>
            <.button color="gray" variant="soft" high_contrast>
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content color="gray" variant="soft" high_contrast>
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
      </.grid>
  </:heex>
</.demo>
