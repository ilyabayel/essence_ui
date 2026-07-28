---
title: Flex
description: Component for creating flex layouts.
---

<.demo>
  <:heex code={~S|<.flex gap="3"><.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box><.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box><.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box><.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box><.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box></.flex>|}>
      <.flex gap="3">
        <.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>
        <.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>
        <.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>
        <.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>
        <.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>
      </.flex>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

Use these props to create flex layouts.

<.props_table module={EssenceUI.Components.Flex} function={:flex} />

Layout sizing, padding, position, overflow, and related props are shared with [Box](/themes/docs/components/box), [Grid](/themes/docs/components/grid), [Container](/themes/docs/components/container), and [Section](/themes/docs/components/section).
