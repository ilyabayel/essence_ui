# API friction log (website vertical slice)

Findings while dogfooding Essence UI to build the marketing + docs site. Severity: P0 blocks slice, P1 hurts DX, P2 polish.

## Fixed in this milestone

| ID | Severity | Issue | Resolution |
|----|----------|-------|------------|
| F1 | P0 | No `Theme` component — install docs used raw `data-*` | Added `EssenceUI.Components.Theme` |
| F2 | P0 | ThemePanel CSS only, no Elixir module | Added `ThemePanel` + playground wiring |
| F3 | P1 | Utilities not on `EssenceUI.Components` facade | Re-exported `inset`, `reset`, `visually_hidden`, `accessible_icon` |
| F4 | P1 | Site needed appearance toggle | `AppearanceToggle` + `Clipboard` hooks; ThemePanel pushes appearance |

## Open / documented

| ID | Severity | Issue | Notes |
|----|----------|-------|-------|
| F5 | P1 | Themes `Dialog` requires portal `target` and differs from Primitives part tree | Docs send users to Primitives Dialog / CRM AlertDialog; align APIs later |
| F6 | P2 | `es_link` / `es_quote` naming | Phoenix/`quote` collisions — keep aliases, document in getting started |
| F7 | P2 | `Text` lacks margin props | Prefer `Flex`/`Box` spacing (ENGINE already noted) |
| F8 | P2 | Compound APIs mix slots (`tabs`) and nested fns (`select_*`) | Document both; no mass rename in v1 |
| F9 | P2 | Select has `value` but no `default_value` | LiveView controlled pattern; document in Select docs |
| F10 | P2 | IconButton needs raw SVG children | No Icons product — recommend inline SVG pattern |
| F11 | P2 | Props tables include noisy shared margin/padding attrs | Consider grouping/filtering later |
| F12 | P1 | MDEx HEEx authoring landmines | Stick to ENGINE rules (`~s[...]`, no `"""` in attrs) |

## Convention for LiveView events

Prefer documenting React-ish names as LiveView event strings (`on_change`, `on_checked_change`) rather than renaming mid-slice. Future: align on `phx-change` passthrough where possible.
