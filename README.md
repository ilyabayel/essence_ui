# Essence UI

Accessible, themeable [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view) components inspired by [Radix UI](https://www.radix-ui.com).

## Installation

Add to your `mix.exs` dependencies and run `mix deps.get`:

```elixir
{:essence_ui, "~> 0.2.0"}
```

### CSS (Themes)

Import the prebuilt stylesheet from your app CSS entrypoint (path relative to that file):

```css
@import "../deps/essence_ui/priv/static/essence-ui.css";
```

### JavaScript hooks

Interactive primitives and themed overlays need LiveView hooks. Import them into your `app.js`:

```javascript
import { hooks as essenceHooks } from "../deps/essence_ui/assets/js/essence_ui"

const liveSocket = new LiveSocket("/live", Socket, {
  hooks: { ...essenceHooks },
  params: { _csrf_token: csrfToken },
})
```

### Usage

```elixir
import EssenceUI.Components
```

```heex
<.theme accent_color="indigo" gray_color="slate" radius="medium">
  <.flex gap="3" align="center">
    <.text size="3">Hello from Essence UI</.text>
    <.button>Get started</.button>
  </.flex>
</.theme>
```

Headless primitives live under `EssenceUI.Primitives.*`.

## Docs site (this repo)

The documentation site and CRM demo live in the [`website/`](https://github.com/ilyabayel/essence_ui/tree/main/website) directory as a separate Mix app (`:essence_ui_web`) that depends on this library via `{:essence_ui, path: ".."}`.

```bash
# library (root)
mix setup
mix test

# docs site
cd website
mix setup
mix phx.server
```

Visit [localhost:4000](http://localhost:4000).

E2E (Playwright) from `website/assets/`:

```bash
cd website
npm --prefix assets ci
npx --prefix assets playwright install chromium
npm --prefix assets run test:e2e
```

## Publishing to Hex

Package metadata lives in `mix.exs` (`package/0`, `description/0`, `docs/0`). Before publishing:

```bash
mix hex.build          # preview tarball contents
mix docs               # build ExDoc locally
mix hex.publish        # requires a Hex user (`mix hex.user register`)
```

## Learn more

* Source: https://github.com/ilyabayel/essence_ui
* Changelog: [CHANGELOG.md](CHANGELOG.md)
* Hex: https://hex.pm/packages/essence_ui
* HexDocs: https://hexdocs.pm/essence_ui
