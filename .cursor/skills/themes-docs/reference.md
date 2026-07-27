# Themes docs — reference

## Path map

| Role | Path |
|------|------|
| Radix Themes MDX | `.radix-ui/website/data/themes/docs/components/{name}.mdx` |
| Radix Themes routes / IA | `.radix-ui/website/utils/themesRoutes.ts` |
| Radix Themes source | `.radix-ui/themes/packages/radix-ui-themes/src/components/` |
| Essence module | `lib/essence_ui/components/{snake}.ex` |
| Utilities (Inset, etc.) | `lib/essence_ui/utilities/{snake}.ex` (re-exported on `EssenceUI.Components`) |
| Docs page | `docs/content/themes/components/{name}.md` |
| Storybook story | `storybook/themes/components/{snake}.story.exs` |
| Nav | `docs/nav/themes.exs` |
| Engine | `docs/ENGINE.md` |
| API friction | `docs/API_FRICTION.md` |

Naming: docs/nav use **kebab** (`text-field`). Elixir modules/stories use **snake** (`text_field`).

### Mirror missing?

`.radix-ui/` is gitignored. Clone the Radix website into `.radix-ui/website` so
`data/themes/docs/components/` exists. The themes package alone is **not** the
docs source — MDX lives in the website repo.

## Page skeleton

```markdown
---
title: Component Name
description: One-line summary from Radix metaDescription.
---

Optional lead only when chrome description is insufficient.

<.demo>
  <:heex code={~S|…hero…|}>
    …hero…
  </:heex>
</.demo>

## API Reference

Prose (base element + common margin props when applicable).

### PartName

Short prose.

<.props_table module={EssenceUI.Components.Module} function={:part_fn} />

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|…|}>
    …
  </:heex>
</.demo>
```

Gold pages: `button.md`, `card.md`, `select.md`, `text-field.md`, `dialog.md`,
plus Layout: `box.md`, `flex.md`, `grid.md`, `container.md`, `section.md`.

Layout demos use `<.decoration_box>` from `EssenceUIWeb.DecorationBox`
(imported in `PageLive`).

## Nav IA (Radix-aligned)

When expanding beyond Batch 1, group like `themesRoutes.ts`:

- **Layout** — Box, Flex, Grid, Container, Section
- **Typography** — Text, Heading, Blockquote, Code, Em, Kbd, Link, Quote, Strong
- **Components** — remaining interactive components
- **Skip** Radix utilities Essence lacks as docs pages until modules exist:
  accessible-icon (utility exists), inset (utility exists — document when batching utilities),
  portal, reset, slot, visually-hidden as appropriate
- **Essence-only** last: Accordion, ThemePanel (no Radix Themes MDX)

## Docs engine components

| Helper | Use |
|--------|-----|
| `<.demo>` | Live HEEx preview + code tab (Themes default) |
| `<.props_table>` | Attrs from `attr` on the function |
| `<.code_block>` | Standalone highlighted snippet |

Primitives-only helpers (`primitive_css`, `variant="primitive"`, `<.anatomy>`,
`<.highlights>`, `<.keyboard_table>`) stay off Themes pages.

## Batch workflow

Polish **5 pages** per batch → browser verify → pause for feedback → next batch.
Default next after Batch 1: Layout (Box, Flex, Grid, Container, Section).
