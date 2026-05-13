# Checkbox Primitive: 100% Behavioral Parity with Radix UI

## Objective
Implement a headless, accessible `Checkbox` primitive in `essence_ui` that matches the behavior of Radix UI's React implementation. This includes support for checked, unchecked, and indeterminate states, full keyboard navigation, and seamless form integration via a "bubble input".

## Architecture

The primitive is composed of four main parts using the "Parts Pattern":

1.  **`Checkbox.root`**: The parent container. 
    - Manages the overall state via the `CheckboxRoot` Phoenix Hook.
    - Props: `checked` (boolean | "indeterminate"), `default_checked`, `disabled`, `required`, `name`, `value`.
2.  **`Checkbox.trigger`**: The interactive element (`<button role="checkbox">`).
    - Handles click and keyboard interactions (`Space`).
    - Exposes state via `data-state`.
3.  **`Checkbox.indicator`**: The visual container for the checkmark/dash.
    - Only rendered when state is `checked` or `indeterminate`.
    - Supports `Presence` logic for entrance/exit animations.
4.  **`Checkbox.bubble_input`**: A hidden native `<input type="checkbox">`.
    - Synchronized with the trigger state.
    - Ensures standard form submission and native validation work.

## Implementation Details

### Phoenix Hook: `CheckboxRoot`
The hook coordinates the visual state with the hidden input:
- **`mounted()`**:
    - Cache references to the trigger and bubble input.
    - Listen for `click` on the trigger.
    - Listen for `reset` on the parent form to restore `default_checked`.
- **State Synchronization**:
    - When toggled, update `data-state` on all elements.
    - Programmatically update `checked` and `indeterminate` properties on the native `<input>`.
    - Dispatch a native `click` event from the input to trigger form listeners.
- **Keyboard Specs**:
    - `Space`: Toggle state.
    - `Enter`: Prevent default (as per WAI-ARIA).

### Elixir Primitives
- `EssenceUI.Primitives.Checkbox` will provide the components.
- Will use `data-essence-checkbox-*` attributes for hook selection.

## Testing Strategy
1. **Playwright Tests**:
    - Verify toggling via click and `Space` key.
    - Verify `indeterminate` state mapping to `aria-checked="mixed"`.
    - Verify form submission includes the correct value from the hidden input.
    - Verify form reset behavior.
    - Verify `disabled` state prevents interaction.
2. **Visual Verification**:
    - Confirm the indicator appears/disappears correctly in Storybook.
    - Verify no layout shift from the hidden input.
