/**
 * Pointer helpers aligned with Radix UI primitives.
 * Hover intent is mouse-only; touch uses click / focus / long-press.
 */

/**
 * @param {PointerEvent} event
 * @returns {boolean}
 */
export function isMousePointer(event) {
  return event.pointerType === "mouse";
}

/**
 * Radix `whenMouse` — invoke handler only for mouse pointers.
 * @template {Event} E
 * @param {(event: E) => void} handler
 * @returns {(event: E) => void}
 */
export function whenMouse(handler) {
  return (event) => {
    if (event.pointerType !== "mouse") return;
    return handler(event);
  };
}

/**
 * True when the environment has fine pointer + hover (desktop mouse).
 * Used to fall back hover-only affordances (e.g. ScrollArea type=hover).
 * @returns {boolean}
 */
export function hasFinePointerHover() {
  if (typeof window === "undefined" || typeof window.matchMedia !== "function") {
    return true;
  }
  return window.matchMedia("(hover: hover) and (pointer: fine)").matches;
}
