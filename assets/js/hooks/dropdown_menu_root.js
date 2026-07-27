import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import { applyPortalTheme } from "../lib/theme";
import {
  getMenuItems,
  focusItem,
  findMenuPart,
  MenuController,
} from "../lib/menu";

export const DropdownMenuRoot = {
  mounted() {
    this.isOpen = false;
    this.dismissable = null;
    this.menu = new MenuController({
      onClose: () => this.close(),
    });

    this.onTriggerClick = this.onTriggerClick.bind(this);
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
      this.trigger.removeEventListener("click", this.onTriggerClick);
      this.trigger.removeEventListener("keydown", this.onTriggerKeyDown);
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
    this.returnFocus();
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
