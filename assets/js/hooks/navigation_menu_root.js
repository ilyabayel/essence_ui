import { setOpen, setClosed } from "../lib/presence";

export const NavigationMenuRoot = {
  mounted() {
    this.activeItem = null;
    this.openTimer = null;
    this.closeTimer = null;

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onTriggerEnter = this.onTriggerEnter.bind(this);
    this.onTriggerLeave = this.onTriggerLeave.bind(this);
    this.onContentEnter = this.onContentEnter.bind(this);
    this.onContentLeave = this.onContentLeave.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onDocumentClick = this.onDocumentClick.bind(this);

    this.bindItems();
    this.el.addEventListener("keydown", this.onKeyDown);
    document.addEventListener("pointerdown", this.onDocumentClick, true);
    this.el.setAttribute("data-hydrated", "");
  },

  updated() {
    this.bindItems();
  },

  destroyed() {
    clearTimeout(this.openTimer);
    clearTimeout(this.closeTimer);
    this.el.removeEventListener("keydown", this.onKeyDown);
    document.removeEventListener("pointerdown", this.onDocumentClick, true);
  },

  delay() {
    return parseInt(this.el.dataset.delayDuration, 10) || 200;
  },

  getItems() {
    return Array.from(
      this.el.querySelectorAll("[data-essence-navigation-menu-item]")
    );
  },

  bindItems() {
    this.getItems().forEach((item) => {
      const trigger = item.querySelector(
        "[data-essence-navigation-menu-trigger]"
      );
      const content = this.resolveContent(item);
      if (!trigger) return;

      if (!trigger.hasAttribute("data-nav-bound")) {
        trigger.setAttribute("data-nav-bound", "true");
        trigger.addEventListener("click", this.onTriggerClick);
        trigger.addEventListener("pointerenter", this.onTriggerEnter);
        trigger.addEventListener("pointerleave", this.onTriggerLeave);
      }

      if (content && !content.hasAttribute("data-nav-bound")) {
        content.setAttribute("data-nav-bound", "true");
        content.addEventListener("pointerenter", this.onContentEnter);
        content.addEventListener("pointerleave", this.onContentLeave);
      }
    });
  },

  resolveContent(item) {
    const trigger = item.querySelector(
      "[data-essence-navigation-menu-trigger]"
    );
    const contentId = trigger?.getAttribute("aria-controls");
    const local = item.querySelector("[data-essence-navigation-menu-content]");
    if (local) return local;
    if (contentId) return document.getElementById(contentId);
    return null;
  },

  onTriggerClick(e) {
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    const item = trigger.closest("[data-essence-navigation-menu-item]");
    if (this.activeItem === item) {
      this.close();
    } else {
      this.open(item);
    }
  },

  onTriggerEnter(e) {
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    const item = trigger.closest("[data-essence-navigation-menu-item]");
    clearTimeout(this.closeTimer);
    clearTimeout(this.openTimer);
    this.openTimer = setTimeout(() => this.open(item), this.delay());
  },

  onTriggerLeave() {
    clearTimeout(this.openTimer);
    this.scheduleClose();
  },

  onContentEnter() {
    clearTimeout(this.closeTimer);
  },

  onContentLeave() {
    this.scheduleClose();
  },

  scheduleClose() {
    clearTimeout(this.closeTimer);
    this.closeTimer = setTimeout(() => this.close(), this.delay());
  },

  onDocumentClick(e) {
    if (!this.activeItem) return;
    if (this.el.contains(e.target)) return;
    this.close();
  },

  onKeyDown(e) {
    if (e.key === "Escape" && this.activeItem) {
      e.preventDefault();
      const trigger = this.activeItem.querySelector(
        "[data-essence-navigation-menu-trigger]"
      );
      this.close();
      trigger?.focus();
    }
  },

  open(item) {
    if (!item) return;
    if (this.activeItem && this.activeItem !== item) {
      this.hideItem(this.activeItem);
    }

    this.activeItem = item;
    const trigger = item.querySelector(
      "[data-essence-navigation-menu-trigger]"
    );
    const content = this.resolveContent(item);
    const viewport = this.el.querySelector(
      "[data-essence-navigation-menu-viewport]"
    );
    const indicator = this.el.querySelector(
      "[data-essence-navigation-menu-indicator]"
    );

    if (trigger) {
      trigger.setAttribute("aria-expanded", "true");
      trigger.dataset.state = "open";
    }

    if (content) {
      setOpen(content);
      content.style.display = "";
      content.hidden = false;
    }

    if (viewport) {
      viewport.dataset.state = "open";
      if (content && viewport !== content.parentElement) {
        // Keep content in place; viewport is optional animation shell
      }
    }

    if (indicator) {
      indicator.dataset.state = "visible";
      this.positionIndicator(indicator, trigger);
    }
  },

  close() {
    if (!this.activeItem) return;
    this.hideItem(this.activeItem);
    this.activeItem = null;

    const viewport = this.el.querySelector(
      "[data-essence-navigation-menu-viewport]"
    );
    const indicator = this.el.querySelector(
      "[data-essence-navigation-menu-indicator]"
    );
    if (viewport) viewport.dataset.state = "closed";
    if (indicator) indicator.dataset.state = "hidden";
  },

  hideItem(item) {
    const trigger = item.querySelector(
      "[data-essence-navigation-menu-trigger]"
    );
    const content = this.resolveContent(item);

    if (trigger) {
      trigger.setAttribute("aria-expanded", "false");
      trigger.dataset.state = "closed";
    }

    if (content) {
      setClosed(content, { waitForAnimation: false });
    }
  },

  positionIndicator(indicator, trigger) {
    if (!indicator || !trigger) return;
    const rootRect = this.el.getBoundingClientRect();
    const triggerRect = trigger.getBoundingClientRect();
    indicator.style.position = "absolute";
    indicator.style.left = `${triggerRect.left - rootRect.left}px`;
    indicator.style.width = `${triggerRect.width}px`;
  },
};
