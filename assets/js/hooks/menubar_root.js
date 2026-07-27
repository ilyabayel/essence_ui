import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import {
  getMenuItems,
  focusItem,
  findMenuPart,
  MenuController,
} from "../lib/menu";
import { whenMouse } from "../lib/pointer";

export const MenubarRoot = {
  mounted() {
    this.activeMenu = null;
    this.dismissable = null;
    this.menu = new MenuController({
      onClose: () => this.closeActive(),
      onEscape: (e) => {
        e.preventDefault();
        const trigger = this.activeMenu?.querySelector(
          "[data-radix-menubar-trigger]"
        );
        this.closeActive();
        trigger?.focus();
        return true;
      },
      onArrowRightOutside: (e) => {
        e.preventDefault();
        e.stopPropagation();
        this.openAdjacentMenu(1);
        return true;
      },
      onArrowLeftOutside: (e) => {
        e.preventDefault();
        e.stopPropagation();
        this.openAdjacentMenu(-1);
        return true;
      },
      isShellItem: (item) => item.hasAttribute("data-radix-menubar-trigger"),
    });

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onTriggerMouseEnter = whenMouse(this.onTriggerMouseEnter.bind(this));
    this.onRootKeyDown = this.onRootKeyDown.bind(this);
    this.onDismiss = this.onDismiss.bind(this);

    this.bindMenus();
    this.el.addEventListener("keydown", this.onRootKeyDown);
    this.el.setAttribute("data-hydrated", "");
  },

  updated() {
    this.bindMenus();
  },

  destroyed() {
    this.closeActive();
    this.menu?.detach();
    this.el.removeEventListener("keydown", this.onRootKeyDown);
    this.el.querySelectorAll("[data-radix-menubar-trigger]").forEach((t) => {
      t.removeEventListener("click", this.onTriggerClick);
      t.removeEventListener("pointerenter", this.onTriggerMouseEnter);
    });
  },

  getMenus() {
    return Array.from(this.el.querySelectorAll("[data-radix-menubar-menu]"));
  },

  getTriggers() {
    return this.getMenus()
      .map((menu) => menu.querySelector("[data-radix-menubar-trigger]"))
      .filter(Boolean);
  },

  resolveContent(menu) {
    const trigger = menu.querySelector("[data-radix-menubar-trigger]");
    const contentId = trigger?.getAttribute("aria-controls");
    return (
      findMenuPart(menu, "[data-radix-menubar-content]", contentId) ||
      findMenuPart(
        this.el,
        `[data-radix-menubar-content]#${contentId}`,
        contentId
      )
    );
  },

  bindMenus() {
    this.getTriggers().forEach((trigger) => {
      if (trigger.hasAttribute("data-menubar-bound")) return;
      trigger.setAttribute("data-menubar-bound", "true");
      trigger.addEventListener("click", this.onTriggerClick);
      trigger.addEventListener("pointerenter", this.onTriggerMouseEnter);
    });
  },

  onTriggerClick(e) {
    e.preventDefault();
    e.stopPropagation();
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    const menu = trigger.closest("[data-radix-menubar-menu]");
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
    const menu = trigger.closest("[data-radix-menubar-menu]");
    if (menu !== this.activeMenu) {
      this.openMenu(menu);
    }
  },

  onDismiss() {
    this.closeActive();
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
        this.openMenu(focused.closest("[data-radix-menubar-menu]"));
      }
      return;
    }

    if (e.key === prevKey || e.key === nextKey) {
      const active = document.activeElement;
      // Submenu owns ArrowRight on its trigger and ArrowLeft inside its content.
      if (
        (e.key === nextKey &&
          active?.hasAttribute("data-radix-menu-sub-trigger")) ||
        active?.closest("[data-radix-menu-sub-content]")
      ) {
        return;
      }
      e.preventDefault();
      this.openAdjacentMenu(e.key === nextKey ? 1 : -1);
    }
  },

  openAdjacentMenu(delta) {
    const menus = this.getMenus();
    if (!menus.length || !this.activeMenu) return;
    const idx = menus.indexOf(this.activeMenu);
    if (idx === -1) return;
    const nextIdx = (idx + delta + menus.length) % menus.length;
    this.openMenu(menus[nextIdx]);
  },

  openMenu(menu) {
    if (!menu) return;
    this.closeActive(false);

    const trigger = menu.querySelector("[data-radix-menubar-trigger]");
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

    this.menu.attach(content, { modal: true });

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
    const trigger = menu.querySelector("[data-radix-menubar-trigger]");
    const content = this.resolveContent(menu);

    this.activeMenu = null;
    this.menu.resetTypeahead();
    this.menu.closeAllSubs(content);
    this.menu.detach();

    if (trigger) {
      trigger.setAttribute("aria-expanded", "false");
    }

    if (content) {
      setClosed(content, {
        extras: [trigger],
        waitForAnimation: false,
      });
    }

    this.unbindDismissable();
    if (returnFocus) trigger?.focus();
  },

  unbindDismissable() {
    if (this.dismissable) {
      this.dismissable.unbind();
      this.dismissable = null;
    }
  },
};
