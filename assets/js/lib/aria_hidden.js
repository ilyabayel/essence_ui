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

const markerMap = new Map();
const attributeStores = new Map();

function storeFor(attribute) {
  let store = attributeStores.get(attribute);
  if (!store) {
    store = {
      counterMap: new WeakMap(),
      uncontrolledNodes: new WeakMap(),
      lockCount: 0,
    };
    attributeStores.set(attribute, store);
  }
  return store;
}

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
 * @param {string} markerName
 * @param {string} controlAttribute
 * @param {boolean} booleanAttribute `inert` is present-or-not; `aria-hidden="false"` is not hidden.
 * @returns {() => void}
 */
function applyAttributeToOthers(
  originalTargets,
  parentNode,
  markerName,
  controlAttribute,
  booleanAttribute,
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
  const store = storeFor(controlAttribute);

  targets.forEach(keep);
  deep(parentNode);
  elementsToKeep.clear();
  store.lockCount += 1;

  return () => {
    for (const node of hiddenNodes) {
      const counterValue = (store.counterMap.get(node) || 1) - 1;
      const markerValue = (markerCounter.get(node) || 1) - 1;
      store.counterMap.set(node, counterValue);
      markerCounter.set(node, markerValue);

      if (!counterValue) {
        if (!store.uncontrolledNodes.has(node)) {
          node.removeAttribute(controlAttribute);
        }
        store.uncontrolledNodes.delete(node);
      }

      if (!markerValue) node.removeAttribute(markerName);
    }

    store.lockCount -= 1;
    if (store.lockCount === 0) {
      store.counterMap = new WeakMap();
      store.uncontrolledNodes = new WeakMap();
      markerMap.delete(markerName);
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
        const alreadyHidden = booleanAttribute
          ? attr !== null
          : attr !== null && attr !== "false";
        const counterValue = (store.counterMap.get(node) || 0) + 1;
        const markerValue = (markerCounter.get(node) || 0) + 1;

        store.counterMap.set(node, counterValue);
        markerCounter.set(node, markerValue);
        hiddenNodes.add(node);

        if (counterValue === 1 && alreadyHidden) {
          store.uncontrolledNodes.set(node, true);
        }
        if (markerValue === 1) node.setAttribute(markerName, "true");
        if (!alreadyHidden) node.setAttribute(controlAttribute, "true");
      }
    }
  }
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
  return applyAttributeToOthers(
    originalTargets,
    parentNode,
    markerName,
    "aria-hidden",
    false,
  );
}

/**
 * Marks everything except `originalTargets` as `inert`, so hidden controls
 * leave the tab order. Keep clickable layers (overlay, backdrop) in the set.
 * @param {Set<Element>} originalTargets
 * @param {Element} parentNode
 * @param {string} [markerName]
 * @returns {() => void}
 */
export function inertOthers(
  originalTargets,
  parentNode,
  markerName = "data-inert-ed",
) {
  return applyAttributeToOthers(
    originalTargets,
    parentNode,
    markerName,
    "inert",
    true,
  );
}
