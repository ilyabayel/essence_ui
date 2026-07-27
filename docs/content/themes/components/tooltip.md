---
title: Tooltip
description: Floating element that provides a control with contextual information via pointer or focus.
---

<.demo>
  <:heex code={~S|<.tooltip content="Add to library"><.icon_button radius="full"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M12 5v14"/></svg></.icon_button></.tooltip>|}>
      <.tooltip content="Add to library">
        <.icon_button radius="full">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
        </.icon_button>
      </.tooltip>
  </:heex>
</.demo>

## API Reference

This component wraps the Tooltip primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Tooltip} function={:tooltip} />
