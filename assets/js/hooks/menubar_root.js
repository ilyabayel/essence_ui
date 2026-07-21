import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import {
  getMenuItems,
  focusItem,
  handleArrowKeys,
  createTypeahead,
  closeOnItemClick,
  findMenuPart,
  toggleCheckboxItem,
  selectRadioItem,
} from "../lib/menu";

export const MenubarRoot = {
  mounted() {
    this.activeMenu = null;
    this.dismissable = null;
    this.typeahead = createTypeahead();

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onTriggerMouseEnter = this.onTriggerMouseEnter.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onRootKeyDown = this.onRootKeyDown.bind(this);
    this.onDismiss = this.onDismiss.bind(this);
    this.onItemClick = this.onItemClick.bind(this);

    this.bindMenus();
    this.el.addEventListener("keydown", this.onRootKeyDown);
    this.el.setAttribute("data-hydrated", "");
  },

  updated() {
    this.bindMenus();
  },

  destroyed() {
    this.closeActive();
    this.el.removeEventListener("keydown", this.onRootKeyDown);
    this.el.querySelectorAll("[data-essence-menubar-trigger]").forEach((t) => {
      t.removeEventListener("click", this.onTriggerClick);
      t.removeEventListener("mouseenter", this.onTriggerMouseEnter);
    });
  },

  getMenus() {
    return Array.from(this.el.querySelectorAll("[data-essence-menubar-menu]"));
  },

  getTriggers() {
    return this.getMenus()
      .map((menu) => menu.querySelector("[data-essence-menubar-trigger]"))
      .filter(Boolean);
  },

  resolveContent(menu) {
    const trigger = menu.querySelector("[data-essence-menubar-trigger]");
    const contentId = trigger?.getAttribute("aria-controls");
    return (
      findMenuPart(menu, "[data-essence-menubar-content]", contentId) ||
      findMenuPart(this.el, `[data-essence-menubar-content]#${contentId}`, contentId)
    );
  },

  bindMenus() {
    this.getTriggers().forEach((trigger) => {
      if (trigger.hasAttribute("data-menubar-bound")) return;
      trigger.setAttribute("data-menubar-bound", "true");
      trigger.addEventListener("click", this.onTriggerClick);
      trigger.addEventListener("mouseenter", this.onTriggerMouseEnter);
    });
  },

  onTriggerClick(e) {
    e.preventDefault();
    e.stopPropagation();
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    const menu = trigger.closest("[data-essence-menubar-menu]");
    if (this.activeMenu === menu) {
      this.closeActive();
    } else {
      this.openMenu(menu);
    }
  },

  onTriggerMouseEnter(e) {
    if (!this.activeMenu) return;
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    const menu = trigger.closest("[data-essence-menubar-menu]");
    if (menu !== this.activeMenu) {
      this.openMenu(menu);
    }
  },

  onDismiss() {
    this.closeActive();
  },

  onItemClick(e) {
    const item = e.target.closest(
      '[role="menuitem"], [role="menuitemcheckbox"], [role="menuitemradio"]'
    );
    const content = this.activeMenu
      ? this.resolveContent(this.activeMenu)
      : null;
    if (!item || !content?.contains(item)) return;
    if (item.hasAttribute("data-disabled")) return;
    if (item.hasAttribute("data-essence-menubar-trigger")) return;

    if (item.hasAttribute("data-essence-menubar-sub-trigger")) {
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
  },

  onRootKeyDown(e) {
    const triggers = this.getTriggers().filter(
      (t) => !t.hasAttribute("data-disabled")
    );
    if (!triggers.length) return;

    const orientation = this.el.dataset.orientation || "horizontal";
    const prevKey = orientation === "horizontal" ? "ArrowLeft" : "ArrowUp";
    const nextKey = orientation === "horizontal" ? "ArrowRight" : "ArrowDown";

    if (!this.activeMenu) {
      const focused = document.activeElement;
      const idx = triggers.indexOf(focused);
      if (idx === -1) return;

      if (e.key === nextKey) {
        e.preventDefault();
        triggers[(idx + 1) % triggers.length].focus();
      } else if (e.key === prevKey) {
        e.preventDefault();
        triggers[(idx - 1 + triggers.length) % triggers.length].focus();
      } else if (
        e.key === "Enter" ||
        e.key === " " ||
        e.key === "ArrowDown"
      ) {
        e.preventDefault();
        this.openMenu(focused.closest("[data-essence-menubar-menu]"));
      }
      return;
    }

    if (e.key === prevKey || e.key === nextKey) {
      e.preventDefault();
      const menus = this.getMenus();
      const idx = menus.indexOf(this.activeMenu);
      const nextIdx =
        e.key === nextKey
          ? (idx + 1) % menus.length
          : (idx - 1 + menus.length) % menus.length;
      this.openMenu(menus[nextIdx]);
    }
  },

  onKeyDown(e) {
    if (!this.activeMenu) return;
    const content = this.resolveContent(this.activeMenu);
    if (!content) return;

    const items = getMenuItems(content);

    if (e.key === "Escape") {
      e.preventDefault();
      const trigger = this.activeMenu.querySelector(
        "[data-essence-menubar-trigger]"
      );
      this.closeActive();
      trigger?.focus();
      return;
    }

    if (handleArrowKeys(e, items)) return;

    if (e.key === "Enter" || e.key === " ") {
      const active = document.activeElement;
      if (active && items.includes(active)) {
        e.preventDefault();
        active.click();
      }
      return;
    }

    if (e.key.length === 1 && !e.ctrlKey && !e.metaKey && !e.altKey) {
      this.typeahead.handle(e.key, items);
    }
  },

  openMenu(menu) {
    if (!menu) return;
    this.closeActive(false);

    const trigger = menu.querySelector("[data-essence-menubar-trigger]");
    const content = this.resolveContent(menu);
    if (!trigger || !content) return;

    this.activeMenu = menu;
    setOpen(content, [trigger]);
    trigger.setAttribute("aria-expanded", "true");

    const side = content.dataset.side || "bottom";
    const align = content.dataset.align || "start";
    const sideOffset = parseInt(content.dataset.sideOffset, 10) || 4;

    positionFloating({
      trigger,
      content,
      side,
      align,
      sideOffset,
    });

    this.bindSubmenus(content);
    closeOnItemClick(content, () => this.closeActive());

    content.removeEventListener("click", this.onItemClick);
    content.addEventListener("click", this.onItemClick);
    content.removeEventListener("keydown", this.onKeyDown);
    content.addEventListener("keydown", this.onKeyDown);

    this.unbindDismissable();
    this.dismissable = bindDismissableLayer({
      onDismiss: this.onDismiss,
      layers: [this.el, content],
    });

    requestAnimationFrame(() => {
      const items = getMenuItems(content);
      if (items[0]) focusItem(items[0], items);
      else {
        content.tabIndex = -1;
        content.focus();
      }
    });
  },

  closeActive(returnFocus = true) {
    if (!this.activeMenu) return;

    const menu = this.activeMenu;
    const trigger = menu.querySelector("[data-essence-menubar-trigger]");
    const content = this.resolveContent(menu);

    this.activeMenu = null;
    this.typeahead.reset();

    content
      ?.querySelectorAll("[data-essence-menubar-sub]")
      .forEach((sub) => this.closeSub(sub));

    if (trigger) {
      trigger.setAttribute("aria-expanded", "false");
    }

    if (content) {
      setClosed(content, {
        extras: [trigger],
        waitForAnimation: false,
      });
      content.removeEventListener("keydown", this.onKeyDown);
      content.removeEventListener("click", this.onItemClick);
    }

    this.unbindDismissable();
    if (returnFocus) trigger?.focus();
  },

  bindSubmenus(content) {
    content.querySelectorAll("[data-essence-menubar-sub]").forEach((sub) => {
      if (sub.hasAttribute("data-sub-bound")) return;
      sub.setAttribute("data-sub-bound", "true");

      const trigger = sub.querySelector("[data-essence-menubar-sub-trigger]");
      const subContent = sub.querySelector(
        "[data-essence-menubar-sub-content]"
      );
      if (!trigger || !subContent) return;

      let closeTimer;
      trigger.addEventListener("mouseenter", () => {
        clearTimeout(closeTimer);
        this.openSub(trigger);
      });
      trigger.addEventListener("focus", () => this.openSub(trigger));
      trigger.addEventListener("mouseleave", () => {
        closeTimer = setTimeout(() => this.closeSub(sub), 150);
      });
      subContent.addEventListener("mouseenter", () => clearTimeout(closeTimer));
      subContent.addEventListener("mouseleave", () => {
        closeTimer = setTimeout(() => this.closeSub(sub), 150);
      });
    });
  },

  openSub(trigger) {
    const sub = trigger.closest("[data-essence-menubar-sub]");
    const content = sub?.querySelector("[data-essence-menubar-sub-content]");
    if (!sub || !content) return;

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

    closeOnItemClick(content, () => this.closeActive());
  },

  closeSub(sub) {
    if (!sub) return;
    const trigger = sub.querySelector("[data-essence-menubar-sub-trigger]");
    const content = sub.querySelector("[data-essence-menubar-sub-content]");
    if (trigger) {
      trigger.setAttribute("data-state", "closed");
      trigger.setAttribute("aria-expanded", "false");
    }
    sub.dataset.state = "closed";
    if (content) setClosed(content, { waitForAnimation: false });
  },

  unbindDismissable() {
    if (this.dismissable) {
      this.dismissable.unbind();
      this.dismissable = null;
    }
  },
};
