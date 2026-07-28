---
title: Accessible Icon
description: Makes icons accessible by adding a label.
---

<.demo>
  <:heex code={~S|<.accessible_icon label="Add to library"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14"/><path d="M12 5v14"/></svg></.accessible_icon>|}>
      <.accessible_icon label="Add to library">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
      </.accessible_icon>
  </:heex>
</.demo>

## API Reference

This utility wraps icon content with a visually hidden label for screen readers. Available as `<.accessible_icon>` via `EssenceUI.Components`.

<.props_table module={EssenceUI.Utilities.AccessibleIcon} function={:accessible_icon} />
