import { setOpen, setClosed } from "../lib/presence";
import { focusFirst, getFocusableElements } from "../lib/focus_scope";
import { whenMouse } from "../lib/pointer";

export const NavigationMenuRoot = {
  mounted() {
    this.activeItem = null;
    this.openTimer = null;
    this.closeTimer = null;

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onTriggerEnter = whenMouse(this.onTriggerEnter.bind(this));
    this.onTriggerLeave = whenMouse(this.onTriggerLeave.bind(this));
    this.onContentEnter = whenMouse(this.onContentEnter.bind(this));
    this.onContentLeave = whenMouse(this.onContentLeave.bind(this));
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

  /** Top-level triggers/links in visual list order (excludes in-content links). */
  getTabStops() {
    const list = this.el.querySelector("[data-essence-navigation-menu-list]");
    if (!list) return [];
    return Array.from(list.children).flatMap((item) => {
      if (!item.hasAttribute("data-essence-navigation-menu-item")) return [];
      const stop =
        item.querySelector(":scope > [data-essence-navigation-menu-trigger]") ||
        item.querySelector(":scope > [data-essence-navigation-menu-link]");
      return stop ? [stop] : [];
    });
  },

  getNextTabStop(fromItem) {
    const stops = this.getTabStops();
    const current =
      fromItem.querySelector(":scope > [data-essence-navigation-menu-trigger]") ||
      fromItem.querySelector(":scope > [data-essence-navigation-menu-link]");
    const idx = stops.indexOf(current);
    return idx >= 0 ? stops[idx + 1] || null : null;
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
        // Hover intent is mouse-only; touch uses click.
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

  rememberContentHome(content) {
    if (!content || content._navHome) return;
    content._navHome = {
      parent: content.parentElement,
      nextSibling: content.nextSibling,
    };
  },

  restoreContentHome(content) {
    const home = content?._navHome;
    if (!home?.parent) return;
    if (home.nextSibling?.parentElement === home.parent) {
      home.parent.insertBefore(content, home.nextSibling);
    } else {
      home.parent.appendChild(content);
    }
  },

  mountContentInViewport(content, viewport) {
    if (!content || !viewport) return;
    this.rememberContentHome(content);
    if (content.parentElement !== viewport) {
      viewport.appendChild(content);
    }
    const width = content.offsetWidth;
    const height = content.offsetHeight;
    this.el.style.setProperty(
      "--essence-navigation-menu-viewport-width",
      `${width}px`
    );
    this.el.style.setProperty(
      "--essence-navigation-menu-viewport-height",
      `${height}px`
    );
    this.el.style.setProperty(
      "--radix-navigation-menu-viewport-width",
      `${width}px`
    );
    this.el.style.setProperty(
      "--radix-navigation-menu-viewport-height",
      `${height}px`
    );
  },

  onTriggerClick(e) {
    const trigger = e.currentTarget;
    if (trigger.hasAttribute("data-disabled")) return;
    clearTimeout(this.openTimer);
    clearTimeout(this.closeTimer);
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
      return;
    }

    if (e.key === "Tab" && this.activeItem) {
      const content = this.resolveContent(this.activeItem);
      const focusables = getFocusableElements(content);
      const active = document.activeElement;
      const trigger = this.activeItem.querySelector(
        "[data-essence-navigation-menu-trigger]"
      );
      const inContent = !!(content && active && content.contains(active));

      if (inContent && focusables.length) {
        const idx = focusables.indexOf(active);
        if (!e.shiftKey && idx === focusables.length - 1) {
          e.preventDefault();
          const next = this.getNextTabStop(this.activeItem);
          this.close();
          next?.focus();
          return;
        }
        if (e.shiftKey && idx === 0) {
          e.preventDefault();
          trigger?.focus();
          return;
        }
      }

      if (!e.shiftKey && active === trigger && focusables.length) {
        e.preventDefault();
        focusFirst(content);
        return;
      }
    }

    const trigger = e.target.closest?.(
      "[data-essence-navigation-menu-trigger]"
    );
    if (!trigger || !this.el.contains(trigger)) return;

    const item = trigger.closest("[data-essence-navigation-menu-item]");
    const content = this.resolveContent(item);
    if (!content) return;

    if (e.key === "ArrowDown") {
      e.preventDefault();
      if (this.activeItem !== item) this.open(item);
      focusFirst(this.resolveContent(item));
    }
  },

  getMotionPair(fromItem, toItem) {
    const items = this.getItems();
    const fromIdx = items.indexOf(fromItem);
    const toIdx = items.indexOf(toItem);
    if (fromIdx < 0 || toIdx < 0 || fromIdx === toIdx) return null;
    const movingForward = toIdx > fromIdx;
    const rtl = (this.el.getAttribute("dir") || "ltr") === "rtl";
    const forward = rtl ? !movingForward : movingForward;
    return {
      exit: forward ? "to-start" : "to-end",
      enter: forward ? "from-end" : "from-start",
    };
  },

  open(item) {
    if (!item) return;

    const prev = this.activeItem;
    const motion = prev && prev !== item ? this.getMotionPair(prev, item) : null;

    if (prev && prev !== item) {
      this.hideItem(prev, { motion: motion?.exit });
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
      content.removeAttribute("data-motion");
      if (motion?.enter) {
        // Restart CSS animation when remounting the same motion value.
        void content.offsetWidth;
        content.dataset.motion = motion.enter;
      }
    }

    if (viewport) {
      viewport.style.display = "";
      viewport.dataset.state = "open";
      if (content) {
        this.mountContentInViewport(content, viewport);
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
    if (viewport) {
      viewport.dataset.state = "closed";
      // Collapse shell: content is already restored home; size vars alone still
      // leave a visible panel because width/height transition over 300ms and
      // scaleOut has no fill-mode: forwards.
      this.el.style.setProperty(
        "--essence-navigation-menu-viewport-width",
        "0px"
      );
      this.el.style.setProperty(
        "--essence-navigation-menu-viewport-height",
        "0px"
      );
      this.el.style.setProperty(
        "--radix-navigation-menu-viewport-width",
        "0px"
      );
      this.el.style.setProperty(
        "--radix-navigation-menu-viewport-height",
        "0px"
      );
      viewport.style.display = "none";
    }
    if (indicator) {
      indicator.dataset.state = "hidden";
      indicator.style.display = "none";
    }
  },

  hideItem(item, { motion } = {}) {
    const trigger = item.querySelector(
      "[data-essence-navigation-menu-trigger]"
    );
    const content = this.resolveContent(item);

    if (trigger) {
      trigger.setAttribute("aria-expanded", "false");
      trigger.dataset.state = "closed";
    }

    if (!content) return;

    const token = Symbol();
    content._navExitToken = token;

    const finish = () => {
      if (content._navExitToken !== token) return;
      content.removeAttribute("data-motion");
      setClosed(content, { waitForAnimation: false });
      this.restoreContentHome(content);
    };

    if (motion) {
      // Keep content in the viewport so exit slides overlap the enter slide.
      content.dataset.state = "closed";
      content.removeAttribute("data-motion");
      void content.offsetWidth;
      content.dataset.motion = motion;
      content.addEventListener("animationend", finish, { once: true });
      setTimeout(finish, 280);
      return;
    }

    content.removeAttribute("data-motion");
    setClosed(content, { waitForAnimation: false });
    this.restoreContentHome(content);
  },

  positionIndicator(indicator, trigger) {
    if (!indicator || !trigger) return;
    indicator.style.display = "";
    indicator.style.transition = "left 250ms ease, width 250ms ease";
    const rootRect = this.el.getBoundingClientRect();
    const triggerRect = trigger.getBoundingClientRect();
    indicator.style.position = "absolute";
    indicator.style.left = `${triggerRect.left - rootRect.left}px`;
    indicator.style.width = `${triggerRect.width}px`;
  },
};
