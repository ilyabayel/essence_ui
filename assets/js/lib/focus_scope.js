const FOCUSABLE_SELECTOR =
  'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])';

/**
 * Returns focusable elements within a container.
 */
export function getFocusableElements(container) {
  if (!container) return [];
  return Array.from(container.querySelectorAll(FOCUSABLE_SELECTOR));
}

/**
 * Traps Tab focus within a container. Call from a keydown handler.
 */
export function trapFocus(e, container) {
  if (e.key !== "Tab") return;

  const focusables = getFocusableElements(container);
  if (focusables.length === 0) return;

  const first = focusables[0];
  const last = focusables[focusables.length - 1];

  if (e.shiftKey) {
    if (document.activeElement === first) {
      last.focus();
      e.preventDefault();
    }
  } else if (document.activeElement === last) {
    first.focus();
    e.preventDefault();
  }
}

/**
 * Focuses the first focusable element in a container, or the container itself.
 */
export function focusFirst(container) {
  if (!container) return;

  const first = getFocusableElements(container)[0];
  if (first) {
    first.focus();
  } else {
    container.tabIndex = -1;
    container.focus();
  }
}
