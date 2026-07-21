import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";

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

export const TooltipRoot = {
  mounted() {
    const provider = this.el.closest("[data-essence-tooltip-provider]");
    const providerDelay = provider
      ? parseInt(provider.dataset.delayDuration, 10)
      : null;

    const openDelayAttr = this.el.dataset.openDelay;
    this.openDelay =
      openDelayAttr !== undefined && openDelayAttr !== ""
        ? parseInt(openDelayAttr, 10)
        : providerDelay || 700;
    this.closeDelay = parseInt(this.el.dataset.closeDelay, 10) || 0;

    this.openTimeout = null;
    this.closeTimeout = null;
    this.isOpen = false;

    this.onTriggerEnter = this.onTriggerEnter.bind(this);
    this.onTriggerLeave = this.onTriggerLeave.bind(this);
    this.onFocusIn = this.onFocusIn.bind(this);
    this.onFocusOut = this.onFocusOut.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);

    this.resolveParts();
    this.bindEvents();

    if (this.el.dataset.state === "open") {
      this.show(true);
    }
  },

  updated() {
    this.resolveParts();
    this.bindEvents();
  },

  destroyed() {
    this.clearTimers();
    this.unbindEvents();
  },

  resolveParts() {
    this.trigger = this.el.querySelector("[data-essence-tooltip-trigger]");
    const contentId = this.trigger?.getAttribute("aria-describedby");
    this.content = findPart(
      this.el,
      "[data-essence-tooltip-content]",
      contentId
    );
  },

  bindEvents() {
    this.unbindEvents();
    if (!this.trigger) return;

    this.trigger.addEventListener("mouseenter", this.onTriggerEnter);
    this.trigger.addEventListener("mouseleave", this.onTriggerLeave);
    this.trigger.addEventListener("focusin", this.onFocusIn);
    this.trigger.addEventListener("focusout", this.onFocusOut);
    this.trigger.addEventListener("keydown", this.onKeyDown);
    this._bound = true;
  },

  unbindEvents() {
    if (!this._bound) return;
    this.trigger?.removeEventListener("mouseenter", this.onTriggerEnter);
    this.trigger?.removeEventListener("mouseleave", this.onTriggerLeave);
    this.trigger?.removeEventListener("focusin", this.onFocusIn);
    this.trigger?.removeEventListener("focusout", this.onFocusOut);
    this.trigger?.removeEventListener("keydown", this.onKeyDown);
    this._bound = false;
  },

  onTriggerEnter() {
    this.show();
  },

  onTriggerLeave() {
    this.hide();
  },

  onFocusIn() {
    this.show();
  },

  onFocusOut() {
    this.hide();
  },

  onKeyDown(e) {
    if (e.key === "Escape" && this.isOpen) {
      this.hide(true);
    }
  },

  show(immediate = false) {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }

    if (this.isOpen || this.openTimeout) return;

    const open = () => {
      this.resolveParts();
      if (!this.trigger || !this.content) return;

      setOpen(this.content, [this.trigger, this.el]);
      this.content.style.display = "block";
      this.content.style.width = "max-content";
      this.content.dataset.state = "delayed-open";

      const side = this.content.dataset.side || "top";
      const align = this.content.dataset.align || "center";
      const sideOffset = parseInt(this.content.dataset.sideOffset, 10) || 4;

      positionFloating({
        trigger: this.trigger,
        content: this.content,
        side,
        align,
        sideOffset,
      });

      this.isOpen = true;
      this.openTimeout = null;
      if (!immediate) this.pushOpenChange(true);
    };

    if (immediate) {
      open();
      return;
    }

    this.openTimeout = setTimeout(open, this.openDelay);
  },

  hide(immediate = false) {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.isOpen) return;

    const close = () => {
      this.isOpen = false;
      setClosed(this.content, {
        extras: [this.trigger, this.el],
        waitForAnimation: false,
        shouldHide: () => !this.isOpen,
      });
      this.closeTimeout = null;
      this.pushOpenChange(false);
    };

    if (immediate || this.closeDelay <= 0) {
      close();
      return;
    }

    if (!this.closeTimeout) {
      this.closeTimeout = setTimeout(close, this.closeDelay);
    }
  },

  clearTimers() {
    if (this.openTimeout) clearTimeout(this.openTimeout);
    if (this.closeTimeout) clearTimeout(this.closeTimeout);
    this.openTimeout = null;
    this.closeTimeout = null;
  },

  pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  },
};
