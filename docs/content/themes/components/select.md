---
title: Select
description: Displays a list of options for the user to pick from.
---

Themes Select wraps the headless Select primitive with size and variant styling.

<.demo heex={~s[<.select_root id="docs-select" value="apple"><.select_trigger placeholder="Choose a fruit…" /><.select_content><.select_item value="apple">Apple</.select_item><.select_item value="orange">Orange</.select_item></.select_content></.select_root>]}>
  <.select_root id="docs-select" value="apple">
    <.select_trigger placeholder="Choose a fruit…" />
    <.select_content>
      <.select_item value="apple">Apple</.select_item>
      <.select_item value="orange">Orange</.select_item>
      <.select_item value="grape">Grape</.select_item>
    </.select_content>
  </.select_root>
</.demo>

## Anatomy

<.anatomy>
  <:part name="select_root">Owns value and change events.</:part>
  <:part name="select_trigger">Button that opens the listbox.</:part>
  <:part name="select_content">Portaled list of items.</:part>
  <:part name="select_item">A selectable option.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Components.Select} function={:select_root} />

### Trigger

<.props_table module={EssenceUI.Components.Select} function={:select_trigger} />
