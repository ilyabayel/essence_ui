---
title: Section
description: Denotes a section of page content.
---

<.demo>
  <:heex code={~S|<.box width="100%" py="8" style="background-color: var(--gray-a2); border-radius: var(--radius-3);"><.section><.decoration_box height="64px" width="100%" /></.section></.box>|}>
      <.box width="100%" py="8" style="background-color: var(--gray-a2); border-radius: var(--radius-3);">
        <.section>
          <.decoration_box height="64px" width="100%" />
        </.section>
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `section` element and supports common margin props.

<.props_table module={EssenceUI.Components.Section} function={:section} />

Layout sizing, padding, position, overflow, and related props are shared with [Box](/themes/docs/components/box), [Flex](/themes/docs/components/flex), [Grid](/themes/docs/components/grid), and [Container](/themes/docs/components/container).

Themes CSS also defines `rt-r-size-*` vertical padding for Section; the Elixir `size` attr is not wired yet—use padding props (`py`, `pt`, `pb`) until it lands.
