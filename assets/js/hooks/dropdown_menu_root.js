import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import { applyPortalTheme } from "../lib/theme";
import {
  getMenuItems,
  getFocusedMenuItems,
  focusItem,
  handleArrowKeys,
  createTypeahead,
  closeOnItemClick,
  findMenuPart,
  toggleCheckboxItem,
  selectRadioItem,
  bindMenuPointerHighlight,
} from "../lib/menu";
import { whenMouse } from "../lib/pointer";

export const DropdownMenuRoot = {
  mounted() {
    this.isOpen = false;
    this.dismissable = null;
    this.typeahead = createTypeahead();
    this.openSubs = new Set();

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onDismiss = this.onDismiss.bind(this);
    this.onItemClick = this.onItemClick.bind(this);

    this.resolveParts();
    this.bindTrigger();

    if (this.el.dataset.state === "open") {
      this.open(true);
    }
    this.el.setAttribute("data-hydrated", "");
  },

  updated() {
    this.resolveParts();
    this.bindTrigger();
  },

  destroyed() {
    this.unbindDismissable();
    this.unlockScroll();
    if (this.trigger) {
      this.trigger.removeEventListener("click", this.onTriggerClick);
      this.trigger.removeEventListener("keydown", this.onTriggerKeyDown);
    }
    if (this.content) {
      this.content.removeEventListener("keydown", this.onKeyDown);
      this.content.removeEventListener("click", this.onItemClick);
    }
  },

  resolveParts() {
    this.trigger = this.el.querySelector(
      "[data-radix-dropdown-menu-trigger]"
    );
    const contentId = this.trigger?.getAttribute("aria-controls");
    this.content = findMenuPart(
      this.el,
      "[data-radix-dropdown-menu-content]",
      contentId
    );
  },

  bindTrigger() {
    if (!this.trigger || this._triggerBound === this.trigger) return;
    if (this._triggerBound) {
      this._triggerBound.removeEventListener("click", this.onTriggerClick);
      this._triggerBound.removeEventListener("keydown", this.onTriggerKeyDown);
    }
    this.onTriggerKeyDown = this.onTriggerKeyDown.bind(this);
    this.trigger.addEventListener("click", this.onTriggerClick);
    this.trigger.addEventListener("keydown", this.onTriggerKeyDown);
    this._triggerBound = this.trigger;
  },

  onTriggerKeyDown(e) {
    if (this.trigger?.tagName === "BUTTON") return;
    if (e.key !== "Enter" && e.key !== " ") return;
    e.preventDefault();
    this.onTriggerClick(e);
  },

  onTriggerClick(e) {
    e.stopPropagation();
    e.preventDefault();
    if (this.trigger?.hasAttribute("data-disabled")) return;
    if (this.isOpen) {
      this.close();
    } else {
      this.open();
    }
  },

  onDismiss() {
    this.close();
  },

  onItemClick(e) {
    const item = e.target.closest(
      '[role="menuitem"], [role="menuitemcheckbox"], [role="menuitemradio"]'
    );
    if (!item || !this.content?.contains(item)) return;
    if (item.hasAttribute("data-disabled")) return;

    if (item.hasAttribute("data-radix-dropdown-menu-sub-trigger")) {
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

  onKeyDown(e) {
    if (!this.isOpen || !this.content) return;

    const items = getMenuItems(this.content);
    const navItems = getFocusedMenuItems(this.content);

    if (e.key === "Escape") {
      e.preventDefault();
      this.close();
      return;
    }

    if (handleArrowKeys(e, navItems)) return;

    if (e.key === "ArrowRight") {
      const active = document.activeElement;
      if (active?.hasAttribute("data-radix-dropdown-menu-sub-trigger")) {
        e.preventDefault();
        this.openSub(active);
        const sub = active
          .closest("[data-radix-dropdown-menu-sub]")
          ?.querySelector("[data-radix-dropdown-menu-sub-content]");
        const subItems = getMenuItems(sub);
        if (subItems[0]) focusItem(subItems[0], subItems);
      }
      return;
    }

    if (e.key === "ArrowLeft") {
      const active = document.activeElement;
      const subContent = active?.closest(
        "[data-radix-dropdown-menu-sub-content]"
      );
      if (subContent) {
        e.preventDefault();
        const sub = subContent.closest("[data-radix-dropdown-menu-sub]");
        const trigger = sub?.querySelector(
          "[data-radix-dropdown-menu-sub-trigger]"
        );
        this.closeSub(sub);
        if (trigger) focusItem(trigger, items);
      }
      return;
    }

    if (e.key === "Enter" || e.key === " ") {
      const active = document.activeElement;
      if (active?.hasAttribute("data-radix-dropdown-menu-sub-trigger")) {
        e.preventDefault();
        this.openSub(active);
        const sub = active
          .closest("[data-radix-dropdown-menu-sub]")
          ?.querySelector("[data-radix-dropdown-menu-sub-content]");
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
  },

  open(isInitial = false) {
    this.resolveParts();
    if (!this.trigger || !this.content) return;

    this.isOpen = true;
    applyPortalTheme(this.content, this.trigger || this.el);
    setOpen(this.content, [this.trigger, this.el]);
    this.trigger.setAttribute("aria-expanded", "true");

    const side = this.content.dataset.side || "bottom";
    const align = this.content.dataset.align || "start";
    const sideOffset = parseInt(this.content.dataset.sideOffset, 10) || 4;

    positionFloating({
      trigger: this.trigger,
      content: this.content,
      side,
      align,
      sideOffset,
    });

    this.bindSubmenus();
    closeOnItemClick(this.content, () => this.close());
    bindMenuPointerHighlight(this.content);
    this.lockScroll();

    this.content.removeEventListener("click", this.onItemClick);
    this.content.addEventListener("click", this.onItemClick);
    this.content.removeEventListener("keydown", this.onKeyDown);
    this.content.addEventListener("keydown", this.onKeyDown);

    this.unbindDismissable();
    this.dismissable = bindDismissableLayer({
      onDismiss: this.onDismiss,
      layers: [this.trigger, this.content],
    });

    if (!isInitial) {
      this.pushOpenChange(true);
      requestAnimationFrame(() => {
        const items = getMenuItems(this.content);
        if (items[0]) focusItem(items[0], items);
        else {
          this.content.tabIndex = -1;
          this.content.focus();
        }
      });
    }
  },

  close() {
    if (!this.isOpen) return;
    this.isOpen = false;
    this.typeahead.reset();

    this.closeAllSubs();
    this.unlockScroll();

    if (this.trigger) {
      this.trigger.setAttribute("aria-expanded", "false");
    }

    setClosed(this.content, {
      extras: [this.trigger, this.el],
      shouldHide: () => !this.isOpen,
    });

    setTimeout(() => {
      if (!this.isOpen && this.content) {
        const style = getComputedStyle(this.content);
        const hasAnimation =
          style.animationName !== "none" &&
          parseFloat(style.animationDuration) > 0;
        if (!hasAnimation) {
          this.content.style.display = "none";
          this.content.hidden = true;
        }
      }
    }, 50);

    this.unbindDismissable();
    if (this.content) {
      this.content.removeEventListener("keydown", this.onKeyDown);
    }

    this.pushOpenChange(false);
    this.returnFocus();
  },

  bindSubmenus() {
    if (!this.content) return;

    this.content
      .querySelectorAll("[data-radix-dropdown-menu-sub]")
      .forEach((sub) => {
        if (sub.hasAttribute("data-sub-bound")) return;
        sub.setAttribute("data-sub-bound", "true");

        const trigger = sub.querySelector(
          "[data-radix-dropdown-menu-sub-trigger]"
        );
        const content = sub.querySelector(
          "[data-radix-dropdown-menu-sub-content]"
        );
        if (!trigger || !content) return;

        let closeTimer;

        const open = () => {
          clearTimeout(closeTimer);
          this.openSub(trigger);
        };

        const scheduleClose = () => {
          closeTimer = setTimeout(() => this.closeSub(sub), 150);
        };

        // Hover open is mouse-only ; click/keyboard open via onItemClick / arrows.
        trigger.addEventListener("pointerenter", whenMouse(open));
        trigger.addEventListener("pointerleave", whenMouse(scheduleClose));
        content.addEventListener(
          "pointerenter",
          whenMouse(() => clearTimeout(closeTimer))
        );
        content.addEventListener("pointerleave", whenMouse(scheduleClose));
      });
  },

  openSub(trigger) {
    const sub = trigger.closest("[data-radix-dropdown-menu-sub]");
    const content = sub?.querySelector(
      "[data-radix-dropdown-menu-sub-content]"
    );
    if (!sub || !content) return;

    // Close sibling subs
    const parent =
      sub.parentElement?.closest("[data-radix-dropdown-menu-sub]") ||
      this.content;
    parent
      ?.querySelectorAll(":scope > [data-radix-dropdown-menu-sub], [data-radix-dropdown-menu-content] > [data-radix-dropdown-menu-sub]")
      .forEach((sibling) => {
        if (sibling !== sub) this.closeSub(sibling);
      });

    trigger.setAttribute("data-state", "open");
    trigger.setAttribute("aria-expanded", "true");
    sub.dataset.state = "open";
    setOpen(content);

    const side = content.dataset.side || "right";
    const align = content.dataset.align || "start";
    const sideOffset = parseInt(content.dataset.sideOffset, 10) || 0;

    positionFloating({
      trigger,
      content,
      side,
      align,
      sideOffset,
    });

    this.openSubs.add(sub);
    closeOnItemClick(content, () => this.close());
    bindMenuPointerHighlight(content);
  },

  closeSub(sub) {
    if (!sub) return;
    const trigger = sub.querySelector(
      "[data-radix-dropdown-menu-sub-trigger]"
    );
    const content = sub.querySelector(
      "[data-radix-dropdown-menu-sub-content]"
    );

    // Close nested first
    sub
      .querySelectorAll("[data-radix-dropdown-menu-sub]")
      .forEach((nested) => {
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
  },

  closeAllSubs() {
    this.content
      ?.querySelectorAll("[data-radix-dropdown-menu-sub]")
      .forEach((sub) => this.closeSub(sub));
    this.openSubs.clear();
  },

  lockScroll() {
    if (!this.el.hasAttribute("data-modal") || this._scrollLocked) return;

    this._scrollLocked = {
      bodyOverflow: document.body.style.overflow,
      htmlOverflow: document.documentElement.style.overflow,
    };
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden";

    // Apps may scroll an inner container, not body — so also
    // block wheel/touch outside the open menu layers.
    this._onScrollBlock = (event) => {
      const target = event.target;
      const inMenu =
        (this.content && this.content.contains(target)) ||
        [...this.openSubs].some((sub) => sub.contains(target));
      if (inMenu) return;
      event.preventDefault();
    };
    document.addEventListener("wheel", this._onScrollBlock, {
      passive: false,
      capture: true,
    });
    document.addEventListener("touchmove", this._onScrollBlock, {
      passive: false,
      capture: true,
    });

    // Full-viewport layer so scroll targets always hit a node we control when
    // the pointer is outside the menu (pointer-events none would let scroll through).
    const overlay = document.createElement("div");
    overlay.setAttribute("data-radix-dropdown-menu-scroll-lock", "");
    Object.assign(overlay.style, {
      position: "fixed",
      inset: "0",
      zIndex: "49",
      background: "transparent",
    });
    // Clicks on the overlay dismiss via the existing dismissable layer (target
    // is outside menu layers). Do not stopPropagation so pointerdown reaches it.
    document.body.appendChild(overlay);
    this._scrollOverlay = overlay;
  },

  unlockScroll() {
    if (!this._scrollLocked) return;
    document.body.style.overflow = this._scrollLocked.bodyOverflow;
    document.documentElement.style.overflow = this._scrollLocked.htmlOverflow;
    this._scrollLocked = null;

    if (this._onScrollBlock) {
      document.removeEventListener("wheel", this._onScrollBlock, {
        capture: true,
      });
      document.removeEventListener("touchmove", this._onScrollBlock, {
        capture: true,
      });
      this._onScrollBlock = null;
    }
    if (this._scrollOverlay) {
      this._scrollOverlay.remove();
      this._scrollOverlay = null;
    }
  },

  unbindDismissable() {
    if (this.dismissable) {
      this.dismissable.unbind();
      this.dismissable = null;
    }
  },

  returnFocus() {
    this.trigger?.focus();
  },

  pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  },
};
