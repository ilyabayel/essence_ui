/**
 * Positions a floating element relative to a trigger using fixed positioning.
 * Extracted from popover.js collision/alignment patterns.
 *
 * @param {object} options
 * @param {Element} options.trigger
 * @param {Element} options.content
 * @param {"top"|"right"|"bottom"|"left"} [options.side="bottom"]
 * @param {"start"|"center"|"end"} [options.align="start"]
 * @param {number} [options.sideOffset=8]
 * @param {number} [options.collisionPadding=10]
 * @returns {{ top: number, left: number }}
 */
export function positionFloating({
  trigger,
  content,
  side = "bottom",
  align = "start",
  sideOffset = 8,
  collisionPadding = 10,
} = {}) {
  if (!trigger || !content) {
    return { top: 0, left: 0 };
  }

  const triggerEl = trigger.firstElementChild || trigger;
  const triggerRect = triggerEl.getBoundingClientRect();
  const contentWidth = content.offsetWidth;
  const contentHeight = content.offsetHeight;

  let top;
  let left;

  if (side === "top" || side === "bottom") {
    top =
      side === "top"
        ? triggerRect.top - contentHeight - sideOffset
        : triggerRect.bottom + sideOffset;

    if (align === "start") {
      left = triggerRect.left;
    } else if (align === "end") {
      left = triggerRect.right - contentWidth;
    } else {
      left = triggerRect.left + triggerRect.width / 2 - contentWidth / 2;
    }
  } else {
    left =
      side === "left"
        ? triggerRect.left - contentWidth - sideOffset
        : triggerRect.right + sideOffset;

    if (align === "start") {
      top = triggerRect.top;
    } else if (align === "end") {
      top = triggerRect.bottom - contentHeight;
    } else {
      top = triggerRect.top + triggerRect.height / 2 - contentHeight / 2;
    }
  }

  const viewportWidth = window.innerWidth;
  const viewportHeight = window.innerHeight;

  if (left < collisionPadding) left = collisionPadding;
  if (left + contentWidth > viewportWidth - collisionPadding) {
    left = viewportWidth - contentWidth - collisionPadding;
  }
  if (top < collisionPadding) top = collisionPadding;
  if (top + contentHeight > viewportHeight - collisionPadding) {
    top = viewportHeight - contentHeight - collisionPadding;
  }

  content.style.position = "fixed";
  content.style.top = `${top}px`;
  content.style.left = `${left}px`;

  return { top, left };
}
