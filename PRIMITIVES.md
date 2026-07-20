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
- [x] Context Menu
- [x] Dialog
- [x] Direction Provider
- [x] Dropdown Menu
- [x] Label
- [x] Menubar
- [x] Navigation Menu
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
- [x] Toast
- [x] Tooltip
- [x] Tabs
- [x] Scroll Area
- [x] Slider
- [x] Toolbar
- [x] Form
- [x] One-Time Password Field
- [x] Password Toggle Field

## Missing

_(none — all listed Radix public primitives covered)_

## Implementation Rule

Each primitive needs:

- `EssenceUI.Primitives.<Name>` API matching Radix public parts where practical.
- A primitive Storybook example.
- ExUnit render coverage.
- Browser coverage for hook-backed keyboard, focus, dismissal, typeahead, or form behavior.
