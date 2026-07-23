/**
 * Shared helpers for menu-like primitives (DropdownMenu, ContextMenu, Menubar).
 */

const ITEM_SELECTOR =
  '[role="menuitem"], [role="menuitemcheckbox"], [role="menuitemradio"]';

/**
 * Returns enabled menu items within a content container.
 * @param {Element} content
 * @returns {Element[]}
 */
export function getMenuItems(content) {
  if (!content) return [];
  return Array.from(content.querySelectorAll(ITEM_SELECTOR)).filter(
    (item) =>
      !item.hasAttribute("data-disabled") &&
      !item.disabled &&
      item.getAttribute("aria-disabled") !== "true"
  );
}

/**
 * Focuses a menu item and marks it highlighted.
 * @param {Element|null} item
 * @param {Element[]} [items]
 */
export function focusItem(item, items = []) {
  if (!item) return;
  items.forEach((el) => el.removeAttribute("data-highlighted"));
  item.setAttribute("data-highlighted", "");
  item.focus({ preventScroll: true });
}

/**
 * Handles ArrowUp/ArrowDown/Home/End navigation among menu items.
 * @param {KeyboardEvent} e
 * @param {Element[]} items
 * @returns {boolean} true if the key was handled
 */
export function handleArrowKeys(e, items) {
  if (!items.length) return false;

  const currentIndex = items.indexOf(document.activeElement);

  if (e.key === "ArrowDown") {
    e.preventDefault();
    const next = currentIndex < 0 ? 0 : (currentIndex + 1) % items.length;
    focusItem(items[next], items);
    return true;
  }

  if (e.key === "ArrowUp") {
    e.preventDefault();
    const prev =
      currentIndex < 0
        ? items.length - 1
        : (currentIndex - 1 + items.length) % items.length;
    focusItem(items[prev], items);
    return true;
  }

  if (e.key === "Home") {
    e.preventDefault();
    focusItem(items[0], items);
    return true;
  }

  if (e.key === "End") {
    e.preventDefault();
    focusItem(items[items.length - 1], items);
    return true;
  }

  return false;
}

/**
 * Typeahead search state for menu items.
 * @returns {{ query: string, timeout: number|null, handle: (key: string, items: Element[]) => void, reset: () => void }}
 */
export function createTypeahead() {
  let query = "";
  let timeout = null;

  return {
    get query() {
      return query;
    },
    handle(key, items) {
      if (!key || key.length !== 1) return;
      clearTimeout(timeout);
      query += key.toLowerCase();
      timeout = setTimeout(() => {
        query = "";
      }, 500);

      const match = items.find((item) => {
        const text = (
          item.getAttribute("data-text-value") ||
          item.textContent ||
          ""
        )
          .toLowerCase()
          .trim();
        return text.startsWith(query);
      });

      if (match) focusItem(match, items);
    },
    reset() {
      clearTimeout(timeout);
      query = "";
    },
  };
}

/** @deprecated Prefer createTypeahead().handle */
export function typeahead(key, items, state = { query: "", timeout: null }) {
  if (!key || key.length !== 1) return state;
  clearTimeout(state.timeout);
  state.query += key.toLowerCase();
  state.timeout = setTimeout(() => {
    state.query = "";
  }, 500);

  const match = items.find((item) => {
    const text = (
      item.getAttribute("data-text-value") ||
      item.textContent ||
      ""
    )
      .toLowerCase()
      .trim();
    return text.startsWith(state.query);
  });

  if (match) focusItem(match, items);
  return state;
}

/**
 * Whether clicking an item should close the menu.
 * Matches Radix: all items close on select except sub-triggers.
 * Checkbox/radio stay open only when the consumer prevents the select
 * (e.g. `onSelect` + `preventDefault`); by default they close.
 * @param {Element} item
 * @returns {boolean}
 */
export function shouldCloseOnItemClick(item) {
  if (!item) return false;
  if (
    item.hasAttribute("data-essence-dropdown-menu-sub-trigger") ||
    item.hasAttribute("data-essence-context-menu-sub-trigger") ||
    item.hasAttribute("data-essence-menubar-sub-trigger")
  ) {
    return false;
  }
  return true;
}

