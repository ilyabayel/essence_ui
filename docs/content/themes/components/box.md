---
title: Box
description: Fundamental layout building block.
---

<.demo>
  <:heex code={~S|<.box width="64px" height="64px"><.decoration_box height="64px" width="64px" /></.box>|}>
      <.box width="64px" height="64px">
        <.decoration_box height="64px" width="64px" />
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

Only the `display` prop values are unique to the Box component among layout primitives.

<.props_table module={EssenceUI.Components.Box} function={:box} />

Layout sizing, padding, position, overflow, and grid/flex item props are shared with [Flex](/themes/docs/components/flex), [Grid](/themes/docs/components/grid), [Container](/themes/docs/components/container), and [Section](/themes/docs/components/section).
