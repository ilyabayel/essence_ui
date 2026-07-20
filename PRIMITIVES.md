# EssenceUI Primitives Parity

Target: Radix public docs API, implemented for Phoenix LiveView with small client hooks where native HTML and LiveView are not enough.

## Implemented

- [x] Accessible Icon
- [x] Accordion
- [x] Aspect Ratio
- [x] Avatar
- [x] Checkbox
- [x] Collapsible
- [x] Direction Provider
- [x] Label
- [x] Portal — via Phoenix.Component.portal (no EssenceUI.Primitives.Portal module)
- [x] Progress
- [x] Radio Group
- [x] Select
- [x] Separator
- [x] Slot
- [x] Switch
- [x] Toggle
- [x] Toggle Group
- [x] Visually Hidden

## Missing

- [ ] Alert Dialog
- [ ] Context Menu
- [ ] Dialog
- [ ] Dropdown Menu
- [ ] Form
- [ ] Hover Card
- [ ] Menubar
- [ ] Navigation Menu
- [ ] One-Time Password Field
- [ ] Password Toggle Field
- [ ] Popover
- [ ] Scroll Area
- [ ] Slider
- [ ] Tabs
- [ ] Toast
- [ ] Toolbar
- [ ] Tooltip

## Implementation Rule

Each primitive needs:

- `EssenceUI.Primitives.<Name>` API matching Radix public parts where practical.
- A primitive Storybook example.
- ExUnit render coverage.
- Browser coverage for hook-backed keyboard, focus, dismissal, typeahead, or form behavior.
