# Radix Themes → Essence mapping

Use when translating Themes MDX props and live examples into HEEx. **Always
verify** against `lib/essence_ui/components/{snake}.ex` — this table is a guide,
not a guarantee every prop exists.

## Naming

| Radix Themes / React | Essence HEEx |
|----------------------|--------------|
| `className` | `class` |
| camelCase props (`highContrast`) | `snake_case` (`high_contrast`) |
| `Button` / `Select.Root` | `<.button>` / `<.select_root>` |
| `asChild` | `as_child` when attr exists; often incomplete — prefer nesting link/button until composition works |
| JSX children | HEEx slots / nested tags |
| `TextField.Root` + `TextField.Slot` | Single `<.text_field>` + `<:slot side="left\|right">` |
| Margin / layout on Flex/Box | `gap`, `mt`, `max_width`, `width` (snake_case) |

## Boolean props

| Radix | Essence |
|-------|---------|
| `highContrast` | `high_contrast` (presence or `={true}`) |
| `loading` | `loading` |
| `disabled` | `disabled` |

## State & events (Themes wrappers)

| Radix | Essence | Notes |
|-------|---------|-------|
| `defaultValue` | Often absent | Themes Select is **controlled** `value` (see F9 in `API_FRICTION.md`) |
| `onValueChange` | `on_change` string event name on select root | Not a JS callback |
| Dialog open | `JS.dispatch("open"\|"close", to: "#id")` | Themes Dialog has no Trigger/Close parts |
| Dialog portal | required `target` (e.g. `"body"`) | Differs from Primitives optional portal |

## Parts mapping (examples from Batch 1)

| Radix Themes | Essence |
|--------------|---------|
| `Button` | `button/1` |
| `Card` | `card/1` |
| `Dialog.Root/Trigger/Content/Title/Description/Close` | `dialog/1` + `dialog_content/1` only; compose Heading/Text/Button |
| `Select.Root/Trigger/Content/Item/Group/Label/Separator` | `select_*` functions (same parts) |
| `Select` size on Root | Size on **trigger** and **content** (not root) |
| `TextField.Root` / `Slot` | `text_field/1` + `<:slot>` |
| `Inset` | `<.inset>` (`EssenceUI.Utilities.Inset`) |
| Icons (`BookmarkIcon`) | Inline SVG |

## Layout demos

| Radix | Essence |
|-------|---------|
| `<DecorativeBox />` | `<.decoration_box />` (`EssenceUIWeb.DecorationBox`, imported in `PageLive`) |
| Responsive maps `{ initial, md }` | `%{initial: "1", md: "2"}` (atom keys) |
| Section `size` | CSS exists; Elixir `size` attr not wired — use `py` / padding until fixed |
| Full-bleed layout heroes | Outer root needs `width="100%"` (or rely on `.docs-demo__preview > .rt-Box` etc. rule in `docs.css`) — preview is a flex row and otherwise shrink-to-fits to a hairline |

## Omit or adapt

| Radix example | Action |
|---------------|--------|
| Radius on Text Field / Select Trigger | Omit if no `radius` attr |
| Dialog Size / Inset | Omit until Themes Dialog exposes size / uses inset cleanly |
| Select With SSR / With an icon (custom trigger children) | Omit unless trigger children API is real |
| Button Spinner-wrapped icon loading | Omit if Spinner has no wrap-children API; keep `loading` prop demo |
| Links to `/themes/docs/overview/layout#margin-props` | Say “common margin props” until that guide exists |
| Links to undocumented pages (Inset) | Mention `<.inset>` without a dead link |

## Layout helpers

- **`Text` has no margin props** — wrap with `Box`/`Flex` (`gap`, `mt` on Box).
- `Heading` **does** support margin props.
- Prefer `max_width` / `width` on `Box`/`Flex` over inline styles when WidthProps exist.

## Examples translation checklist

1. Replace JSX with HEEx components already imported via `EssenceUI.Components`.
2. Unique `id`s for every Select/Dialog instance on the page.
3. Put `size`/`variant`/`color` on the Essence part that actually defines them.
4. Drop TypeScript-only, `asChild`-only, or unsupported part examples.
5. Inline small SVGs for icons.
6. Keep Radix section titles (`### Size`, `### Variant`, `#### Ghost`).
