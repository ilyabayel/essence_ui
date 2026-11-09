/**
 * Hide every element under `parent` except `targets` and their ancestors.
 *
 * Port of Radix `@radix-ui/primitive` `hideOthers` (fork of aria-hidden).
 * Reference counts so nested modals restore the previous tree, and nodes that
 * were already `aria-hidden` stay hidden after the last modal closes.
 * `aria-live` regions are left exposed so announcements still fire.
 */

const SKIPPED_ELEMENTS = new Set([
  "link",
  "meta",
  "noscript",
  "script",
  "style",
  "template",
]);

let counterMap = new WeakMap();
let uncontrolledNodes = new WeakMap();
let lockCount = 0;
const markerMap = new Map();

function unwrapHost(node) {
  if (!node) return null;
  return node.host || unwrapHost(node.parentNode);
}

function correctTargets(parent, targets) {
  const corrected = new Set();
  for (const target of targets) {
    if (!target) continue;
    if (parent.contains(target)) {
      corrected.add(target);
    } else {
      const host = unwrapHost(target);
      if (host && parent.contains(host)) corrected.add(host);
    }
  }
  return corrected;
}

/**
 * @param {Set<Element>} originalTargets
 * @param {Element} parentNode
 * @param {string} [markerName]
 * @returns {() => void}
 */
export function hideOthers(
  originalTargets,
  parentNode,
  markerName = "data-aria-hidden",
) {
  if (!parentNode) return () => {};

  const targets = correctTargets(parentNode, originalTargets);
  parentNode.querySelectorAll("[aria-live]").forEach((node) => {
    targets.add(node);
  });

  let markerCounter = markerMap.get(markerName);
  if (!markerCounter) {
    markerCounter = new WeakMap();
    markerMap.set(markerName, markerCounter);
  }

  const hiddenNodes = new Set();
  const elementsToKeep = new Set();
  const elementsToStop = new Set(targets);
  const controlAttribute = "aria-hidden";

  targets.forEach(keep);
  deep(parentNode);
  elementsToKeep.clear();
  lockCount += 1;

  return () => {
    for (const node of hiddenNodes) {
      const counterValue = (counterMap.get(node) || 1) - 1;
      const markerValue = (markerCounter.get(node) || 1) - 1;
      counterMap.set(node, counterValue);
      markerCounter.set(node, markerValue);

      if (!counterValue) {
        if (!uncontrolledNodes.has(node)) node.removeAttribute(controlAttribute);
        uncontrolledNodes.delete(node);
      }

      if (!markerValue) node.removeAttribute(markerName);
    }

    lockCount -= 1;
    if (!lockCount) {
      counterMap = new WeakMap();
      uncontrolledNodes = new WeakMap();
      markerMap.clear();
    }
  };

  function keep(el) {
    if (!el || elementsToKeep.has(el)) return;
    elementsToKeep.add(el);
    keep(el.parentNode);
  }

  function deep(parent) {
    if (!parent || elementsToStop.has(parent) || !parent.children) return;

    for (const node of parent.children) {
      if (SKIPPED_ELEMENTS.has(node.localName)) continue;

      if (elementsToKeep.has(node)) {
        deep(node);
      } else {
        const attr = node.getAttribute(controlAttribute);
        const alreadyHidden = attr !== null && attr !== "false";
        const counterValue = (counterMap.get(node) || 0) + 1;
        const markerValue = (markerCounter.get(node) || 0) + 1;

        counterMap.set(node, counterValue);
        markerCounter.set(node, markerValue);
        hiddenNodes.add(node);

        if (counterValue === 1 && alreadyHidden) uncontrolledNodes.set(node, true);
        if (markerValue === 1) node.setAttribute(markerName, "true");
        if (!alreadyHidden) node.setAttribute(controlAttribute, "true");
      }
    }
  }
}
