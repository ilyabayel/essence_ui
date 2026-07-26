---
name: primitive-docs
description: >-
  Write and update Essence UI Primitives documentation pages (Markdown + MDEx
  HEEx demos, primitive_css, Demo* CSS, anatomy, props, examples, accessibility)
  with Radix primitives docs parity. Use when authoring or improving
  docs/content/primitives/**, primitive_css, Demo* class demos, or when the user
  mentions Radix primitives docs, .radix-ui/website, or primitive component docs.
---

# Primitive docs

Radix-first authoring for Essence Primitives docs. Read Radix from the local
mirror, map to Essence LiveView APIs, write MD + Demo* CSS.

- Page template & paths: [reference.md](reference.md)
- React/Radix → Essence attrs: [mapping.md](mapping.md)
- Engine rules: `docs/ENGINE.md`

## Hard gates

Stop before writing if any gate fails.

1. **Mirror required.** Path must exist:
   `.radix-ui/website/data/primitives/docs/components/`
   If missing, tell the user to clone the Radix website repo into
   `.radix-ui/website` (gitignored as `.radix-ui/`). **Do not invent Radix copy
   from memory.**

2. **Read sources in order** for kebab name `{name}` (e.g. `alert-dialog`):

   | # | Source |
   |---|--------|
   | 1 | `.radix-ui/website/data/primitives/docs/components/{name}.mdx` |
   | 2 | `.radix-ui/website/components/demos/{name}/css/` (prefer `css/` over other styling folders) |
   | 3 | `lib/essence_ui/primitives/{snake}.ex` (`alert-dialog` → `alert_dialog.ex`) |
   | 4 | `docs/content/primitives/components/{name}.md` if it exists |
   | 5 | `assets/css/primitives/{name}.css` |
   | 6 | `storybook/primitives/{snake}.story.exs` (HEEx fallback / parity) |
   | 7 | `docs/ENGINE.md` authoring section |

3. **Props truth.** Only document attrs that exist on `EssenceUI.Primitives.*`
   (module source or `<.props_table>`). Translate Radix *ideas*; never paste
   React callbacks as LiveView attrs without checking the module. See [mapping.md](mapping.md).

4. **No speculative `all: unset`.** Do not add UA resets to component Demo* CSS
   unless the user asks. Utility resets stay in `assets/css/primitives/demo-canvas.css`.

## Workflow

Copy and track:

```
Primitive docs:
- [ ] Mirror present; Radix MDX + demo CSS read
- [ ] Essence module attrs verified
- [ ] Page sections complete (order below)
- [ ] Hero demo: Demo* + primitive_css
- [ ] Examples are Essence HEEx (Radix-translated)
- [ ] Events documented as LiveView on_* / controlled assigns
- [ ] Nav updated if new page
- [ ] No component-level all: unset unless requested
```

1. Resolve `{name}` (kebab) and `{snake}` (underscores).
2. Read all sources in the table above.
3. Diff Radix sections vs Essence module; drop or rewrite React-only features.
4. Write/update the page using **fixed section order** (below).
5. Port demo styles → `assets/css/primitives/{name}.css` with `Demo*` renames.
6. If new page: add to `docs/nav/primitives.exs`.
7. Run the done checklist.

## Fixed page section order

Gold refs: `docs/content/primitives/components/dialog.md`, `accordion.md`.

1. **Frontmatter** — `title`, `description`, optional `aria:` (from Radix MDX)
2. **Lead** — Radix Description as a short paragraph
3. **Hero demo**

```heex
<.demo variant="primitive" component="{name}" css={primitive_css("{name}")}>
  <:heex>
    … Demo* classes …
  </:heex>
</.demo>
```

4. **`<.highlights>`** — port Radix Highlights; rewrite/drop React-only bullets
5. **`## Anatomy`** — HEEx fence + `<.anatomy>` for public parts
6. **`## API Reference`** — per part: short prose, `<.props_table>`, then
   `<.data_attributes_table>` / CSS variables when Radix documents them **and**
   Essence exposes them
7. **`## Examples`** — real translated examples from Radix (not “see storybook”).
   Prefer extra `<.demo>` when interactive; else fenced `heex` / `css`
8. **`## Accessibility`** — ARIA link + `<.keyboard_table>` from Radix keyboard section

Full skeleton: [reference.md](reference.md).

## Demo & CSS conventions

- CSS tab = component file only (`primitive_css/1`); canvas is preview-only.
- Class names: `Demo{Component}{Part}` (e.g. `DemoAccordionTrigger`).
- Portaled overlays: dual selectors when needed, e.g.
  `.DemoAlertDialogContent, [data-essence-alert-dialog-content].DemoAlertDialogContent`.
- Port Radix demo CSS from `components/demos/{name}/css/` →
  `assets/css/primitives/{name}.css`; `primitive_css` strips `@import`.
- Import nothing in Markdown — `PageLive` already aliases all primitives + docs helpers.
- MDEx: no `"""` in attrs; use `~s[...]` / `~S|...|`; keep complex attrs single-line.

## Done checklist

- [ ] Radix MDX + demo CSS read from `.radix-ui/website`
- [ ] Essence module attrs verified
- [ ] Page sections complete in order
- [ ] Hero demo works with `Demo*` + `primitive_css`
- [ ] Examples are Essence HEEx (Radix-translated)
- [ ] Events documented as LiveView (`on_*` event names / controlled assigns), not React callbacks
- [ ] Nav updated if new page
- [ ] No component-level `all: unset` unless requested
