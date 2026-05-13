# Migration Guide: RadixUI to Phoenix LiveView (EssenceUI)

This guide provides the architectural context and patterns for achieving 100% feature-parity with RadixUI in the EssenceUI project.

## 🏗️ Architectural Core

### 1. Hybrid State Management
- **Client-Side (JS Hooks)**: All interactive behaviors (opening menus, keyboard navigation, focus management, ARIA state) **MUST** be handled in Phoenix Hooks (`phx-hook`).
- **Zero Latency**: Avoid Phoenix server state for smooth UI interactions like Select opening or Dialog toggling.
- **Location**: `essence_ui/assets/js/hooks/*.js`

### 2. Prop Extraction & Mapping
- **Pattern**: Mirrors Radix Themes `extractProps`.
- **Implementation**: `EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)`.
- **Logic**: Maps Elixir assigns to:
  - `rt-*` CSS classes.
  - Responsive classes (e.g., `md:rt-r-display-flex`).
  - CSS Custom Properties (e.g., `--margin: 4`).

### 3. Composition (`asChild`)
- **Radix Pattern**: Uses the `Slot` component to merge props into the immediate child.
- **EssenceUI Current**: Uses `<.dynamic_tag tag_name={@as}>`.
- **Future Goal**: Implement a robust `as_child` mechanism that can merge attributes into a child slot.

## 📻 Radio Group Parity Audit

The Radio Group implementation in EssenceUI is highly compatible with RadixUI Themes.

### ✅ Parity Successes
- **Roving Focus**: Implemented via `RadioGroupRoot` JS Hook (Arrows, Home, End).
- **Form Integration**: Correctly handles hidden input for form submission via JS.
- **Visual Props**: Full support for `size`, `variant`, `color`, and `highContrast`.
- **Responsive**: `size` support is responsive (breakpoints).

### ⚠️ Differences & Considerations
- **Standalone Radio**: EssenceUI uses `<button role="radio">` while Radix Themes standalone `Radio` uses a native `<input type="radio">`.
- **Label Markup**: Radix Themes wraps the radio and label in a `<label>` tag. EssenceUI wraps the label text in a `<span>` *inside* the radio button.
- **Composition**: Radix uses `asChild`. EssenceUI uses `@as` / `dynamic_tag` for some parts but `radio_group_item` is hardcoded to use the primitive `item`.

### 💡 Recommendation
To match Radix markup more closely, `radio_group_item` could be refactored to wrap the radio primitive and children in a `<label>` tag, rather than putting children inside the button.

To achieve 100% parity, every interactive component should follow the **Decoupled Pattern**: `Component` (Styles) -> `Primitive` (Structure) -> `JS Hook` (Behavior).

| Component | Primitive (`/primitives`) | JS Hook (`/hooks`) | Status |
| :--- | :--- | :--- | :--- |
| **Accordion** | ✅ `accordion.ex` | ✅ `accordion_root.js` | Decoupled |
| **Checkbox** | ✅ `checkbox.ex` | ✅ `checkbox_root.js` | Decoupled |
| **Select** | ✅ `select.ex` | ✅ `select_root.js` | Decoupled |
| **Switch** | ✅ `switch.ex` | ✅ `switch_root.js` | Decoupled |
| **Radio Group** | ✅ `radio_group.ex` | ✅ `radio_group_root.js` | Decoupled |
| **Collapsible** | ✅ `collapsible.ex` | ✅ `collapsible_root.js` | Decoupled |
| **Slider** | ❌ **Missing** | ❌ **Missing** | Monolithic (Incomplete) |
| **Dialog** | ❌ **Missing** | ✅ `dialog.js` | Partial (Needs Primitive) |
| **Popover** | ❌ **Missing** | ✅ `popover.js` | Partial (Needs Primitive) |
| **Tooltip** | ❌ **Missing** | ✅ `tooltip.js` | Partial (Needs Primitive) |
| **Tabs** | ❌ **Missing** | ✅ `tabs.js` | Partial (Needs Primitive) |
| **Dropdown** | ❌ **Missing** | ✅ `dropdown_menu.js` | Partial (Needs Primitive) |
| **Context Menu** | ❌ **Missing** | ✅ `context_menu.js` | Partial (Needs Primitive) |
| **Scroll Area** | ❌ **Missing** | ✅ `scroll_area.js` | Partial (Needs Primitive) |
| **Hover Card** | ❌ **Missing** | ✅ `hover_card.js` | Partial (Needs Primitive) |

### ❌ Entirely Missing (New Implementation Required)
- **Toggle** & **Toggle Group**
- **OTP Field** (One-Time Password)
- **Password Toggle Field**
- **Form** (Primitive for validation/state)
- **Toast** (Notification system)
- **Menubar** & **Navigation Menu**

## 🛠️ Implementation Workflow

When porting or finishing a component:

1.  **Analyze Source**:
    - **Props**: `themes/packages/radix-ui-themes/src/components/<name>.props.tsx`
    - **Markup**: `themes/packages/radix-ui-themes/src/components/<name>.tsx`
    - **Behavior**: `primitives/packages/react/<primitive>/src/*.tsx`

2.  **Define Props**:
    - Create/Update shared props in `lib/essence_ui/shared_props/`.
    - Use `prop_defs` in the component to map to `ExtractProps`.

3.  **Build Component**:
    - Use `Phoenix.Component`.
    - Use `ExtractProps` for class/style generation.
    - Ensure HTML structure matches Radix 1:1.

4.  **Handle Behavior**:
    - If interactive, implement a JS Hook in `assets/js/hooks/`.
    - Mirror the event listeners and keyboard handling found in Radix Primitives.

5.  **Expose & Document**:
    - Add to `lib/essence_ui/components.ex`.
    - Create a storybook entry in `essence_ui/storybook/components/<name>.story.exs`.

## 🧪 Testing & Verification
- **Visual Parity**: Compare HTML output with Radix Themes docs.
- **Behavioral Parity**: Use Playwright to verify keyboard navigation and ARIA state transitions.
- **Accessibility**: Ensure all `data-state` and `aria-*` attributes match Radix exactly.
