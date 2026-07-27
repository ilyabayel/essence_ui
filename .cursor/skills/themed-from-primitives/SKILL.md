---
name: themed-from-primitives
description: >-
  Build or refactor Essence UI themed components that wrap headless primitives
  (Radix Themes pattern): ExtractProps, SharedProps, rt-* classes,
  data-accent-color, ExUnit regression + Playwright e2e, Storybook polish.
  Use when wrapping a primitive in Components.*, converting a parallel themed
  implementation to reuse Primitives.*, or when the user mentions themed from
  primitives, Themes wrapper, or rt-* on a primitive root.
---

# Themed Components from Primitives

Essence UI has two layers:

| Layer | Path | Role |
|-------|------|------|
| Primitives | `lib/essence_ui/primitives/` | Headless behavior, hooks, a11y (`data-radix-*`, `phx-hook`) |
| Themes | `lib/essence_ui/components/` | Styled API (`rt-*`, SharedProps, `data-accent-color`) |

**Rule:** Primitive owns behavior. Themed component owns look + Themes prop surface. Do not reimplement hooks/state in Components when a matching Primitive exists.

Canonical wrappers today: `switch`, `checkbox`, `select`, `accordion`, `context_menu`, `radio_group`.

Deeper maps / gaps / Radix paths: [reference.md](reference.md).

Related: [phoenix-storybook](../phoenix-storybook/SKILL.md), [liveview-tests](../liveview-tests/SKILL.md).

## Workflow (TDD + polish)

Do in this order. Do not skip tests.

```
1. Read Radix Themes wrapper for the same component in .radix-ui/
2. Write ExUnit regression tests for the themed API (rt-*, props, primitive hooks)
3. Write / extend Playwright e2e against themes storybook
4. Implement or refactor Components.* to wrap Primitives.*
5. Run mix test + Playwright; fix until green
6. Screenshot Storybook themes story; iterate CSS/markup until polished
```

### 1. Study Radix Themes source

Local (gitignored) mirror:

- Themes: `.radix-ui/themes/packages/radix-ui-themes/src/components/<name>.tsx`
- Primitives: `.radix-ui/primitives/packages/react/<name>/` (or umbrella `radix-ui` package)

Look for:

- `import { X as XPrimitive } from 'radix-ui'`
- `extractProps` → size/variant/color → classes
- `data-accent-color` / `data-radius` on the interactive root
- Class stack: `rt-reset` + `rt-Base*` + `rt-*` (e.g. `rt-CheckboxRoot`)
- Compound parts vs single function
- Shared `_internal/base-*.css` for related components

Essence equivalents: `ExtractProps`, `SharedProps.*`, same `rt-*` class names from `assets/css/components/`.

### 2. ExUnit regression (themed)

Add `test/essence_ui/components/<name>_test.exs`.

Assert **both** Themes surface and Primitive wiring:

- `rt-*` classes, `rt-r-size-*`, `rt-variant-*`, `data-accent-color`
- Primitive markers: `phx-hook`, `role`, `data-radix-*`, part markup

Pattern: `test/essence_ui/components/switch_test.exs`.

```elixir
html = render_component(&Switch.switch/1, %{id: "s1", size: "3", color: "blue"})
assert html =~ "rt-SwitchRoot"
assert html =~ ~s[phx-hook="SwitchRoot"]
assert html =~ ~s(data-accent-color="blue")
```

Use [liveview-tests](../liveview-tests/SKILL.md) for `render_component` details.

### 3. Playwright e2e (themes)

- Primitive specs: `assets/test/<name>.spec.js` + `gotoPrimitive` → `/storybook/primitives/…`
- Themed specs: prefer themes path `/storybook/themes/components/<name>` (or extend helpers; `gotoComponent` currently hits legacy `/storybook/components/`)

Cover interaction + `expectNoA11yViolations`. Keep selectors stable (roles, `data-testid` only if already used).

### 4. Implement the wrapper

**Flat control** (Switch / Checkbox) — import parts, paint with Themes:

```elixir
use Phoenix.Component

import EssenceUI.Primitives.Switch, only: [root: 1, thumb: 1]

# SharedProps attrs + ExtractProps → rt-r-size / rt-variant / color / margin
# Ensure id for hooks

~H"""
<.root id={@id} … class={@class} data-accent-color={@color} {@rest}>
  <.thumb class="rt-SwitchThumb" />
</.root>
"""
```

**Compound** (Select / Accordion / ContextMenu) — alias primitive, one themed fn per part:

```elixir
alias EssenceUI.Primitives.Select, as: SelectPrimitive

def select_trigger(assigns) do
  # ExtractProps on this part only
  ~H"""
  <SelectPrimitive.trigger class={@class} data-accent-color={@color} …>
    …
  </SelectPrimitive.trigger>
  """
end
```

Checklist:

- [ ] Behavior attrs forwarded to primitive (`checked`, `disabled`, `on_*`, …)
- [ ] Themes props via SharedProps + ExtractProps (do not hand-roll class maps)
- [ ] `rt-reset` on interactive roots when Radix does
- [ ] `data-accent-color={@color}` when color prop exists
- [ ] Stable `id` generated if missing (hooks need it)
- [ ] Facade: `defdelegate` in `lib/essence_ui/components.ex` for public fns
- [ ] CSS already in `assets/css/components/` — reuse Radix Themes class names; rebuild CSS after edits (`npm --prefix assets run build:css`)

**Do not:**

- Duplicate `phx-hook` / state logic already in the primitive
- Mix `essence-demo` with theme `data-*` on the same story container
- Change the public Themes API unless aligning to Radix Themes (note friction in `docs/API_FRICTION.md`)

### 5. Run until green

```bash
mix test test/essence_ui/components/<name>_test.exs
# plus any primitive tests if you touched Primitives.*
npm --prefix assets run test:e2e -- <name>.spec.js   # or full suite
```

Fix failures at the layer they belong to (primitive vs themes styles vs story).

### 6. Screenshots + polish

1. `mix phx.server` → `/storybook/themes/components/<name>`
2. Capture default + key variants (size, variant, color, disabled)
3. Compare to Radix Themes docs / `.radix-ui/themes` visuals
4. Iterate CSS or class stacking only — keep primitive markup intact
5. Re-run e2e after visual fixes that change DOM/structure

## Decision guide

| Situation | Action |
|-----------|--------|
| Same-name themed exists, no primitive import | Refactor to wrap (this skill) |
| Primitive exists, no themed module | Add Components.* wrapper + story + tests |
| Themed-only (Button, Card, Flex, …) | No primitive wrap; Slot/`asChild` patterns only if needed |
| API mismatch (e.g. Dialog — see F5) | Document; prefer align to Radix Themes part tree when wrapping |

## Anti-patterns

- Parallel themed markup that copies primitive DOM without calling it
- Asserting only `rt-*` in ExUnit and missing hook/a11y attrs (regressions slip through)
- E2E only against primitives when shipping a Themes API change
- Inventing new class names instead of Radix Themes `rt-*`
