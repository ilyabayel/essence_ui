import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { bindDismissableLayer } from "../lib/dismissable_layer";
import { focusFirst, trapFocus } from "../lib/focus_scope";

function findPart(root, selector, contentId) {
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

export const PopoverRoot = {
  mounted() {
    this.isOpen = false;
    this.dismissable = null;

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onCloseClick = this.onCloseClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onDismiss = this.onDismiss.bind(this);

    this.resolveParts();
    this.bindTrigger();

    if (this.el.dataset.state === "open") {
      this.open(true);
    }
  },

  updated() {
    this.resolveParts();
    this.bindTrigger();
  },

  destroyed() {
    this.unbindDismissable();
    if (this.trigger) {
      this.trigger.removeEventListener("click", this.onTriggerClick);
    }
    if (this.content) {
      this.content.removeEventListener("keydown", this.onKeyDown);
      this.content
        .querySelectorAll("[data-essence-popover-close]")
        .forEach((btn) => btn.removeEventListener("click", this.onCloseClick));
    }
  },

  resolveParts() {
    this.trigger = this.el.querySelector("[data-essence-popover-trigger]");
    this.anchor = this.el.querySelector("[data-essence-popover-anchor]");
    const contentId = this.trigger?.getAttribute("aria-controls");
    this.content = findPart(
      this.el,
      "[data-essence-popover-content]",
      contentId
    );
  },

  bindTrigger() {
    if (!this.trigger || this._triggerBound === this.trigger) return;
    if (this._triggerBound) {
      this._triggerBound.removeEventListener("click", this.onTriggerClick);
    }
    this.trigger.addEventListener("click", this.onTriggerClick);
    this._triggerBound = this.trigger;
  },

  onTriggerClick(e) {
    e.stopPropagation();
    if (this.isOpen) {
      this.close();
    } else {
      this.open();
    }
  },

  onCloseClick() {
    this.close();
  },

  onDismiss() {
    this.close();
  },

  onKeyDown(e) {
    trapFocus(e, this.content);
  },

  open(isInitial = false) {
    this.resolveParts();
    if (!this.trigger || !this.content) return;

    this.isOpen = true;
    setOpen(this.content, [this.trigger, this.el]);
    this.trigger.setAttribute("aria-expanded", "true");

    const side = this.content.dataset.side || "bottom";
    const align = this.content.dataset.align || "center";
    const sideOffset = parseInt(this.content.dataset.sideOffset, 10) || 8;

    positionFloating({
      trigger: this.anchor || this.trigger,
      content: this.content,
      side,
      align,
      sideOffset,
    });

    this.bindCloseButtons();
    this.unbindDismissable();
    this.dismissable = bindDismissableLayer({
      onDismiss: this.onDismiss,
      layers: [this.trigger, this.content, this.anchor].filter(Boolean),
    });

    this.content.addEventListener("keydown", this.onKeyDown);

    if (!isInitial) {
      this.pushOpenChange(true);
      requestAnimationFrame(() => focusFirst(this.content));
    }
  },

  close() {
    if (!this.isOpen) return;
    this.isOpen = false;

    if (this.trigger) {
      this.trigger.setAttribute("aria-expanded", "false");
    }

    setClosed(this.content, {
      extras: [this.trigger, this.el],
      shouldHide: () => !this.isOpen,
    });

    // Fallback when no exit animation is present
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

  bindCloseButtons() {
    if (!this.content) return;
    this.content
      .querySelectorAll("[data-essence-popover-close]")
      .forEach((btn) => {
        btn.removeEventListener("click", this.onCloseClick);
        btn.addEventListener("click", this.onCloseClick);
      });
  },

  unbindDismissable() {
    if (this.dismissable) {
      this.dismissable.unbind();
      this.dismissable = null;
    }
  },

  returnFocus() {
    if (!this.trigger) return;
    const focusable =
      this.trigger.querySelector(
        'button, a, [tabindex]:not([tabindex="-1"])'
      ) || this.trigger;
    focusable.focus();
  },

  pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  },
};
