---
name: phoenix-storybook
description: >-
  Write Essence UI Phoenix Storybook stories (.story.exs) for primitives,
  themes, and examples — containers, radix-demo, theme data attrs, Variation
  templates, React-like HEEx formatting. Use when adding or editing storybook
  stories, PhoenixStorybook.Story, Variation/VariationGroup, story containers,
  or when the user mentions storybook primitives/themes/examples demos.
---

# Phoenix Storybook Stories

Guide for writing `.story.exs` in this repo.

- Story API: https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html
- Copy-paste skeletons: [templates.md](templates.md)

Stories live under `storybook/`. Dev server: `mix phx.server` → Storybook at `/`.

## Mental model — three layers

| Layer | Path | Kind | Wrapper |
|-------|------|------|---------|
| Primitives | `storybook/primitives/` | `:component` | `def container` → `radix-demo` + `data-component` |
| Themes | `storybook/themes/{components,layout,typography,utilities}/` | `:component` | theme data attrs only (no `radix-demo`) |
| Examples | `storybook/examples/` | `:example` | root `div` with theme attrs + `class="essence-ui"` |

**Hard rules**

- Never mix theme attrs and `radix-demo` on the same container.
- Always `@moduledoc false`. Component stories: `layout: :one_column`.

## Primitives

Headless Radix-style demos. CSS is scoped under `.radix-demo[data-component="…"]` in `assets/css/primitives/`. Playwright often targets the same selector.

```elixir
def container,
  do:
    {:div,
     class: "radix-demo",
     "data-component": "accordion"}
```

- Put the wrapper **once** on `container`. Do **not** wrap again in `template`.
- `data-component` must be **kebab-case** matching CSS/E2E (`alert-dialog`, not `alert_dialog`).
- Exception: **separator** uses `container: :iframe` and keeps `<div class="radix-demo" data-component="separator">` **inside** the template (iframe CSS isolation).
- Markup: module tags (`Dialog.root`, `Accordion.trigger`), PascalCase demo classes (`DialogContent`, `AccordionRoot`), stable ids for hooks/tests.
- Typical variation id: `:primitive`. Multiple modes OK (`:multiple`, `:collapsible`) when behavior differs.

Reference: `storybook/primitives/dialog.story.exs`, `accordion.story.exs`.

## Themes

Styled Themes API demos.

**Container attrs by subfolder**

| Subfolder | Container |
|-----------|-----------|
| `components/` | Full 5: `data-scaling`, `data-radius`, `style`, `data-gray-color`, `data-accent-color` |
| `typography/`, `layout/`, `utilities/` | Keep that file’s existing thinner set; multiline only — do **not** invent missing accent/radius |

```elixir
def container,
  do:
    {:div,
     "data-scaling": "100%",
     "data-radius": "medium",
     style: "display: block;",
     "data-gray-color": "slate",
     "data-accent-color": "indigo"}
```

- Use `imports` for compound parts; templates use `<.component>` / slot APIs.
- Prefer `%VariationGroup{}` for prop matrices (variants, sizes, colors); `%Variation{}` + `template:` for composed demos.

Reference: `storybook/themes/components/button.story.exs`, `accordion.story.exs`.

## Examples

Full-page compositions.

- `use PhoenixStorybook.Story, :example`
- `import EssenceUI.Components, except: [quote: 1]` (when using Components)
- Single `render/1` with `~H`; root wrapper carries theme attrs + `essence-ui` (no `radix-demo`)

Reference: `storybook/examples/dense_display.story.exs`.

## Formatting (React-like)

Treat HEEx like JSX:

1. Opening tags with **2+ attrs** → one attr per line; children indented; closing tag alone.
2. Multi-attr `def container` keyword lists → one attr per line.
3. `mix format` does **not** reformat HEEx inside `template: """` — format those strings manually. Example `~H"""` **is** formatted by `mix format`.

```heex
<Accordion.root
  id="accordion-primitive"
  type="single"
  default_value="item-1"
  collapsible={true}
  class="AccordionRoot"
>
```

## Anti-patterns

- Double `radix-demo` (on `container` **and** in template)
- Theme data attrs on primitive containers
- One-line attribute soup on long tags
- Wrong `data-component` name vs CSS/E2E
- Speculative props, VariationGroups, or demos beyond what was asked

## Workflow

1. Pick the layer (primitive / themes / example) → match path and wrapper rules above.
2. Copy the matching skeleton from [templates.md](templates.md).
3. Fill variations; keep descriptions short; use stable ids.
4. Format multi-attr tags by hand in `template:` strings.
5. Verify (below).

## Verification

- [ ] Grep leftover `class="radix-demo"` in `storybook/primitives/*` templates — only **separator** should remain
- [ ] Story page loads in Storybook; demo CSS still applies (primitives: sandbox has `.radix-demo[data-component="…"]`)
- [ ] `mix format` on touched `.exs` files
- [ ] If the primitive has E2E coverage, run the matching `assets/test/*.spec.js`
