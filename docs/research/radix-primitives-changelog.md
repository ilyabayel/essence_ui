# Radix primitives changelog

What changed in [Radix Primitives](https://github.com/radix-ui/primitives) through the published `radix-ui` package **1.8.1**, plus changesets already on `main` that are not in that release.

## Essence UI

Checked the LiveView primitives and hooks against this changelog on 9 Nov 2026. React-only items (RSC, `use client`, tree-shaking, TypeScript callback types, Slot generics, unstable collection renames) do not apply.

Already aligned: `on_visibility_change` on password toggle, toggle-group `radiogroup` / `toolbar` roles, `align` on menu subcontent, controlled context-menu `open`, toast Escape only while that toast is focused, slider `aria-disabled` only when disabled, checkbox and switch form `reset`, avatar `naturalWidth === 0` reported as error.

Still different from current Radix:

- **Navigation menu.** No `activation_mode` or `disable_toggle`. Hover opens a trigger; focus does not. Click always toggles the open item. `lib/essence_ui/primitives/navigation_menu.ex`, `assets/js/hooks/navigation_menu_root.js`.
- **Popover.** No `Title` or `Description`. The trigger keeps `aria-controls` while closed. `lib/essence_ui/primitives/popover.ex`, `assets/js/hooks/popover_root.js`.
- **Scroll area.** Viewport always renders the implicit `display: table` wrapper. No `Content` part and no `disable_implicit_content_element`. That wrapper has no `role="presentation"`. `lib/essence_ui/primitives/scroll_area.ex`.
- **Slider.** Thumbs are clamped so they cannot cross (`min_steps_between_thumbs` only widens the gap). Radix still swaps thumbs unless `preserveThumbOrder` is set. There is no `on_value_commit`. Arrow keys add `step` and then round, so an off-grid value can skip the next step. `assets/js/hooks/slider_root.js`.
- **Form reset.** Radio group, slider, and select do not listen for form `reset`. Checkbox and switch do.
- **Select.** While open, Enter and Space always call `preventDefault`, including when focus is on a descendant inside an item. An item value of `""` stays selected; it does not clear back to the placeholder. `assets/js/hooks/select_root.js`.
- **Dismissable layer.** Each open layer registers its own document `pointerdown` listener and dismisses itself when the event is outside that layer, so one outside click closes every open popover or menu. `assets/js/lib/dismissable_layer.js`. Escape handlers do not ignore IME composition.
- **Context menu content.** No `side`, `side_offset`, or `align`. Positioning is the pointer point. `lib/essence_ui/primitives/context_menu.ex`.
- **Dialog.** `Title` and `Description` are not copied onto content as `aria-labelledby` / `aria-describedby`, so the later “missing title” and “custom id” fixes have no reference to repair. `lib/essence_ui/primitives/dialog.ex`, `assets/js/hooks/dialog_root.js`.
- **Toast.** A `duration` change while the timer is paused keeps the old remaining time. `assets/js/hooks/toast_root.js`.
- **Radio group.** A disabled root sets `data-disabled` and does not set `aria-disabled`. `lib/essence_ui/primitives/radio_group.ex`.

Dates are npm publish times converted to Asia/Almaty (UTC+5). Behavior notes come from the umbrella changelog, not from secondary write-ups.

## Sources

- Primary, current: [`packages/react/radix-ui/CHANGELOG.md`](https://github.com/radix-ui/primitives/blob/main/packages/react/radix-ui/CHANGELOG.md) on `main` (covers 1.3.0 through 1.8.1).
- Publish times: npm registry `time` field for package `radix-ui`. Latest dist-tag is `1.8.1` (13 Oct 2026, 02:03 Almaty). `next` is `1.8.2-rc.1791984254107`.
- Unreleased: `.changeset/*.md` on `main` as of 14 Oct 2026. These are draft changelog entries, not a published release.
- The public docs page [Releases](https://www.radix-ui.com/primitives/docs/overview/releases) lags. Its newest section is 20 Jul 2026, which matches changelog **1.6.3**. It does not include 1.6.0’s behavior changes or anything from 1.7.0 onward. Use the GitHub changelog for those.

Versions that only bump dependencies (1.3.1–1.3.4, 1.4.1, 1.4.2) are omitted. 1.6.5 republished the same code with provenance attestations.

## Unreleased on `main` (not in 1.8.1)

From changesets, all marked patch:

- **Dialog.** Taps on `Dialog.Overlay` often failed to close a modal dialog on iOS Safari. `id` on `Dialog.Title`, `Dialog.Description`, and `Dialog.Content` broke aria references.
- **Dismissable layer.** Outside-interaction dispatch for programmatic clicks waits until React finishes the current passive-effect commit. A layer with `disableOutsidePointerEvents` could be unclickable on its first frame (visible in tests). `Escape` and `Tab` are no longer handled while an IME composition is open (also Focus Scope and escape-keydown).
- **Menu.** A closed dropdown menu, context menu, or menubar moved focus when the pointer moved over it during exit animation. Collision-flipped submenus closed before the pointer click landed in React 19.
- **Context menu.** Nested triggers opened on a single touch long-press. Only the innermost trigger starts the timer.
- **Select.** Composing `ScrollArea` inside `Select` warned because both set inline `overflow`. Select now sets `overflow-x` and `overflow-y`.
- **Scroll area.** `ScrollArea.Content` has an explicit `presentation` role so browsers do not infer `table` from its display style.
- **Radio group.** Root group element gets `aria-disabled`.
- **Slider.** Enabled slider elements no longer carry `aria-disabled`.
- **Modal hiding.** Elements that are never rendered are no longer marked, and `<script>` elements no longer keep ancestors visible. The `aria-hidden` dependency was replaced internally; modal behavior is unchanged.
- **Context types.** Re-exporting Radix context hooks no longer points at broken type references.
- **Dev checks.** Moved to `@radix-ui/env-check`. Implementation detail; no consumer change.

## 1.8.1 — 13 Oct 2026

Patch on top of 1.8.0, published the same calendar day in UTC and the next morning in Almaty.

- Callback props that were declared as methods again accept handlers whose parameter is narrower than the prop’s. 1.8.0 had rejected those handlers.

## 1.8.0 — 12 Oct 2026, 05:48 Almaty

- **Context menu.** `side`, `sideOffset`, and `align` on `ContextMenu.Content` can be overridden.
- **Navigation menu.** Content rendered through `NavigationMenu.Viewport` now has `data-state`.
- **Popover.** `Popover.Trigger` no longer keeps `aria-controls` while the popover is closed.
- **Select.** Content alignment is fixed when every item is disabled. A programmatic value change inside a form no longer emits a `click` from the hidden bubble `<select>` that bubbles to ancestor `onClick` handlers.
- **Slider.** A programmatic value change inside a form no longer emits an `input` event that bubbles to ancestor `onInput` handlers.
- **Slot.** `asChild` no longer throws when a lazy component resolves to another lazy component.
- **Toast.** `Toast.Viewport` no longer forces a still-hydrating Suspense boundary to client-render.
- **Tooltip.** Tabbing away from a focusable tooltip trigger nested in a modal popover moves focus to the next element in the popover, not the popover root.
- Optional props accept explicit `undefined` (`exactOptionalPropertyTypes`).
- Form-nested controls no longer treat some user-driven changes as programmatic, which had skipped bubbled event handlers.
- `useCallbackRef` timing fixes. `FocusScope` no longer throws `TypeError` in tests after teardown. A SWC tree-shaking bug is fixed.
- Unstable collection API (internal, undocumented): `unstable_CollectionProps` renamed to `unstable_CollectionSlotProps`, `unstable_CollectionItemMap` renamed to `unstable_CollectionDict`, `useGetCollection` added, provider display names fixed, and item order stays current when React moves items without remounting them.

## 1.7.0 — 6 Oct 2026, 04:09 Almaty

- **Dialog.** A non-modal popover portalled inside a modal dialog is usable again. The modal `FocusScope` had reclaimed focus, and `RemoveScroll` had limited scrolling to the modal content.
- **Navigation menu.**
  - `NavigationMenu.Sub` gains `disableToggle`. `true` (default) keeps an open submenu open when its trigger is clicked. `false` toggles it.
  - `NavigationMenu.Root` and `NavigationMenu.Sub` gain `activationMode`: `"automatic"` (default, hover or focus opens) or `"manual"` (only a click opens). A submenu inherits the root’s mode when its own prop is omitted.
  - A submenu `defaultValue` is no longer reset when an external element is focused before the menu opens.
  - `NavigationMenu.Viewport` no longer replaces its children with the active content. Active content renders inside the consumer’s element, next to children that were already there.
- **Popover.** New `Popover.Title` and `Popover.Description` parts name the popover content.
- **Scroll area.** New `ScrollArea.Content`. Pass `disableImplicitContentElement` on the viewport and render `ScrollArea.Content` as its child. The next major release drops the implicit wrapper. `asChild` on `ScrollArea.Viewport` now merges onto the consumer’s element, not the implicit content element.
- **Slider.** `preserveThumbOrder` stops thumbs crossing. Each thumb stays between its neighbors instead of swapping when dragged past them.
- Multiple `aria-describedby` values are merged and deduped instead of one replacing the other.
- Internal handlers no longer run on disabled `Select.Item`s.
- A paused toast auto-closes after `duration` changes while the timer is paused.
- Focus inside `Tabs.Content` blurs before the tab switches. `Tabs.Trigger` moves focus before the state change.
- React Server Component compatibility fixes. 1.6.6 and 1.6.7 (24–25 Jul 2026) had reverted earlier RSC breakages; 1.6.4 (20 Jul 2026) had fixed root `radix-ui` imports collapsing every primitive’s types to `any`.

## 1.6.3 — 20 Jul 2026

Matches the newest section on the docs Releases page.

- **Dialog.** ARIA references stay valid when title or description is not rendered.
- **Slider.** `onValueCommit` fires when a thumb is dragged across another thumb.
- **Toast.** Escape no longer removes toasts that are not focused.
- **Tooltip.** `Tooltip.Content` children are no longer mounted twice.
- Popper content no longer has its inline animation style overridden.
- Parts are marked `/* @__PURE__ */` and use named render functions so bundlers can drop unused components. `displayName` assignments had blocked that.
- `virtualRef` accepts `RefObject` on popover components.
- Dev-only warnings are dropped from production builds.
- Subpath imports: `import { Accordion } from "radix-ui/accordion"` (or `import * as Accordion`).
- Programmatic updates of checkbox, switch, or radio group inside a form no longer emit a `click` from the hidden bubble input.

## 1.6.2 — 7 Jul 2026

- Navigation menu item indicators expose CSS custom properties for their translate values.
- Dismissable layer: an outside click on a background nested popover no longer closes every layer.
- `Form.Message`, `Form.Control`, `Form.Label`, and `Form.ValidityState` no longer throw when rendered outside `Form.Field`.
- Radio group, slider, select, and switch pick up the new value when their form is reset.
- Menu items, tab triggers, toolbar links, and select items no longer take `Space` / `Enter` that originated on a focusable descendant.
- Calling an event handler with no argument no longer throws and no longer blocks later handlers.
- An already-open context menu re-anchors to the latest pointer position when triggered again.
- `onEscapeKeyDown` / `onDismiss` stay current on React 19.2. A dismissable-layer regression from React’s `useEffectEvent` is fixed.
- Roving-focus items auto-focus on mount inside a focus scope.
- `--radix-scroll-area-corner-width` and `--radix-scroll-area-corner-height` reset to `0` when the corner goes away.
- Slider keyboard steps snap to the next step-aligned value when the current value is off the step grid, matching `<input type="range">`.

## 1.6.1 — 30 Jun 2026

- Toast close timers are cleared on unmount.
- Unstable composed ref callbacks no longer loop forever under React 19.
- Emitted declarations no longer augment the global `React.CSSProperties`.

## 1.6.0 — 16 Jun 2026

Not listed as its own section on the docs Releases page.

- **Avatar.** Fallback returns if the image unmounts. Multiple `Avatar.Image` children warn in development. A zero-sized image reports `error` on load instead of staying `loading`.
- **Password toggle field.** Misspelled `onVisiblityChange` is renamed to `onVisibilityChange`. Part prop types include `asChild`.
- **Scroll area.** The viewport style tag is stable unless the nonce changes.
- **Slot.** `SlotProps` and `createSlot` take generics for the element and its props.
- **Toggle group.** Single-select uses `radiogroup`. Multi-select uses `toolbar`.
- **Select.** An item whose value is `""` clears the selection back to the placeholder instead of throwing. Typeahead no longer focuses an element that has gone away.
- Submenus stay aligned when a custom portal is used. Dialogs no longer warn in development when title or description is omitted. Menus close when the window loses focus. Outside interactions stopped by extension UI do not dismiss dialogs or popovers. Duplicate index-signature errors when consuming several packages together are fixed.

## 1.5.0 — 6 Jun 2026

This is the “June 6, 2026” section on the docs Releases page.

- **Context menu.** Controlled `open` / `onOpenChange` on `ContextMenu.Root`, for reading state and closing. Opening programmatically is discouraged because position comes from the pointer. Submenus no longer stay expanded after a long-press reopen.
- **Unstable composition parts** (still rendered by default):
  - Radio group: `unstable_ItemProvider`, `unstable_ItemTrigger`, `unstable_ItemBubbleInput`
  - Select: `unstable_Provider`, `unstable_BubbleInput`
  - Slider: `unstable_ThumbProvider`, `unstable_ThumbTrigger`, `unstable_BubbleInput`
  - Switch: `unstable_Provider`, `unstable_Trigger`, `unstable_BubbleInput`
- **Select.** Presence-based exit animations. Hidden input submits `""` when nothing is selected. No longer closes after a touch-scroll inside an open shadow root. `Select.Value` with both `asChild` and a placeholder no longer logs invalid-prop errors.
- **Slider.** `focusVisible` for non-keyboard thumb focus. Very small `step` values no longer freeze thumbs. Focus inside a scrollable container is fixed.
- **Slot.** Nested `Slottable` via a render prop. React 19 ref-callback loop fixed. Clearer errors for invalid slot children.
- **Dialog.** iOS text selection and editing inside inputs works. Closed dialogs no longer leave pointer events disabled.
- **One-time password field.** Paste reads `text/plain` when the legacy `"Text"` clipboard type is missing. Focus management on React 19.2+. Paste longer than the field is truncated.
- **Tooltip.** Non-`Node` event targets no longer throw. `skipDelayDuration={0}` no longer still skips the open delay between triggers.
- `Menu.SubContent` (dropdown, context menu, menubar) gains `align`. `Toast.Provider` can take a container for announcements. Popper anchor exposes `data-side` and `data-align`. Scroll area scrollbars have `data-state`. Popper and Presence no longer hit “Maximum update depth exceeded” (the Presence case was React 19 plus an unstable child ref). `useSyncExternalStore` comes from React 18+ instead of the CJS shim that crashed ESM browser bundles. Triggers no longer point `aria-controls` at elements that have left the DOM. Focus guards are cached so opening an overlay does not reflow on every mount. Missing `use client` directives added.

## 1.4.3 — 14 Aug 2025

- One-time password field: disabling the root disables every input. iOS Chrome autocomplete fixed.
- Popper infinite render loop fixed. `animationend` handles keyframe names with escapable characters. Slot consumes the promise from a React 19 lazy component. Toast drops `aria-hidden` on focusable empty elements, `role="status"` on the list item, and a redundant default `aria-atomic`. Context objects have `displayName`.

## 1.4.0 — 5 May 2025

- New preview primitive **Password Toggle Field** (`unstable_PasswordToggleField`): input plus a visibility toggle, pointer focus return, keyboard focus retention, visibility reset after submit, and an accessible name for an icon-only toggle. Parts: `Root`, `Input`, `Toggle`, `Icon` (`visible` / `hidden`), `Slot` (`visible` / `hidden`).
- Checkbox gains unstable `Provider`, `Trigger`, and `BubbleInput`.

## 1.3.0 — Apr 2025

The umbrella changelog starts here. The docs page dates the introduction 17 Apr 2025.

- New preview primitive **One-Time Password Field** (`unstable_OneTimePasswordField`): per-character inputs, single-field keyboard behavior, paste override, password-manager autofill, numeric or alphanumeric validation, auto-submit, focus management, and `HiddenInput` for one form value.
