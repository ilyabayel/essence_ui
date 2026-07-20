# EssenceUI Primitives Parity

Target: Radix public docs API, implemented for Phoenix LiveView with small client hooks where native HTML and LiveView are not enough.

## Implemented

- [x] Accessible Icon
- [x] Accordion
- [x] Aspect Ratio
- [x] Avatar
- [x] Alert Dialog
- [x] Checkbox
- [x] Collapsible
- [x] Dialog
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
- [x] Hover Card
- [x] Popover
- [x] Tooltip

## Missing

- [ ] Context Menu
- [ ] Dropdown Menu
- [ ] Form
- [ ] Menubar
- [ ] Navigation Menu
- [ ] One-Time Password Field
- [ ] Password Toggle Field
- [ ] Scroll Area
- [ ] Slider
- [ ] Tabs
- [ ] Toast
- [ ] Toolbar

## Implementation Rule

Each primitive needs:

- `EssenceUI.Primitives.<Name>` API matching Radix public parts where practical.
- A primitive Storybook example.
- ExUnit render coverage.
- Browser coverage for hook-backed keyboard, focus, dismissal, typeahead, or form behavior.
