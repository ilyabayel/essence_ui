---
title: Theme
description: Wraps all or part of a LiveView tree to provide theme configuration.
---

For an overview of theming see the [Theme overview](/themes/docs/theme/overview).

## API Reference

<.props_table module={EssenceUI.Components.Theme} function={:theme} />

## Examples

### Basic configuration

Wrap a component tree in `theme` to provide or modify configuration for all children.

<.demo>
  <:heex code={~S|<.box max_width="400px"><.card size="2"><.flex direction="column" gap="3"><.flex direction="column" gap="1"><.text as="div" weight="bold" size="2">Feedback</.text><.text_area placeholder="Write your feedback…" /></.flex><.flex justify="between" align="center"><.text color="gray" size="2">Attach screenshot?</.text><.switch id="theme-docs-switch" size="1" default_checked /></.flex><.grid columns="2" gap="2"><.button variant="surface">Back</.button><.button>Send</.button></.grid></.flex></.card></.box>|}>
      <.box max_width="400px">
        <.card size="2">
          <.flex direction="column" gap="3">
            <.flex direction="column" gap="1">
              <.text as="div" weight="bold" size="2">Feedback</.text>
              <.text_area placeholder="Write your feedback…" />
            </.flex>
            <.flex justify="between" align="center">
              <.text color="gray" size="2">Attach screenshot?</.text>
              <.switch id="theme-docs-switch" size="1" default_checked />
            </.flex>
            <.grid columns="2" gap="2">
              <.button variant="surface">Back</.button>
              <.button>Send</.button>
            </.grid>
          </.flex>
        </.card>
      </.box>
  </:heex>
</.demo>

### Nesting

Nest another theme to modify configuration for a specific subtree. Configuration is inherited from the parent where not overridden.

<.demo>
  <:heex code={~S|<.card size="2"><.flex gap="6" wrap="wrap"><.flex direction="column" gap="3"><.heading as="h5" size="2">Global</.heading><.flex direction="column" gap="1"><.text as="div" weight="bold" size="2">Feedback</.text><.text_area placeholder="Write your feedback…" /></.flex><.button>Send</.button></.flex><.theme accent_color="cyan" radius="full" is_root={false}><.card size="2"><.flex direction="column" gap="3"><.heading as="h5" size="2">Child</.heading><.flex direction="column" gap="1"><.text as="div" weight="bold" size="2">Feedback</.text><.text_area placeholder="Write your feedback…" /></.flex><.button>Send</.button></.flex></.card></.theme></.flex></.card>|}>
      <.card size="2">
        <.flex gap="6" wrap="wrap">
          <.flex direction="column" gap="3">
            <.heading as="h5" size="2">Global</.heading>
            <.flex direction="column" gap="1">
              <.text as="div" weight="bold" size="2">Feedback</.text>
              <.text_area placeholder="Write your feedback…" />
            </.flex>
            <.button>Send</.button>
          </.flex>
          <.theme accent_color="cyan" radius="full" is_root={false}>
            <.card size="2">
              <.flex direction="column" gap="3">
                <.heading as="h5" size="2">Child</.heading>
                <.flex direction="column" gap="1">
                  <.text as="div" weight="bold" size="2">Feedback</.text>
                  <.text_area placeholder="Write your feedback…" />
                </.flex>
                <.button>Send</.button>
              </.flex>
            </.card>
          </.theme>
        </.flex>
      </.card>
  </:heex>
</.demo>
