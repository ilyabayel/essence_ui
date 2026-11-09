/**
 * Modal layer stack matching Radix Dialog / DismissableLayer:
 * - `hideOthers` so the rest of the document is `aria-hidden`
 * - `pointer-events: none` on `body`, restored on the top layer only
 * - Escape dismisses only the top layer
 * - Focus cannot leave the top layer
 */
import { hideOthers } from "./aria_hidden.js";
import { bindModalFocus } from "./focus_scope.js";

const NESTED_DISMISS_SELECTOR = [
  "[data-radix-menu-content]",
  "[data-radix-dropdown-menu-content]",
  "[data-radix-context-menu-content]",
  "[data-radix-menubar-content]",
  "[data-radix-select-content]",
  "[data-radix-popover-content]",
].join(",");

/** @type {Array<{ content: Element, interactives: Element[], onEscape?: Function, undoHide: Function, focus: ReturnType<typeof bindModalFocus>, priorPointer: Map<Element, string> }>} */
const layers = [];

let pointerLocks = 0;
let bodyPointerEventsBefore = "";

/**
 * @param {{ content: Element, interactives?: Element[], onEscape?: (event: KeyboardEvent) => void }} options
 * @returns {{ release: () => void, sync: () => void }}
 */
export function activateModalLayer({ content, interactives = [], onEscape }) {
  const nodes = [content, ...interactives].filter(
    (node, index, all) => node && all.indexOf(node) === index,
  );

  const layer = {
    content,
    interactives: nodes,
    onEscape,
    undoHide: () => {},
    focus: bindModalFocus(content),
    priorPointer: new Map(),
  };

  layers.push(layer);
  lockBodyPointerEvents();
  applyHide(layer);
  syncStack();

  function onKeyDown(event) {
    if (event.key !== "Escape") return;
    if (event.isComposing || event.keyCode === 229) return;
    if (layers[layers.length - 1] !== layer) return;
    if (isNestedDismissTarget(event.target, content)) return;
    event.preventDefault();
    layer.onEscape?.(event);
  }

  document.addEventListener("keydown", onKeyDown);

  return {
    sync() {
      if (!layer.content?.isConnected) return;
      applyHide(layer);
      syncStack();
    },
    release() {
      document.removeEventListener("keydown", onKeyDown);
      const index = layers.indexOf(layer);
      if (index !== -1) layers.splice(index, 1);
      layer.focus.unbind();
      layer.undoHide();
      layer.undoHide = () => {};
      restorePointer(layer);
      unlockBodyPointerEvents();
      syncStack();
    },
  };
}

function applyHide(layer) {
  layer.undoHide();
  const parent = layer.content?.ownerDocument?.body;
  layer.undoHide = parent
    ? hideOthers(new Set([layer.content]), parent)
    : () => {};
}

function syncStack() {
  const top = layers[layers.length - 1];
  for (const layer of layers) {
    const enabled = layer === top;
    if (enabled) layer.focus.resume();
    else layer.focus.pause();

    for (const node of layer.interactives) {
      if (!node.isConnected) continue;
      if (!layer.priorPointer.has(node)) {
        layer.priorPointer.set(node, node.style.pointerEvents);
      }
      node.style.pointerEvents = enabled ? "auto" : "none";
    }
  }
}

function restorePointer(layer) {
  for (const [node, value] of layer.priorPointer) {
    if (node.isConnected) node.style.pointerEvents = value;
  }
  layer.priorPointer.clear();
}

function lockBodyPointerEvents() {
  if (pointerLocks === 0) {
    bodyPointerEventsBefore = document.body.style.pointerEvents;
    document.body.style.pointerEvents = "none";
  }
  pointerLocks += 1;
}

function unlockBodyPointerEvents() {
  if (pointerLocks === 0) return;
  pointerLocks -= 1;
  if (pointerLocks === 0) {
    document.body.style.pointerEvents = bodyPointerEventsBefore;
  }
}

function isNestedDismissTarget(target, content) {
  if (!(target instanceof Element) || !content) return false;
  const nested = target.closest(NESTED_DISMISS_SELECTOR);
  return !!(nested && nested !== content && content.contains(nested));
}
