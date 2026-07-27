import { positionFloating, positionArrow } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { hasFinePointerHover, whenMouse } from "../lib/pointer";
import { applyPortalTheme } from "../lib/theme";

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
    const provider = this.el.closest("[data-radix-tooltip-provider]");
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
    this._touchOpen = !hasFinePointerHover();

    this.onTriggerEnter = whenMouse(this.onTriggerEnter.bind(this));
    this.onTriggerLeave = whenMouse(this.onTriggerLeave.bind(this));
    this.onFocusIn = this.onFocusIn.bind(this);
    this.onFocusOut = this.onFocusOut.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onDocumentPointerDown = this.onDocumentPointerDown.bind(this);

    this.resolveParts();
    this.bindEvents();

    if (this.el.dataset.state === "open") {
      this.show(true);
    }
    this.el.setAttribute("data-hydrated", "");
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
    this.trigger = this.el.querySelector("[data-radix-tooltip-trigger]");
    const contentId = this.trigger?.getAttribute("aria-describedby");
    this.content = findPart(
      this.el,
      "[data-radix-tooltip-content]",
      contentId
    );
  },

  bindEvents() {
    this.unbindEvents();
    if (!this.trigger) return;

    // Focus opens for keyboard. Fine pointer: mouse hover. Coarse: click toggle only.
    this.trigger.addEventListener("focusin", this.onFocusIn);
    this.trigger.addEventListener("focusout", this.onFocusOut);
    this.trigger.addEventListener("keydown", this.onKeyDown);
    if (this._touchOpen) {
      this.trigger.addEventListener("click", this.onTriggerClick);
      document.addEventListener("pointerdown", this.onDocumentPointerDown, true);
    } else {
      this.trigger.addEventListener("pointerenter", this.onTriggerEnter);
      this.trigger.addEventListener("pointerleave", this.onTriggerLeave);
    }
    this._bound = true;
  },

  unbindEvents() {
    if (!this._bound) return;
    this.trigger?.removeEventListener("pointerenter", this.onTriggerEnter);
    this.trigger?.removeEventListener("pointerleave", this.onTriggerLeave);
    this.trigger?.removeEventListener("focusin", this.onFocusIn);
    this.trigger?.removeEventListener("focusout", this.onFocusOut);
    this.trigger?.removeEventListener("keydown", this.onKeyDown);
    this.trigger?.removeEventListener("click", this.onTriggerClick);
    document.removeEventListener("pointerdown", this.onDocumentPointerDown, true);
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

  onTriggerClick(e) {
    e.preventDefault();
    e.stopPropagation();
    if (this.isOpen) {
      this.hide(true);
    } else {
      this.show(true);
    }
  },

  onDocumentPointerDown(e) {
    if (!this.isOpen) return;
    if (this.trigger?.contains(e.target) || this.content?.contains(e.target)) {
      return;
    }
    this.hide(true);
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

    if (this.isOpen) return;

    const open = () => {
      this.resolveParts();
      if (!this.trigger || !this.content) return;

      applyPortalTheme(this.content, this.trigger);
      setOpen(this.content, [this.trigger, this.el]);
      this.content.style.display = "block";
      this.content.style.width = "max-content";
      this.content.dataset.state = "delayed-open";

      const side = this.content.dataset.side || "top";
      const align = this.content.dataset.align || "center";
      const sideOffset = parseInt(this.content.dataset.sideOffset, 10) || 4;
      // Popper: offset mainAxis = sideOffset + arrowHeight
      const arrow = this.content.querySelector("[data-radix-tooltip-arrow]");
      const arrowHeight = arrow ? arrow.offsetHeight || 5 : 0;

      positionFloating({
        trigger: this.trigger,
        content: this.content,
        side,
        align,
        sideOffset: sideOffset + arrowHeight,
      });

      positionArrow({
        content: this.content,
        arrowSelector: "[data-radix-tooltip-arrow]",
        side,
        align,
      });

      this.isOpen = true;
      this.openTimeout = null;
      if (!immediate) this.pushOpenChange(true);
    };

    if (immediate) {
      if (this.openTimeout) {
        clearTimeout(this.openTimeout);
        this.openTimeout = null;
      }
      open();
      return;
    }

    if (this.openTimeout) return;
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
