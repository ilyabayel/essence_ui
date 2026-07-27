import { getFixedContainingBlockOffset } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import { applyPortalTheme } from "../lib/theme";
import {
  getMenuItems,
  focusItem,
  findMenuPart,
  MenuController,
} from "../lib/menu";

export const ContextMenuRoot = {
  mounted() {
    this.isOpen = false;
    this.dismissable = null;
    this.pointer = { x: 0, y: 0 };
    this.menu = new MenuController({
      onClose: () => this.close(),
    });

    this.onContextMenu = this.onContextMenu.bind(this);
    this.onDismiss = this.onDismiss.bind(this);

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
    this.menu?.detach();
    if (this.trigger) {
      this.trigger.removeEventListener("contextmenu", this.onContextMenu);
    }
  },

  resolveParts() {
    this.trigger = this.el.querySelector(
      "[data-radix-context-menu-trigger]"
    );
    const contentId = this.trigger?.getAttribute("aria-controls");
    this.content = findMenuPart(
      this.el,
      "[data-radix-context-menu-content]",
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

  open(isInitial = false) {
    this.resolveParts();
    if (!this.trigger || !this.content) return;

    this.isOpen = true;
    applyPortalTheme(this.content, this.trigger || this.el);
    setOpen(this.content, [this.trigger, this.el]);
    this.trigger.setAttribute("aria-expanded", "true");

    this.positionAtPointer();

    this.menu.attach(this.content, {
      modal: this.el.hasAttribute("data-modal"),
    });

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

    const cb = getFixedContainingBlockOffset(this.content);
    x -= cb.left;
    y -= cb.top;

    this.content.style.left = `${x}px`;
    this.content.style.top = `${y}px`;
  },

  close() {
    if (!this.isOpen) return;
    this.isOpen = false;
    this.menu.resetTypeahead();
    this.menu.closeAllSubs();

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
    this.menu.detach();

    this.pushOpenChange(false);
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
