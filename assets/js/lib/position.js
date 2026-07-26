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

  const triggerRect = trigger.getBoundingClientRect();
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

/**
 * Positions a floating arrow on the edge of content facing the trigger.
 * Matches Radix Popper arrow placement (SVG points down by default).
 *
 * @param {object} options
 * @param {Element} options.content
 * @param {string} [options.arrowSelector]
 * @param {"top"|"right"|"bottom"|"left"} [options.side="bottom"]
 * @param {"start"|"center"|"end"} [options.align="center"]
 */
export function positionArrow({
  content,
  arrowSelector,
  side = "bottom",
  align = "center",
} = {}) {
  if (!content || !arrowSelector) return;

  const arrow = content.querySelector(arrowSelector);
  if (!arrow) return;

  const width = arrow.offsetWidth || 10;
  const height = arrow.offsetHeight || 5;

  arrow.style.position = "absolute";
  arrow.style.display = "block";
  arrow.style.top = "";
  arrow.style.right = "";
  arrow.style.bottom = "";
  arrow.style.left = "";
  arrow.style.transform = "";
  arrow.style.transformOrigin = "";

  // Radix PopperArrow: [oppositeSide]=0 + side-specific origin/transform.
  // SVG points down by default (polygon tip at bottom).
  if (side === "bottom") {
    arrow.style.top = "0px";
    arrow.style.transformOrigin = "center 0";
    arrow.style.transform = "rotate(180deg)";
  } else if (side === "top") {
    arrow.style.bottom = "0px";
    arrow.style.transformOrigin = "center 0";
    arrow.style.transform = "translateY(100%)";
  } else if (side === "left") {
    arrow.style.right = "0px";
    arrow.style.transformOrigin = "100% 0";
    arrow.style.transform = "translateY(50%) rotate(-90deg) translateX(50%)";
  } else if (side === "right") {
    arrow.style.left = "0px";
    arrow.style.transformOrigin = "0 0";
    arrow.style.transform = "translateY(50%) rotate(90deg) translateX(-50%)";
  }

  if (side === "top" || side === "bottom") {
    if (align === "center") arrow.style.left = `calc(50% - ${width / 2}px)`;
    else if (align === "start") arrow.style.left = "16px";
    else arrow.style.right = "16px";
  } else if (align === "center") {
    // Floating-UI centers via arrowY; approximate with mid-line.
    // translateY(50%) is relative to origin at the top edge (Radix).
    arrow.style.top = "50%";
  } else if (align === "start") {
    arrow.style.top = "8px";
  } else {
    arrow.style.bottom = "8px";
  }
}
