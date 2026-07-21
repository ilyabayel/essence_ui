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

export const ContextMenuRoot = {
  mounted() {
    this.isOpen = false;
    this.dismissable = null;
    this.typeahead = createTypeahead();
    this.pointer = { x: 0, y: 0 };

    this.onContextMenu = this.onContextMenu.bind(this);
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
    if (this.trigger) {
      this.trigger.removeEventListener("contextmenu", this.onContextMenu);
    }
    if (this.content) {
      this.content.removeEventListener("keydown", this.onKeyDown);
      this.content.removeEventListener("click", this.onItemClick);
    }
  },

  resolveParts() {
    this.trigger = this.el.querySelector(
      "[data-essence-context-menu-trigger]"
    );
    const contentId = this.trigger?.getAttribute("aria-controls");
    this.content = findMenuPart(
      this.el,
      "[data-essence-context-menu-content]",
      contentId
    );
  },

  bindTrigger() {
    if (!this.trigger || this._triggerBound === this.trigger) return;
    if (this._triggerBound) {
      this._triggerBound.removeEventListener("contextmenu", this.onContextMenu);
    }
    this.trigger.addEventListener("contextmenu", this.onContextMenu);
    this._triggerBound = this.trigger;
  },

  onContextMenu(e) {
    if (this.trigger?.hasAttribute("data-disabled")) return;
    e.preventDefault();
    e.stopPropagation();
    this.pointer = { x: e.clientX, y: e.clientY };
    this.open();
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

    if (item.hasAttribute("data-essence-context-menu-sub-trigger")) {
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

    if (e.key === "Escape") {
      e.preventDefault();
      this.close();
      return;
    }

    if (handleArrowKeys(e, items)) return;

    if (e.key === "ArrowRight") {
      const active = document.activeElement;
      if (active?.hasAttribute("data-essence-context-menu-sub-trigger")) {
        e.preventDefault();
        this.openSub(active);
        const sub = active
          .closest("[data-essence-context-menu-sub]")
          ?.querySelector("[data-essence-context-menu-sub-content]");
        const subItems = getMenuItems(sub);
        if (subItems[0]) focusItem(subItems[0], subItems);
      }
      return;
    }

    if (e.key === "ArrowLeft") {
      const active = document.activeElement;
      const subContent = active?.closest(
        "[data-essence-context-menu-sub-content]"
      );
      if (subContent) {
        e.preventDefault();
        const sub = subContent.closest("[data-essence-context-menu-sub]");
        const trigger = sub?.querySelector(
          "[data-essence-context-menu-sub-trigger]"
        );
        this.closeSub(sub);
        if (trigger) focusItem(trigger, items);
      }
      return;
    }

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

  open(isInitial = false) {
    this.resolveParts();
    if (!this.trigger || !this.content) return;

    this.isOpen = true;
    setOpen(this.content, [this.trigger, this.el]);
    
    this.positionAtPointer();

    this.bindSubmenus();
    closeOnItemClick(this.content, () => this.close());

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

  positionAtPointer() {
    if (!this.content) return;

    this.content.style.display = "";
    this.content.style.position = "fixed";
    this.content.hidden = false;

    const rect = this.content.getBoundingClientRect();
    const padding = 8;
    let x = this.pointer.x;
    let y = this.pointer.y;

    if (x + rect.width > window.innerWidth - padding) {
      x = window.innerWidth - rect.width - padding;
    }
    if (y + rect.height > window.innerHeight - padding) {
      y = window.innerHeight - rect.height - padding;
    }
    if (x < padding) x = padding;
    if (y < padding) y = padding;

    this.content.style.left = `${x}px`;
    this.content.style.top = `${y}px`;
  },

  close() {
    if (!this.isOpen) return;
    this.isOpen = false;
    this.typeahead.reset();
    this.closeAllSubs();

    if (this.trigger) {
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
  },

  bindSubmenus() {
    if (!this.content) return;

    this.content
      .querySelectorAll("[data-essence-context-menu-sub]")
      .forEach((sub) => {
        if (sub.hasAttribute("data-sub-bound")) return;
        sub.setAttribute("data-sub-bound", "true");

        const trigger = sub.querySelector(
          "[data-essence-context-menu-sub-trigger]"
        );
        const content = sub.querySelector(
          "[data-essence-context-menu-sub-content]"
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

        trigger.addEventListener("mouseenter", open);
        trigger.addEventListener("focus", open);
        trigger.addEventListener("mouseleave", scheduleClose);
        content.addEventListener("mouseenter", () => clearTimeout(closeTimer));
        content.addEventListener("mouseleave", scheduleClose);
      });
  },

  openSub(trigger) {
    const sub = trigger.closest("[data-essence-context-menu-sub]");
    const content = sub?.querySelector(
      "[data-essence-context-menu-sub-content]"
    );
    if (!sub || !content) return;

    trigger.setAttribute("data-state", "open");
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

    closeOnItemClick(content, () => this.close());
  },

  closeSub(sub) {
    if (!sub) return;
    const trigger = sub.querySelector(
      "[data-essence-context-menu-sub-trigger]"
    );
    const content = sub.querySelector(
      "[data-essence-context-menu-sub-content]"
    );

    sub
      .querySelectorAll("[data-essence-context-menu-sub]")
      .forEach((nested) => {
        if (nested !== sub) this.closeSub(nested);
      });

    if (trigger) {
      trigger.setAttribute("data-state", "closed");
          }
    sub.dataset.state = "closed";
    if (content) {
      setClosed(content, { waitForAnimation: false });
    }
  },

  closeAllSubs() {
    this.content
      ?.querySelectorAll("[data-essence-context-menu-sub]")
      .forEach((sub) => this.closeSub(sub));
  },

  unbindDismissable() {
    if (this.dismissable) {
      this.dismissable.unbind();
      this.dismissable = null;
    }
  },

  pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  },
};
