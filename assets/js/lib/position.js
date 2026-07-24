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
/**
 * Fixed positioning is relative to the viewport unless an ancestor creates a
 * containing block (transform, perspective, filter, or will-change: transform).
 * getBoundingClientRect is always viewport-relative, so subtract that offset.
 * @param {Element} el
 * @returns {{ top: number, left: number }}
 */
function getFixedContainingBlockOffset(el) {
  let parent = el.parentElement;
  while (parent && parent !== document.documentElement) {
    const style = getComputedStyle(parent);
    const willChange = style.willChange || "";
    if (
      style.transform !== "none" ||
      style.perspective !== "none" ||
      style.filter !== "none" ||
      style.contain === "paint" ||
      willChange.includes("transform") ||
      willChange.includes("perspective") ||
      willChange.includes("filter")
    ) {
      const rect = parent.getBoundingClientRect();
      return { top: rect.top, left: rect.left };
    }
    parent = parent.parentElement;
  }
  return { top: 0, left: 0 };
}

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

  // Convert viewport coords → containing-block coords when needed.
  const cb = getFixedContainingBlockOffset(content);
  top -= cb.top;
  left -= cb.left;

  content.style.position = "fixed";
  content.style.top = `${top}px`;
  content.style.left = `${left}px`;

  return { top, left, containingBlockOffset: cb };
}
