import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { whenMouse } from "../lib/pointer";

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

export const HoverCardRoot = {
  mounted() {
    this.openDelay = parseInt(this.el.dataset.openDelay, 10) || 200;
    this.closeDelay = parseInt(this.el.dataset.closeDelay, 10) || 150;
    this.openTimeout = null;
    this.closeTimeout = null;
    this.isOpen = false;
    this._raf = null;

    this.onTriggerEnter = whenMouse(this.onTriggerEnter.bind(this));
    this.onTriggerLeave = whenMouse(this.onTriggerLeave.bind(this));
    this.onContentEnter = whenMouse(this.onContentEnter.bind(this));
    this.onContentLeave = whenMouse(this.onContentLeave.bind(this));
    this.scheduleUpdate = this.scheduleUpdate.bind(this);

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
    this.unbindPositionUpdates();
  },

  resolveParts() {
    this.trigger = this.el.querySelector("[data-essence-hover-card-trigger]");
    const contentId = this.trigger?.getAttribute("aria-describedby");
    this.content = findPart(
      this.el,
      "[data-essence-hover-card-content]",
      contentId
    );
  },

  bindEvents() {
    this.unbindEvents();
    if (!this.trigger || !this.content) return;

    // Radix excludeTouch: hover intent is mouse-only. Use Popover for tap.
    this.trigger.addEventListener("pointerenter", this.onTriggerEnter);
    this.trigger.addEventListener("pointerleave", this.onTriggerLeave);
    this.content.addEventListener("pointerenter", this.onContentEnter);
    this.content.addEventListener("pointerleave", this.onContentLeave);
    this._bound = true;
  },

  unbindEvents() {
    if (!this._bound) return;
    this.trigger?.removeEventListener("pointerenter", this.onTriggerEnter);
    this.trigger?.removeEventListener("pointerleave", this.onTriggerLeave);
    this.content?.removeEventListener("pointerenter", this.onContentEnter);
    this.content?.removeEventListener("pointerleave", this.onContentLeave);
    this._bound = false;
  },

  updatePosition() {
    if (!this.isOpen || !this.trigger || !this.content) return;

    const side = this.content.dataset.side || "bottom";
    const align = this.content.dataset.align || "center";
    const sideOffset = parseInt(this.content.dataset.sideOffset, 10) || 8;

    positionFloating({
      trigger: this.trigger,
      content: this.content,
      side,
      align,
      sideOffset,
    });
  },

  scheduleUpdate() {
    if (this._raf != null) return;
    this._raf = requestAnimationFrame(() => {
      this._raf = null;
      this.updatePosition();
    });
  },

  bindPositionUpdates() {
    if (this._positionBound) return;
    document.addEventListener("scroll", this.scheduleUpdate, true);
    window.addEventListener("resize", this.scheduleUpdate);
    this._positionBound = true;
  },

  unbindPositionUpdates() {
    if (this._raf != null) {
      cancelAnimationFrame(this._raf);
      this._raf = null;
    }
    if (!this._positionBound) return;
    document.removeEventListener("scroll", this.scheduleUpdate, true);
    window.removeEventListener("resize", this.scheduleUpdate);
    this._positionBound = false;
  },

  onTriggerEnter() {
    this.show();
  },

  onTriggerLeave() {
    this.hide();
  },

  onContentEnter() {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }
  },

  onContentLeave() {
    this.hide();
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

      this.isOpen = true;
      this.updatePosition();
      this.bindPositionUpdates();
      this.openTimeout = null;
      if (!immediate) this.pushOpenChange(true);
    };

    if (immediate) {
      open();
      return;
    }

    this.openTimeout = setTimeout(open, this.openDelay);
  },

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.isOpen || this.closeTimeout) return;

    this.closeTimeout = setTimeout(() => {
      this.isOpen = false;
      this.unbindPositionUpdates();
      setClosed(this.content, {
        extras: [this.trigger, this.el],
        waitForAnimation: false,
        shouldHide: () => !this.isOpen,
      });
      this.closeTimeout = null;
      this.pushOpenChange(false);
    }, this.closeDelay);
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