/**
 * Highlight menu items on mouse pointer move (Radix MenuItemImpl).
 * Focuses the item under the cursor so `[data-highlighted]` styles apply.
 * @param {Element} content
 */
export function bindMenuPointerHighlight(content) {
  if (!content || content.hasAttribute("data-menu-pointer-bound")) return;
  content.setAttribute("data-menu-pointer-bound", "true");

  content.addEventListener("pointermove", (event) => {
    if (event.pointerType !== "mouse") return;

    const item = event.target.closest(ITEM_SELECTOR);
    if (!item || !content.contains(item)) return;
    if (
      item.hasAttribute("data-disabled") ||
      item.disabled ||
      item.getAttribute("aria-disabled") === "true"
    ) {
      return;
    }
    if (document.activeElement === item) return;

    focusItem(item, getMenuItems(content));
  });
}

/**
 * Wires click-to-close on menu items. Calls onClose after a short delay
 * so LiveView events can process first.
 * @param {Element} content
 * @param {() => void} onClose
 * @param {(item: Element) => boolean} [shouldClose]
 */
export function closeOnItemClick(
  content,
  onClose,
  shouldClose = shouldCloseOnItemClick
) {
  if (!content || !onClose) return;

  content.querySelectorAll(ITEM_SELECTOR).forEach((item) => {
    if (item.hasAttribute("data-menu-close-bound")) return;
    item.setAttribute("data-menu-close-bound", "true");
    item.addEventListener("click", (e) => {
      const target = e.currentTarget;
      if (target.hasAttribute("data-disabled") || target.disabled) return;
      if (shouldClose(target)) {
        setTimeout(() => onClose(), 50);
      }
    });
  });
}

/**
 * Find a part that may live inside a Phoenix portal.
 * @param {Element} root
 * @param {string} selector
 * @param {string|null} [contentId]
 * @returns {Element|null}
 */
export function findMenuPart(root, selector, contentId) {
  const local = root.querySelector(selector);
  if (local) return local;

  if (contentId) {
    const byId = document.getElementById(contentId);
    if (byId) return byId;
  }

  const portals = root.querySelectorAll("template[data-phx-portal]");
  for (const portal of portals) {
    const teleported = document.querySelector(
      `[data-phx-teleported-src="${portal.id}"]`
    );
    const part = teleported?.querySelector(selector);
    if (part) return part;
  }

  return null;
}

/**
 * Toggle checkbox item checked state and indicator visibility.
 * @param {Element} item
 */
export function toggleCheckboxItem(item) {
  const checked = item.getAttribute("aria-checked") === "true";
  const next = !checked;
  item.setAttribute("aria-checked", String(next));
  item.dataset.state = next ? "checked" : "unchecked";
  syncItemIndicator(item, next);
}

/**
 * Select a radio item within its group.
 * @param {Element} item
 */
export function selectRadioItem(item) {
  const group =
    item.closest('[role="group"]') ||
    item.closest("[data-essence-dropdown-menu-radio-group]") ||
    item.closest("[data-essence-context-menu-radio-group]") ||
    item.closest("[data-essence-menubar-radio-group]") ||
    item.parentElement;

  if (group) {
    group.querySelectorAll('[role="menuitemradio"]').forEach((radio) => {
      radio.setAttribute("aria-checked", "false");
      radio.dataset.state = "unchecked";
      syncItemIndicator(radio, false);
    });
  }

  item.setAttribute("aria-checked", "true");
  item.dataset.state = "checked";
  syncItemIndicator(item, true);
}

function syncItemIndicator(item, checked) {
  const indicator = item.querySelector(
    "[data-essence-dropdown-menu-item-indicator], [data-essence-context-menu-item-indicator], [data-essence-menubar-item-indicator]"
  );
  if (!indicator) return;
  indicator.style.display = checked ? "" : "none";
  indicator.hidden = !checked;
  indicator.dataset.state = checked ? "checked" : "unchecked";
}
