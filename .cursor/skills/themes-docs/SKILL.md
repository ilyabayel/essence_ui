---
name: themes-docs
description: >-
  Write and update Essence UI Themes (styled Components.*) documentation pages
  (Markdown + MDEx HEEx demos, props tables, Radix Themes example parity). Use
  when authoring or improving docs/content/themes/**, themes nav, or when the
  user mentions Radix Themes docs, .radix-ui/website themes MDX, or themed
  component docs.
---

# Themes docs

Radix Themes–first authoring for Essence Themes component docs. Read Radix from
the local mirror, map to `EssenceUI.Components.*` LiveView APIs, write MD +
`<.demo>` HEEx.

- Page template & paths: [reference.md](reference.md)
- React/Radix Themes → Essence attrs: [mapping.md](mapping.md)
- Engine rules: `docs/ENGINE.md`
- Friction log: `docs/API_FRICTION.md`

## Hard gates

Stop before writing if any gate fails.

1. **Mirror required.** Path must exist:
   `.radix-ui/website/data/themes/docs/components/`
   If missing, tell the user to clone the Radix website repo into
   `.radix-ui/website` (gitignored as `.radix-ui/`). **Do not invent Radix copy
   from memory.**

2. **Read sources in order** for kebab name `{name}` (e.g. `text-field`):

   | # | Source |
   |---|--------|
   | 1 | `.radix-ui/website/data/themes/docs/components/{name}.mdx` |
   | 2 | `.radix-ui/themes/packages/radix-ui-themes/src/components/{snake}.*` (props/CSS if needed) |
   | 3 | `lib/essence_ui/components/{snake}.ex` (`text-field` → `text_field.ex`) |
   | 4 | `docs/content/themes/components/{name}.md` if it exists |
   | 5 | `docs/ENGINE.md` authoring section |

3. **Props truth.** Only document attrs that exist on `EssenceUI.Components.*`
   (module source or `<.props_table>`). Translate Radix *ideas*; never paste
   React callbacks or unsupported parts. See [mapping.md](mapping.md).

4. **No Primitives page shape.** Themes pages do **not** use Anatomy,
   Highlights, or Accessibility H2s. Match Radix Themes: hero → API → Examples.

## Workflow

Copy and track:

```
Themes docs:
- [ ] Mirror present; Radix Themes MDX read
- [ ] Essence Components.* attrs verified
- [ ] Page sections complete (order below)
- [ ] Hero + Examples are Essence HEEx (Radix-translated)
- [ ] Unsupported Radix examples omitted (not stubbed)
- [ ] Nav updated if new page
- [ ] Browser check: page loads; hero demo works
```

1. Resolve `{name}` (kebab) and `{snake}` (underscores).
2. Read all sources in the table above.
3. Diff Radix sections vs Essence module; drop or rewrite React-only features.
4. Write/update the page using **fixed section order** (below).
5. If new page: add to `docs/nav/themes.exs` (Layout / Typography / Components
   groups when expanding beyond the first components list).
6. Verify in browser under `/themes/docs/components/{name}`.

## Fixed page section order

Gold refs: `docs/content/themes/components/button.md`, `select.md`, `card.md`.

1. **Frontmatter** — `title`, `description` (from Radix `metaDescription`)
2. **Optional lead** — only when needed beyond the chrome description (e.g.
   Dialog pointing at Primitives). Do **not** repeat `description` verbatim.
3. **Hero demo** — untitled opening `<.demo>` (default Themes variant, not
   `variant="primitive"`)

```heex
<.demo>
  <:heex code={~S|…|}>
    …
  </:heex>
</.demo>
```

4. **`## API Reference`** — short prose (base element + margin props when true),
   then per part `### Root` / `### Trigger` / … with `<.props_table>` for each
   public function. Single-function components: one props table, no fake parts.
5. **`## Examples`** — Radix example titles as `### Size`, `### Variant`, etc.
   Prefer `<.demo>` for interactive examples; fenced `heex` for static snippets
   (e.g. Slot usage). Nested `#### Ghost` when Radix uses H4.

## Demo & CSS conventions

- Themes demos use default `<.demo>` — no `primitive_css`, no `Demo*` canvas CSS.
- Import nothing in Markdown — `PageLive` already aliases `EssenceUI.Components`
  + docs helpers.
- MDEx: no `"""` in attrs; use `~s[...]` / `~S|...|`; keep complex attrs single-line.
- Icons: inline Lucide-style SVG (no Radix Icons package). Prefer patterns from
  existing `docs/content/themes/components/*.md` demos.
- **Text has no margin props** — use `Flex`/`Box` spacing (`gap`, `mt` on Box).
- Unique `id`s for every Select/Dialog/interactive demo on the page.

## Done checklist

- [ ] Radix Themes MDX read from `.radix-ui/website`
- [ ] Essence Components.* attrs verified
- [ ] Page sections: hero → API → Examples (Radix titles)
- [ ] Unsupported examples omitted with clear API notes when material (Dialog)
- [ ] Nav updated if new page
- [ ] Browser: `/themes/docs/components/{name}` loads; hero works
