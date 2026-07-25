import { positionFloating } from "../lib/position";
import { setOpen, setClosed } from "../lib/presence";
import { hasFinePointerHover, whenMouse } from "../lib/pointer";

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
    this._touchOpen = !hasFinePointerHover();

    this.onTriggerEnter = whenMouse(this.onTriggerEnter.bind(this));
    this.onTriggerLeave = whenMouse(this.onTriggerLeave.bind(this));
    this.onContentEnter = whenMouse(this.onContentEnter.bind(this));
    this.onContentLeave = whenMouse(this.onContentLeave.bind(this));
    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onDocumentPointerDown = this.onDocumentPointerDown.bind(this);
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

    // Hover intent is mouse-only; on coarse pointers, click toggles open.
    this.trigger.addEventListener("pointerenter", this.onTriggerEnter);
    this.trigger.addEventListener("pointerleave", this.onTriggerLeave);
    this.content.addEventListener("pointerenter", this.onContentEnter);
    this.content.addEventListener("pointerleave", this.onContentLeave);
    if (this._touchOpen) {
      this.trigger.addEventListener("click", this.onTriggerClick);
      document.addEventListener("pointerdown", this.onDocumentPointerDown, true);
    }
    this._bound = true;
  },

  unbindEvents() {
    if (!this._bound) return;
    this.trigger?.removeEventListener("pointerenter", this.onTriggerEnter);
    this.trigger?.removeEventListener("pointerleave", this.onTriggerLeave);
    this.content?.removeEventListener("pointerenter", this.onContentEnter);
    this.content?.removeEventListener("pointerleave", this.onContentLeave);
    this.trigger?.removeEventListener("click", this.onTriggerClick);
    document.removeEventListener("pointerdown", this.onDocumentPointerDown, true);
    this._bound = false;
  },

  onTriggerClick(e) {
    e.preventDefault();
    e.stopPropagation();
    if (this.isOpen) {
      this.closeNow();
    } else {
      this.show(true);
    }
  },

  onDocumentPointerDown(e) {
    if (!this.isOpen) return;
    if (this.trigger?.contains(e.target) || this.content?.contains(e.target)) {
      return;
    }
    this.closeNow();
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

    if (this.isOpen) return;

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

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.isOpen || this.closeTimeout) return;

    this.closeTimeout = setTimeout(() => {
      this.closeNow();
    }, this.closeDelay);
  },

  closeNow() {
    this.clearTimers();
    if (!this.isOpen) return;
    this.isOpen = false;
    this.unbindPositionUpdates();
    setClosed(this.content, {
      extras: [this.trigger, this.el],
      waitForAnimation: false,
      shouldHide: () => !this.isOpen,
    });
    this.pushOpenChange(false);
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
