# Design Spec: EssenceUI Primitives (Full Radix Parity)

## Overview
A library of 30 fully accessible, interactive, headless UI components for Phoenix LiveView, matching the functional scope of Radix UI. These components provide structure, ARIA attributes, and keyboard interactions without any default styles.

## Goals
- **Full Parity:** Implement all 30 primitives provided by Radix UI.
- **Accessibility:** 100% compliance with WAI-ARIA Authoring Practices.
- **Headless:** Zero default styles. Components provide behavior only.
- **Composable:** A "Parts" based API (e.g., `Root`, `Trigger`, `Content`).
- **JS-First:** Interactions managed by Phoenix Hooks for zero-latency feedback.

## Architecture

### 1. Namespace & File Structure
- **Primitives:** `lib/essence_ui/primitives/*.ex`
- **Hooks:** `assets/js/hooks/*.js` (Generic primitive hooks)
- **Shared Logic:** `lib/essence_ui/primitives.ex` (Common attributes and helpers)

### 2. The "Parts" Pattern
Every component is split into logical parts.
- **Root:** Manages state and identifies the Hook.
- **Trigger/Toggle:** Interactive elements controlling the state.
- **Portal/Content:** Elements rendering state-dependent content.

### 3. State & Testing
- **State:** Managed in JS Hooks; reflected via `data-state`.
- **Testing:** Playwright for E2E (keyboard, ARIA, focus) + ExUnit for rendering.

## Component List (The 30 Primitives)

1.  **Accordion**
2.  **Alert Dialog**
3.  **Aspect Ratio**
4.  **Avatar**
5.  **Checkbox**
6.  **Collapsible**
7.  **Context Menu**
8.  **Dialog**
9.  **Dropdown Menu**
10. **Form**
11. **Hover Card**
12. **Label**
13. **Menubar**
14. **Navigation Menu**
15. **One-Time Password Field**
16. **Password Toggle Field**
17. **Popover**
18. **Progress**
19. **Radio Group**
20. **Scroll Area**
21. **Select**
22. **Separator**
23. **Slider**
24. **Switch**
25. **Tabs**
26. **Toast**
27. **Toggle**
28. **Toggle Group**
29. **Toolbar**
30. **Tooltip**

## Migration Path
1. Refactor existing Hooks into generic primitives.
2. Implement Elixir "Parts" in `lib/essence_ui/primitives/`.
3. Update `lib/essence_ui/components/` to consume primitives.
4. Add Playwright tests for every migrated primitive.
