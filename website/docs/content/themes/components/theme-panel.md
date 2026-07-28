---
title: Theme Panel
description: Dev-oriented controls for accent, gray, appearance, radius, and scaling.
---

Interactive theme controls for playgrounds and docs. Emits LiveView form events (`phx-change`) so the parent can update theme assigns. Try the live panel on the [Playground](/themes/playground).

<.demo>
  <:heex code={~S|<.box max_width="360px"><.theme_panel accent_color="indigo" gray_color="slate" appearance="inherit" radius="medium" scaling="100%" /></.box>|}>
      <.box max_width="360px">
        <.theme_panel
          accent_color="indigo"
          gray_color="slate"
          appearance="inherit"
          radius="medium"
          scaling="100%"
        />
      </.box>
  </:heex>
</.demo>

## API Reference

Essence-only utility (no Radix Themes counterpart). Wire `on_change` / `on_copy` to LiveView events; see [Playground](/themes/playground) for a full integration.

<.props_table module={EssenceUI.Components.ThemePanel} function={:theme_panel} />
