/**
 * Shared helpers + MenuController for menu-like primitives
 * (DropdownMenu, ContextMenu, Menubar).
 */

import { positionFloating } from "./position";
import { setOpen, setClosed } from "./presence";
import { whenMouse } from "./pointer";

const ITEM_SELECTOR =
  '[role="menuitem"], [role="menuitemcheckbox"], [role="menuitemradio"]';

const SUB_SEL = "[data-radix-menu-sub]";
const SUB_TRIGGER_SEL = "[data-radix-menu-sub-trigger]";
const SUB_CONTENT_SEL = "[data-radix-menu-sub-content]";
const RADIO_GROUP_SEL = "[data-radix-menu-radio-group]";
const INDICATOR_SEL = "[data-radix-menu-item-indicator]";

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
      item.getAttribute("aria-disabled") !== "true" &&
      // Only items belonging to this menu level (exclude nested submenus).
      item.closest('[role="menu"]') === content
  );
}

/**
 * Items for the menu level that currently has focus (parent or nested sub).
 * @param {Element} fallbackContent
 * @returns {Element[]}
 */
export function getFocusedMenuItems(fallbackContent) {
  const menu = document.activeElement?.closest('[role="menu"]');
  return getMenuItems(menu || fallbackContent);
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
 * Matches Themes: all items close on select except sub-triggers.
 * @param {Element} item
 * @returns {boolean}
 */
export function shouldCloseOnItemClick(item) {
  if (!item) return false;
  if (item.hasAttribute("data-radix-menu-sub-trigger")) return false;
  return true;
}

/**
 * Highlight menu items on mouse pointer move (MenuItemImpl).
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
    item.closest(RADIO_GROUP_SEL) ||
    item.closest('[role="group"]') ||
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
  const indicator = item.querySelector(INDICATOR_SEL);
  if (!indicator) return;
  indicator.style.display = checked ? "" : "none";
  indicator.hidden = !checked;
  indicator.dataset.state = checked ? "checked" : "unchecked";
}

/**
 * Shared open-content behavior for DropdownMenu / ContextMenu / Menubar.
 *
 * Owns: item click (checkbox/radio/sub), keyboard nav + typeahead,
 * submenu hover open/close, pointer highlight, close-on-item-click.
 *
 * @typedef {object} MenuControllerOptions
 * @property {() => void} onClose
 * @property {ReturnType<typeof createTypeahead>} [typeahead]
 * @property {(e: KeyboardEvent) => boolean | void} [onArrowLeftOutside]
 *   Called when ArrowLeft is pressed outside a submenu. Return true if handled.
 * @property {(e: KeyboardEvent) => boolean | void} [onArrowRightOutside]
 *   Called when ArrowRight is pressed and focus is not on a sub-trigger.
 * @property {(e: KeyboardEvent) => boolean | void} [onEscape]
 *   Override Escape handling. Return true if handled (skips default onClose).
 * @property {(item: Element) => boolean} [isShellItem]
 *   Ignore clicks on shell items (e.g. menubar triggers inside content tree).
 * @property {boolean} [modal=true]
 *   When true, show a fullscreen transparent backdrop that blocks page scroll
 *   and closes the menu on pointerdown (does not toggle body overflow).
 */
export class MenuController {
  /** @param {MenuControllerOptions} opts */
  constructor(opts) {
    this.onClose = opts.onClose;
    this.typeahead = opts.typeahead || createTypeahead();
    this.onArrowLeftOutside = opts.onArrowLeftOutside;
    this.onArrowRightOutside = opts.onArrowRightOutside;
    this.onEscape = opts.onEscape;
    this.isShellItem = opts.isShellItem;
    this.modal = opts.modal !== false;
    this.openSubs = new Set();
    this.content = null;
    this._backdrop = null;

    this._onItemClick = this._onItemClick.bind(this);
    this._onKeyDown = this._onKeyDown.bind(this);
    this._onBackdropScroll = this._onBackdropScroll.bind(this);
    this._onBackdropPointer = this._onBackdropPointer.bind(this);
  }

  /**
   * Attach interaction handlers to an open menu content root.
   * @param {Element} content
   * @param {{ modal?: boolean }} [options]
   */
  attach(content, options = {}) {
    if (!content) return;
    if (this.content && this.content !== content) {
      this.detach();
    }
    this.content = content;
    this.bindSubmenus(content);
    closeOnItemClick(content, () => this.onClose());
    bindMenuPointerHighlight(content);
    content.removeEventListener("click", this._onItemClick);
    content.addEventListener("click", this._onItemClick);
    content.removeEventListener("keydown", this._onKeyDown);
    content.addEventListener("keydown", this._onKeyDown);

    const modal = options.modal !== undefined ? options.modal : this.modal;
    if (modal) this.showBackdrop();
  }

  detach() {
    this.hideBackdrop();
    if (this.content) {
      this.content.removeEventListener("click", this._onItemClick);
      this.content.removeEventListener("keydown", this._onKeyDown);
    }
    this.content = null;
  }

  /**
   * Fullscreen transparent backdrop under the menu: blocks page scroll without
   * removing the scrollbar, closes on click.
   *
   * Must share the menu's stacking context. A body-level overlay loses when an
   * ancestor has `contain: paint` / transform (content z-index stays trapped at
   * auto=0 while body overlay at 49 paints on top). Insert as previous sibling.
   */
  showBackdrop() {
    if (this._backdrop || !this.content) return;

    const MENU_Z = 50;
    const BACKDROP_Z = MENU_Z - 1;

    this.content.style.zIndex = String(MENU_Z);

    const overlay = document.createElement("div");
    overlay.setAttribute("data-radix-menu-scroll-lock", "");
    Object.assign(overlay.style, {
      position: "fixed",
      inset: "0",
      zIndex: String(BACKDROP_Z),
      background: "transparent",
    });

    overlay.addEventListener("wheel", this._onBackdropScroll, {
      passive: false,
    });
    overlay.addEventListener("touchmove", this._onBackdropScroll, {
      passive: false,
    });
    overlay.addEventListener("pointerdown", this._onBackdropPointer);

    const parent = this.content.parentElement || document.body;
    parent.insertBefore(overlay, this.content);
    this._backdrop = overlay;

    // Page scroll outside a contain:paint box still needs blocking.
    this._onDocScroll = (event) => {
      const target = event.target;
      if (this.content?.contains(target)) return;
      if ([...this.openSubs].some((sub) => sub.contains(target))) return;
      event.preventDefault();
    };
    document.addEventListener("wheel", this._onDocScroll, {
      passive: false,
      capture: true,
    });
    document.addEventListener("touchmove", this._onDocScroll, {
      passive: false,
      capture: true,
    });
  }

  hideBackdrop() {
    if (this._onDocScroll) {
      document.removeEventListener("wheel", this._onDocScroll, {
        capture: true,
      });
      document.removeEventListener("touchmove", this._onDocScroll, {
        capture: true,
      });
      this._onDocScroll = null;
    }

    if (this._backdrop) {
      this._backdrop.removeEventListener("wheel", this._onBackdropScroll);
      this._backdrop.removeEventListener("touchmove", this._onBackdropScroll);
      this._backdrop.removeEventListener(
        "pointerdown",
        this._onBackdropPointer
      );
      this._backdrop.remove();
      this._backdrop = null;
    }
  }

  _onBackdropScroll(event) {
    event.preventDefault();
  }

  _onBackdropPointer() {
    this.onClose();
  }

  resetTypeahead() {
    this.typeahead.reset();
  }

  /** @param {Element} [content] */
  closeAllSubs(content = this.content) {
    content?.querySelectorAll(SUB_SEL).forEach((sub) => this.closeSub(sub));
    this.openSubs.clear();
  }

  /** @param {Element} content */
  bindSubmenus(content) {
    if (!content) return;

    content.querySelectorAll(SUB_SEL).forEach((sub) => {
      if (sub.hasAttribute("data-sub-bound")) return;
      sub.setAttribute("data-sub-bound", "true");

      const trigger = sub.querySelector(SUB_TRIGGER_SEL);
      const subContent = sub.querySelector(SUB_CONTENT_SEL);
      if (!trigger || !subContent) return;

      let closeTimer;

      const open = () => {
        clearTimeout(closeTimer);
        this.openSub(trigger);
      };

      const scheduleClose = () => {
        closeTimer = setTimeout(() => this.closeSub(sub), 150);
      };

      // Hover open is mouse-only ; click/keyboard open via item click / arrows.
      trigger.addEventListener("pointerenter", whenMouse(open));
      trigger.addEventListener("pointerleave", whenMouse(scheduleClose));
      subContent.addEventListener(
        "pointerenter",
        whenMouse(() => clearTimeout(closeTimer))
      );
      subContent.addEventListener("pointerleave", whenMouse(scheduleClose));
    });
  }

  /** @param {Element} trigger */
  openSub(trigger) {
    const sub = trigger.closest(SUB_SEL);
    const content = sub?.querySelector(SUB_CONTENT_SEL);
    if (!sub || !content) return;

    // Close sibling subs at the same level
    const parent = sub.parentElement?.closest(SUB_SEL) || this.content;
    parent?.querySelectorAll(`:scope > ${SUB_SEL}`).forEach((sibling) => {
      if (sibling !== sub) this.closeSub(sibling);
    });
    // Also close direct children of the root content
    if (this.content && parent === this.content) {
      this.content.querySelectorAll(`:scope > ${SUB_SEL}`).forEach((sibling) => {
        if (sibling !== sub) this.closeSub(sibling);
      });
    }

    trigger.setAttribute("data-state", "open");
    trigger.setAttribute("aria-expanded", "true");
    sub.dataset.state = "open";
    setOpen(content);

    positionFloating({
      trigger,
      content,
      side: content.dataset.side || "right",
      align: content.dataset.align || "start",
      sideOffset: parseInt(content.dataset.sideOffset, 10) || 0,
    });

    this.openSubs.add(sub);
    closeOnItemClick(content, () => this.onClose());
    bindMenuPointerHighlight(content);
  }

  /** @param {Element|null|undefined} sub */
  closeSub(sub) {
    if (!sub) return;
    const trigger = sub.querySelector(SUB_TRIGGER_SEL);
    const content = sub.querySelector(SUB_CONTENT_SEL);

    sub.querySelectorAll(SUB_SEL).forEach((nested) => {
      if (nested !== sub) this.closeSub(nested);
    });

    if (trigger) {
      trigger.setAttribute("data-state", "closed");
      trigger.setAttribute("aria-expanded", "false");
    }
    sub.dataset.state = "closed";
    if (content) {
      setClosed(content, { waitForAnimation: false });
    }
    this.openSubs.delete(sub);
  }

  /** @param {MouseEvent} e */
  _onItemClick(e) {
    const item = e.target.closest(ITEM_SELECTOR);
    if (!item || !this.content?.contains(item)) return;
    if (item.hasAttribute("data-disabled")) return;
    if (this.isShellItem?.(item)) return;

    if (item.hasAttribute("data-radix-menu-sub-trigger")) {
      this.openSub(item);
      return;
    }

    if (item.getAttribute("role") === "menuitemcheckbox") {
      toggleCheckboxItem(item);
      return;
    }

    if (item.getAttribute("role") === "menuitemradio") {
      selectRadioItem(item);
    }
  }

  /** @param {KeyboardEvent} e */
  _onKeyDown(e) {
    if (!this.content) return;

    const items = getMenuItems(this.content);
    const navItems = getFocusedMenuItems(this.content);

    if (e.key === "Escape") {
      if (this.onEscape?.(e)) return;
      e.preventDefault();
      this.onClose();
      return;
    }

    if (handleArrowKeys(e, navItems)) return;

    if (e.key === "ArrowRight") {
      const active = document.activeElement;
      if (active?.hasAttribute("data-radix-menu-sub-trigger")) {
        e.preventDefault();
        e.stopPropagation();
        this.openSub(active);
        const sub = active
          .closest(SUB_SEL)
          ?.querySelector(SUB_CONTENT_SEL);
        const subItems = getMenuItems(sub);
        if (subItems[0]) focusItem(subItems[0], subItems);
        return;
      }
      if (this.onArrowRightOutside?.(e)) return;
      return;
    }

    if (e.key === "ArrowLeft") {
      const active = document.activeElement;
      const subContent = active?.closest(SUB_CONTENT_SEL);
      if (subContent) {
        e.preventDefault();
        e.stopPropagation();
        const sub = subContent.closest(SUB_SEL);
        const trigger = sub?.querySelector(SUB_TRIGGER_SEL);
        this.closeSub(sub);
        if (trigger) focusItem(trigger, items);
        return;
      }
      if (this.onArrowLeftOutside?.(e)) return;
      return;
    }

    if (e.key === "Enter" || e.key === " ") {
      const active = document.activeElement;
      if (active?.hasAttribute("data-radix-menu-sub-trigger")) {
        e.preventDefault();
        this.openSub(active);
        const sub = active
          .closest(SUB_SEL)
          ?.querySelector(SUB_CONTENT_SEL);
        const subItems = getMenuItems(sub);
        if (subItems[0]) focusItem(subItems[0], subItems);
        return;
      }
      if (active && navItems.includes(active)) {
        e.preventDefault();
        active.click();
      }
      return;
    }

    if (e.key.length === 1 && !e.ctrlKey && !e.metaKey && !e.altKey) {
      this.typeahead.handle(e.key, navItems);
    }
  }
}
