# EssenceUI Primitives Parity

Target: Radix public docs API, implemented for Phoenix LiveView with small client hooks where native HTML and LiveView are not enough.

## Implemented

- [x] Accessible Icon
- [x] Accordion
- [x] Alert Dialog
- [x] Aspect Ratio
- [x] Avatar
- [x] Checkbox
- [x] Collapsible
- [x] Context Menu
- [x] Dialog
- [x] Direction Provider
- [x] Dropdown Menu
- [x] Form
- [x] Hover Card
- [x] Label
- [x] Menubar
- [x] Navigation Menu
- [x] One-Time Password Field
- [x] Password Toggle Field
- [x] Popover
- [x] Portal — via Phoenix.Component.portal (no EssenceUI.Primitives.Portal module)
- [x] Progress
- [x] Radio Group
- [x] Scroll Area
- [x] Select
- [x] Separator
- [x] Slider
- [x] Slot
- [x] Switch
- [x] Tabs
- [x] Toast
- [x] Toggle
- [x] Toggle Group
- [x] Toolbar
- [x] Tooltip
- [x] Visually Hidden

## Missing

_(none — all listed Radix public primitives covered)_

## Implementation Rule

Each primitive needs:

- `EssenceUI.Primitives.<Name>` API matching Radix public parts where practical.
- A primitive Storybook example.
- ExUnit render coverage.
- Browser coverage for hook-backed keyboard, focus, dismissal, typeahead, or form behavior.

## Portal convention

Do not add `EssenceUI.Primitives.Portal`. Overlay and menu `portal/1` parts thin-wrap
`Phoenix.Component.portal/1` (typically `target="body"`).
