const CANDIDATE_SELECTOR =
  'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])';

/**
 * Tabbable elements inside `container`, in DOM order.
 * Skips disabled, hidden, and `display: none` / `visibility: hidden` nodes.
 */
export function getFocusableElements(container) {
  if (!container) return [];

  if (typeof document.createTreeWalker !== "function") {
    return Array.from(container.querySelectorAll(CANDIDATE_SELECTOR)).filter(
      (node) => !node.disabled && !node.hidden && node.tabIndex >= 0,
    );
  }

  const nodes = [];
  const walker = container.ownerDocument.createTreeWalker(
    container,
    NodeFilter.SHOW_ELEMENT,
    {
      acceptNode(node) {
        const isHiddenInput = node.tagName === "INPUT" && node.type === "hidden";
        if (node.disabled || node.hidden || isHiddenInput) {
          return NodeFilter.FILTER_SKIP;
        }
        return node.tabIndex >= 0
          ? NodeFilter.FILTER_ACCEPT
          : NodeFilter.FILTER_SKIP;
      },
    },
  );

  while (walker.nextNode()) nodes.push(walker.currentNode);
  return nodes.filter((node) => !isHidden(node, container));
}

/**
 * Traps Tab inside `container`. Pulls focus back in when it has already left.
 */
export function trapFocus(event, container) {
  if (!container || event.key !== "Tab") return;
  if (event.altKey || event.ctrlKey || event.metaKey) return;
  if (event.isComposing || event.keyCode === 229) return;

  const focusables = getFocusableElements(container);
  const first = focusables[0];
  const last = focusables[focusables.length - 1];
  const active = document.activeElement;

  if (!first || !last) {
    event.preventDefault();
    focusElement(container);
    return;
  }

  if (!container.contains(active)) {
    event.preventDefault();
    focusElement(event.shiftKey ? last : first);
    return;
  }

  if (event.shiftKey && active === first) {
    event.preventDefault();
    focusElement(last);
  } else if (!event.shiftKey && active === last) {
    event.preventDefault();
    focusElement(first);
  }
}

/**
 * Focuses the first tabbable element, or the container itself.
 * @param {Element} container
 * @param {{ select?: boolean, skipLinks?: boolean }} [options]
 */
export function focusFirst(container, { select = false, skipLinks = false } = {}) {
  if (!container) return;

  const previouslyFocused = document.activeElement;
  let candidates = getFocusableElements(container);
  if (skipLinks) candidates = candidates.filter((el) => el.tagName !== "A");

  for (const candidate of candidates) {
    focusElement(candidate, { select });
    if (document.activeElement !== previouslyFocused) return;
  }

  focusElement(container);
}

/**
 * Keeps Tab and programmatic focus inside `container` until `unbind`.
 * `pause` lets a nested modal take over without releasing this scope.
 */
export function bindModalFocus(container) {
  let paused = false;
  let reclaiming = false;
  let lastInside = null;

  function inside(node) {
    return !!(node && container.contains(node));
  }

  function reclaim() {
    if (reclaiming) return;
    reclaiming = true;
    const fallback = lastInside && lastInside.isConnected ? lastInside : null;
    if (fallback) focusElement(fallback, { select: true });
    else focusFirst(container, { select: true, skipLinks: true });
    reclaiming = false;
  }

  function onFocusIn(event) {
    if (paused || !container.isConnected) return;
    if (inside(event.target)) {
      lastInside = event.target;
      return;
    }
    reclaim();
  }

  function onFocusOut(event) {
    if (paused || !container.isConnected) return;
    const related = event.relatedTarget;
    if (related === null) return;
    if (!inside(related)) reclaim();
  }

  function onKeyDown(event) {
    if (paused) return;
    trapFocus(event, container);
  }

  document.addEventListener("focusin", onFocusIn);
  document.addEventListener("focusout", onFocusOut);
  document.addEventListener("keydown", onKeyDown);

  return {
    pause() {
      paused = true;
    },
    resume() {
      paused = false;
    },
    unbind() {
      document.removeEventListener("focusin", onFocusIn);
      document.removeEventListener("focusout", onFocusOut);
      document.removeEventListener("keydown", onKeyDown);
    },
  };
}

function focusElement(element, { select = false } = {}) {
  if (!element || typeof element.focus !== "function") return;
  if (!element.hasAttribute("tabindex") && element.tabIndex < 0) {
    element.tabIndex = -1;
  }
  const previouslyFocused = document.activeElement;
  element.focus({ preventScroll: true });
  if (
    select &&
    element !== previouslyFocused &&
    element.tagName === "INPUT" &&
    typeof element.select === "function"
  ) {
    element.select();
  }
}

function isHidden(node, container) {
  if (typeof node.checkVisibility === "function") {
    return !node.checkVisibility({ checkVisibilityCSS: true });
  }

  if (getComputedStyle(node).visibility === "hidden") return true;
  let current = node;
  while (current && current !== container) {
    if (getComputedStyle(current).display === "none") return true;
    current = current.parentElement;
  }
  return false;
}
