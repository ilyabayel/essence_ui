# Design Spec: EssenceUI Primitives

## Overview
A library of fully accessible, interactive, headless UI components for Phoenix LiveView, inspired by Radix UI. These components provide all the logic, ARIA attributes, and keyboard interactions without any forced styling.

## Goals
- **Accessibility:** 100% compliance with WAI-ARIA Authoring Practices.
- **Headless:** Zero default styles. Components provide structure and behavior only.
- **Composable:** A "Parts" based API (e.g., `Root`, `Trigger`, `Content`).
- **JS-First:** Interactions (focus, keyboard, open/close) are managed by Phoenix Hooks for zero-latency feedback.

## Architecture

### 1. Namespace & File Structure
- **Primitives:** `lib/essence_ui/primitives/*.ex`
- **Hooks:** `assets/js/hooks/*.js` (Refactored to be generic primitives)
- **Shared Logic:** `lib/essence_ui/primitives.ex` (Common attributes and helpers)

### 2. The "Parts" Pattern (Approach: Functional Wrapper)
Every component is split into logical parts.
- **Root:** Manages the overall state and identifies the Hook.
- **Trigger:** The interactive element that controls the state.
- **Content/Item:** The elements that appear/change based on state.

Example:
```elixir
<.accordion_root id="my-accordion" type="single">
  <.accordion_item value="item-1">
    <.accordion_header>
      <.accordion_trigger>Title</.accordion_trigger>
    </.accordion_header>
    <.accordion_content>Content</.accordion_content>
  </.accordion_item>
</.accordion_root>
```

### 3. State Management
- **JS State:** Phoenix Hooks manage ephemeral state (e.g., "which item is expanded").
- **DOM Communication:** State is reflected in the DOM via `data-state`, `data-disabled`, etc.
- **Server Sync:** Hooks use `this.pushEvent` to notify LiveView of value changes when configured.

### 4. Testing Strategy
- **Playwright:** Every primitive must have a `.spec.js` file covering:
  - Keyboard navigation (Arrows, Tab, Esc, Enter).
  - ARIA attribute updates.
  - Focus management (trapping, restoration).
- **ExUnit:** Verify Elixir components render correct initial attributes.

## Migration Path
1. **Refactor existing Hooks:** Extract logic from current `assets/js/hooks/` into generic primitive hooks.
2. **Create Primitives:** Implement the Elixir "Parts" in `lib/essence_ui/primitives/`.
3. **Rebuild Components:** Update `lib/essence_ui/components/` to be styled wrappers around the primitives.
4. **Test:** Add Playwright tests for every migrated component.

## Implementation Phases
1. **Phase 1: Foundation & Accordion** (POC)
2. **Phase 2: Overlays** (Dialog, Popover, Tooltip, Hover Card)
3. **Phase 3: Selection** (Select, Radio Group, Checkbox Group, Switch)
4. **Phase 4: Navigation** (Tabs, Context Menu, Dropdown Menu)
5. **Phase 5: Utilities** (Scroll Area, Aspect Ratio, Slot)
