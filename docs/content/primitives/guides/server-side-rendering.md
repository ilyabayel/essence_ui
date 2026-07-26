---
title: Server-side rendering
description: LiveView always renders HTML on the first response—set initial open state carefully to avoid flashes.
---

Phoenix LiveView renders HEEx on the server for the first paint, then connects a socket and upgrades to interactive. Essence UI Primitives are designed for that model.

## Overview

Unlike client-only React apps, your LiveView already SSR-renders markup. Primitive roots ship with the correct initial `data-state` based on assigns such as `open` and `default_open`. Client hooks then attach behavior after connect.

## Initial open state

Prefer `default_open` for uncontrolled UI that should start open on first paint:

```heex
<Dialog.root id="welcome" default_open={true}>
  …
</Dialog.root>
```

Use controlled `open={@open}` when LiveView owns the state. Ensure the assign is set in `mount` / `handle_params` so the first HTML response matches the interactive state after connect.

## Avoiding flashes

- Don't default closed in HTML and only open after the hook mounts if users should see content immediately—set `default_open` or `open` on the server instead.
- Keep ids stable across patches so hooks and aria relationships stay consistent.
- For tooltips and hover cards, closed-by-default is usually correct; style the closed state so layout doesn't jump when content appears.

## Connected vs disconnected

Before the socket connects, clicks that rely on hooks may be limited. Prefer progressive enhancement: meaningful markup and links still work; rich overlay behavior activates after `phx-hook` connects. Test both the static HTML response and the connected LiveView.
