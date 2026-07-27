# Themed-from-primitives reference

## Radix Themes → Essence mapping

| Radix Themes | Essence |
|--------------|---------|
| `import { X as XPrimitive } from 'radix-ui'` | `import` / `alias EssenceUI.Primitives.X` |
| `extractProps(props, propDefs)` | `EssenceUI.Helpers.ExtractProps.call/2` |
| `colorProp`, `marginProp`, … | `EssenceUI.SharedProps.*` macros + `prop_defs` |
| `data-accent-color={color}` | same attr on primitive root |
| `classNames('rt-reset', 'rt-Foo', …)` | list → join / class list on part |
| `asChild` / Slot | Elixir: compose parts explicitly; utilities in `lib/essence_ui/utilities/` |
| `_internal/base-*.css` | Shared `rt-Base*` classes in `assets/css/components/` / styles |
| Theme provider `data-*` | Storybook themes container / `EssenceUI.Components.Theme` |

### Where to read upstream

```
.radix-ui/themes/packages/radix-ui-themes/src/components/<name>.tsx
.radix-ui/themes/packages/radix-ui-themes/src/components/<name>.css
.radix-ui/themes/packages/radix-ui-themes/src/components/_internal/
.radix-ui/primitives/packages/react/<name>/
.radix-ui/primitives/packages/react/radix-ui/src/index.ts   # namespace re-exports
```

Themes depends on the unified `radix-ui` package, not `@radix-ui/react-*` per import.

## Existing Essence wrappers (do copy these)

| Component | Module | Pattern |
|-----------|--------|---------|
| Switch | `lib/essence_ui/components/switch.ex` | `import …, only: [root, thumb]` |
| Checkbox | `lib/essence_ui/components/checkbox.ex` | `import` + Base+Root class stack + indicator icons |
| Select | `lib/essence_ui/components/select.ex` | `alias … as: SelectPrimitive`; `select_*` parts |
| Accordion | `lib/essence_ui/components/accordion.ex` | `alias … as: Primitive`; slots + part fns |
| ContextMenu | `lib/essence_ui/components/context_menu.ex` | heavy compound; moduledoc says wraps primitive |
| RadioGroup | `lib/essence_ui/components/radio_group.ex` | `alias … as: RadioGroupPrimitive` |

Reference ExUnit: `test/essence_ui/components/switch_test.exs`, `checkbox_test.exs`, `context_menu_test.exs`.

## Same-name themed that do NOT wrap yet

Candidates to refactor with this skill:

`dialog`, `popover`, `tooltip`, `hover_card`, `scroll_area`, `progress`, `separator`, `slider`, `tabs`, `avatar`, `alert_dialog`, `dropdown_menu`, `aspect_ratio`, `radio`

Note: Themes Dialog API friction is logged as F5 in `docs/API_FRICTION.md` — align carefully.

## Primitives without a themed module

`collapsible`, `direction_provider`, `form`, `label`, `menubar`, `navigation_menu`, `one_time_password_field`, `password_toggle_field`, `toast`, `toggle`, `toggle_group`, `toolbar`

Utilities (`accessible_icon`, `slot`, `visually_hidden`) live under `lib/essence_ui/utilities/` and are re-exported on `EssenceUI.Components`.

## Storybook / tests paths

| Artifact | Path |
|----------|------|
| Primitive story | `storybook/primitives/<name>.story.exs` — container `essence-demo` + `data-component` |
| Themes story | `storybook/themes/components/<name>.story.exs` — theme `data-*` only |
| Legacy story mirror | `storybook/components/` — prefer themes path for new work |
| ExUnit themed | `test/essence_ui/components/<name>_test.exs` |
| ExUnit primitive | `test/essence_ui/primitives/<name>_test.exs` |
| Playwright | `assets/test/<name>.spec.js` |
| Helpers | `assets/test/helpers/story.js`, `a11y.js` |

## Facade

Public Themes API is `EssenceUI.Components` via `defdelegate` in `lib/essence_ui/components.ex`. New public functions must be delegated.

## Visual polish checklist

- [ ] Default size/variant matches Radix Themes story
- [ ] Color prop remaps accent (inspect `data-accent-color` + computed `--accent-*`)
- [ ] Disabled / high-contrast look correct
- [ ] Focus ring uses theme focus tokens
- [ ] Compound: trigger/content spacing, portal layering, animations if Themes has them
- [ ] Mobile / narrow viewport if component is overlay-based
- [ ] CSS rebuilt: `npm --prefix assets run build:css`
