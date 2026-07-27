# Primitive docs — reference

## Path map

| Role | Path |
|------|------|
| Radix MDX | `.radix-ui/website/data/primitives/docs/components/{name}.mdx` |
| Radix demo CSS | `.radix-ui/website/components/demos/{name}/css/` |
| Essence module | `lib/essence_ui/primitives/{snake}.ex` |
| Docs page | `docs/content/primitives/components/{name}.md` |
| Docs utilities | `docs/content/primitives/utilities/{name}.md` |
| Demo CSS | `assets/css/primitives/{name}.css` (kebab filename) |
| Canvas (preview only) | `assets/css/primitives/demo-canvas.css` |
| Storybook story | `storybook/primitives/{snake}.story.exs` |
| Nav | `docs/nav/primitives.exs` |
| Engine | `docs/ENGINE.md` |
| API friction | `docs/API_FRICTION.md` |

Naming: docs/CSS/nav use **kebab** (`alert-dialog`). Elixir modules/stories use **snake** (`alert_dialog`).

### Mirror missing?

`.radix-ui/` is gitignored. Clone the Radix website into `.radix-ui/website` so
`data/primitives/docs/components/` exists. Do not proceed without it.

## Page skeleton

Frontmatter + lead + hero demo + highlights, then:

**Anatomy** — fenced `heex` tree + `<.anatomy>` parts.

**API Reference** — for each public part:

```markdown
### Root

Contains all the parts.

<.props_table module={EssenceUI.Primitives.Module} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>When applicable.</:row>
</.data_attributes_table>
```

**Examples** — Radix example titles; fenced `heex`/`css` or extra `<.demo>`.

**Accessibility** — ARIA link + `<.keyboard_table>`.

Hero demo shape:

```heex
<.demo variant="primitive" component="kebab-name" css={primitive_css("kebab-name")}>
  <:heex>
    <Module.root id="…-primitive" class="DemoNameRoot">
      …
    </Module.root>
  </:heex>
</.demo>
```

Frontmatter shape:

```markdown
---
title: Component Name
description: One-line summary from Radix metaDescription.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/…
---

Lead paragraph (Radix Description).

<.highlights>
  <:item>Feature from Radix, adapted for LiveView if needed.</:item>
</.highlights>
```

Gold pages: `docs/content/primitives/components/dialog.md`, `accordion.md`.

## Docs engine components

| Component | Use |
|-----------|-----|
| `<.demo>` | Live preview + HEEx/CSS tabs; `variant="primitive"` + `component` + `css={primitive_css(…)}` |
| `primitive_css/1` | Loads `assets/css/primitives/{name}.css` only (no canvas); strips `@import` and `.essence-demo[data-component]` prefixes |
| `<.highlights>` | Feature bullets |
| `<.anatomy>` | Named parts |
| `<.props_table>` | Attr table from `module.__components__()` |
| `<.data_attributes_table>` | `data-*` docs |
| `<.keyboard_table>` | A11y keyboard rows |
| `<.code_block>` | Standalone highlighted snippet (rare on component pages) |

Preview injects **canvas** + **component** `<style>` tags. CSS tab shows **component only**.

## Demo* CSS

1. Copy rules from `.radix-ui/website/components/demos/{name}/css/`.
2. Rename classes to `Demo{Component}{Part}` (`AccordionTrigger` → `DemoAccordionTrigger`).
3. Keep color `@import`s from `@radix-ui/colors/…` (stripped at inject time; tokens live in main CSS).
4. For portaled content, add dual selectors:

```css
.DemoDialogOverlay,
[data-essence-dialog-overlay].DemoDialogOverlay { … }
```

5. Do **not** add `all: unset` in this file unless the user asks.
6. Match live HEEx `class=` values exactly.

`primitive_css("alert-dialog")` reads `alert-dialog.css` (kebab), not `alert_dialog.css`.

## MDEx / authoring landmines

- Import nothing in the Markdown file.
- No `"""` heredocs inside HEEx attributes (MDEx can swallow the rest of the page).
- Prefer `~s[...]` / `~S|...|` for `code=` on slots when needed.
- Keep multiline-hostile attrs single-line; use slots for structured lists (`:part`, `:item`, `:row`).
- Frontmatter is flat `key: value` only (no nested YAML).

## Storybook vs docs

| Task | Touch |
|------|--------|
| Docs page / Demo* CSS / nav | Always for this skill |
| `storybook/primitives/{snake}.story.exs` | Update when keeping Storybook demos in sync with Demo* class names; HEEx tab may fall back to the story template if `<:heex>` has no `code=` |

Prefer explicit live markup in `<:heex>`; pass `code={~S|…|}` only when the tab source should differ from the live tree.

## Nav

New component page → add under Components in `docs/nav/primitives.exs`:

```elixir
%{title: "Alert Dialog", path: "components/alert-dialog"},
```

Utilities live under `docs/content/primitives/utilities/` with matching nav entries.
