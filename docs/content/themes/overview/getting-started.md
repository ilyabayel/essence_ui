---
title: Getting started
description: Install Essence UI and render your first themed components.
---

Essence UI is a pre-styled component library for Phoenix LiveView, inspired by [Radix UI Themes](https://www.radix-ui.com/themes).

## 1. Install

Add `:essence_ui` to your `mix.exs` dependencies, then run `mix deps.get`.

```elixir
{:essence_ui, "~> 0.2.0"}
```

## 2. Import CSS

Import Essence UI styles in your app CSS entrypoint (path relative to that file):

```css
@import "../deps/essence_ui/priv/static/essence-ui.css";
```

## 3. JavaScript hooks

Interactive components need LiveView hooks. In your `app.js`:

```javascript
import { hooks as essenceHooks } from "../deps/essence_ui/assets/js/essence_ui"

const liveSocket = new LiveSocket("/live", Socket, {
  hooks: { ...essenceHooks },
  params: { _csrf_token: csrfToken },
})
```

## 4. Theme root

Wrap your layout with the Theme component:

```heex
<.theme accent_color="indigo" gray_color="slate" radius="medium" scaling="100%">
  {@inner_content}
</.theme>
```

## 5. Start building

Import components and compose:

<.demo>
  <:heex code={~S|<.theme accent_color="indigo"><.flex gap="3" align="center"><.text size="3">Hello from Essence UI</.text><.button>Get started</.button></.flex></.theme>|}>
      <.theme accent_color="indigo" is_root={false} has_background={false}>
        <.flex gap="3" align="center">
          <.text size="3">Hello from Essence UI</.text>
          <.button>Get started</.button>
        </.flex>
      </.theme>
  </:heex>
</.demo>

Next: browse [Button](/themes/docs/components/button), open the [Playground](/themes/playground), or try the [Recruiting CRM](/crm) example.
