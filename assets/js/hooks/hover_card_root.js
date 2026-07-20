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

export const HoverCardRoot = {
  mounted() {
    this.openDelay = parseInt(this.el.dataset.openDelay, 10) || 200;
    this.closeDelay = parseInt(this.el.dataset.closeDelay, 10) || 150;
    this.openTimeout = null;
    this.closeTimeout = null;
    this.isOpen = false;

    this.onTriggerEnter = this.onTriggerEnter.bind(this);
    this.onTriggerLeave = this.onTriggerLeave.bind(this);
    this.onContentEnter = this.onContentEnter.bind(this);
    this.onContentLeave = this.onContentLeave.bind(this);

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

    this.trigger.addEventListener("mouseenter", this.onTriggerEnter);
    this.trigger.addEventListener("mouseleave", this.onTriggerLeave);
    this.content.addEventListener("mouseenter", this.onContentEnter);
    this.content.addEventListener("mouseleave", this.onContentLeave);
    this._bound = true;
  },

  unbindEvents() {
    if (!this._bound) return;
    this.trigger?.removeEventListener("mouseenter", this.onTriggerEnter);
    this.trigger?.removeEventListener("mouseleave", this.onTriggerLeave);
    this.content?.removeEventListener("mouseenter", this.onContentEnter);
    this.content?.removeEventListener("mouseleave", this.onContentLeave);
    this._bound = false;
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

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.isOpen || this.closeTimeout) return;

    this.closeTimeout = setTimeout(() => {
      this.isOpen = false;
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
