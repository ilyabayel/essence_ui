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

The documentation site and CRM demo live in [`website/`](website/) as a separate Mix app (`:essence_ui_web`) that depends on this library via `{:essence_ui, path: ".."}`.

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

## Implementation plan and TODO

Essence UI provides accessible, themeable Phoenix LiveView components inspired by Radix Themes. The checklist below tracks component coverage; Radix Themes docs are an optional reference for familiar APIs and patterns: [Getting started with Radix Themes](https://www.radix-ui.com/themes/docs/overview/getting-started).

### ✅ Completed Components (25/52)

#### Layout (5/5) ✅
- [x] `Box`
- [x] `Flex`
- [x] `Grid`
- [x] `Container`
- [x] `Section`

#### Typography (9/9) ✅
- [x] `Text`
- [x] `Heading`
- [x] `Blockquote`
- [x] `Code`
- [x] `Em`
- [x] `Kbd`
- [x] `Link`
- [x] `Quote`
- [x] `Strong`

#### Components (11/38)
- [x] `AlertDialog` ✅
- [x] `AspectRatio` ✅
- [x] `Avatar` ✅
- [x] `Badge` ✅
- [x] `Button` ✅
- [x] `Callout` ✅
- [x] `Card` ✅
- [x] `Checkbox` ✅
- [x] `CheckboxCards` ✅
- [x] `Dialog` ✅
- [x] `IconButton` ✅
- [x] `Progress` ✅
- [x] `Radio` ✅
- [x] `RadioGroup` ✅
- [x] `SegmentedControl` ✅
- [x] `Select` ✅
- [x] `Separator` ✅
- [x] `Skeleton` ✅
- [x] `Slider` ✅
- [x] `Spinner` ✅
- [x] `Switch` ✅
- [x] `Table` ✅
- [x] `Tabs` ✅
- [x] `TextArea` ✅
- [x] `TextField` ✅
- [x] `Tooltip` ✅
- [x] `CheckboxGroup` ✅
- [x] `RadioCards` ✅
- [x] `ContextMenu` ✅
- [x] `DropdownMenu` ✅
- [x] `HoverCard` ✅
- [x] `Popover` ✅
- [x] `TabNav` - Tab navigation (different from Tabs)

### 🚧 Remaining Components (21/52)

#### Data Display Components (2)
- [ ] `DataList` - Key-value pair list
- [ ] `ScrollArea` - Custom scrollable area

#### Utility Components (5)
- [ ] `AccessibleIcon` - Accessible icon wrapper
- [ ] `Inset` - Negative margin utility
- [ ] `Portal` - Render content in different DOM location
- [ ] `Reset` - CSS reset component
- [ ] `Slot` - Slot composition primitive
- [ ] `VisuallyHidden` - Visually hidden but screen-reader accessible

#### Theme Component (1)
- [ ] `Theme` - Root theme configuration component

### Phase 3: Navigation & Data Display

- [x] `TabNav` component
- [x] `DataList` component
- [x] `ScrollArea` with custom scrollbars
- [x] Add dense data display examples

### Phase 4: Utility Components

- [x] `AccessibleIcon` wrapper
- [x] `Inset` utility
- [x] `Portal` primitive
- [x] `Slot` composition
- [x] `VisuallyHidden` utility
- [x] `Reset` component

### Phase 5: Theme & Polish

- [ ] `Theme` root component (appearance, accent, gray, radius, scaling)
- [ ] `ThemePanel` dev-only component
- [ ] Normalize props across all components using `shared_props`
- [ ] Dark mode documentation and examples
- [ ] Add prop tables in docs
- [ ] Establish a11y checks in CI

### Docs and examples

- [ ] Themes docs category parity
- [ ] Usage patterns guide (controlled vs uncontrolled, `as_child`, composition)
- [ ] Migration guide from plain HTML to components

### Nice-to-have later

- [ ] Composables for state machines
- [ ] Visual regression tests

## Learn more

* Source: https://github.com/ilyabayel/essence_ui
* Changelog: [CHANGELOG.md](CHANGELOG.md)
* Hex: https://hex.pm/packages/essence_ui (after first publish)
* HexDocs: https://hexdocs.pm/essence_ui (after first publish)
