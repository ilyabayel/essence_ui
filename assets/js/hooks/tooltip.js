import { autoUpdate, computePosition, flip, offset, shift } from "@floating-ui/dom";
import { hasFinePointerHover, whenMouse } from "../lib/pointer";

/**
 * Tooltip Hook - Themes version
 *
 * Shows a tooltip when hovering over a trigger element.
 * On devices without fine pointer hover, also toggles on click/tap.
 * Supports multiple placement options and delay configuration.
 */
const Tooltip = {
  mounted() {
    this.trigger = this.el.querySelector("[data-tooltip-trigger]");
    this.content = this.el.querySelector("[data-tooltip-content]");
    this.arrow = this.el.querySelector("[data-tooltip-arrow]");

    if (!this.trigger || !this.content) return;

    this.openDelay = parseInt(this.el.dataset.openDelay || "700", 10);
    this.closeDelay = parseInt(this.el.dataset.closeDelay || "300", 10);
    this.side = this.el.dataset.side || "top";
    this.align = this.el.dataset.align || "center";
    this.sideOffset = parseInt(this.el.dataset.sideOffset || "5", 10);
    this.openTimeout = null;
    this.closeTimeout = null;
    this.cleanup = null;
    this.isOpen = false;
    this.touchOpen = !hasFinePointerHover();

    this.onTriggerEnter = whenMouse(() => this.show());
    this.onTriggerLeave = whenMouse(() => this.hide());
    this.onContentEnter = whenMouse(() => this.show());
    this.onContentLeave = whenMouse(() => this.hide());
    this.onTriggerClick = (e) => {
      if (!this.touchOpen) return;
      e.preventDefault();
      if (this.isOpen) this.hide(true);
      else this.show(true);
    };
    this.onOutsidePointerDown = (e) => {
      if (!this.touchOpen || !this.isOpen) return;
      if (this.el.contains(e.target)) return;
      this.hide(true);
    };

    this.trigger.addEventListener("mouseenter", this.onTriggerEnter);
    this.trigger.addEventListener("mouseleave", this.onTriggerLeave);
    this.trigger.addEventListener("focus", () => this.show());
    this.trigger.addEventListener("blur", () => this.hide());
    this.content.addEventListener("mouseenter", this.onContentEnter);
    this.content.addEventListener("mouseleave", this.onContentLeave);
    this.trigger.addEventListener("click", this.onTriggerClick);
    document.addEventListener("pointerdown", this.onOutsidePointerDown);

    this.content.style.display = "none";
    this.content.setAttribute("data-state", "closed");
  },

  show(immediate = false) {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }

    if (this.isOpen) return;

    const open = () => {
      this.content.style.display = "block";
      this.content.setAttribute("data-state", "open");
      this.trigger.setAttribute("data-state", "open");
      this.isOpen = true;
      this.openTimeout = null;

      this.updatePosition();

      if (!this.cleanup) {
        this.cleanup = autoUpdate(this.trigger, this.content, () => {
          this.updatePosition();
        });
      }
    };

    if (immediate || this.openDelay === 0) {
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
      this.content.style.display = "none";
      this.content.setAttribute("data-state", "closed");
      this.trigger.setAttribute("data-state", "closed");
      this.isOpen = false;
      this.closeTimeout = null;

      if (this.cleanup) {
        this.cleanup();
        this.cleanup = null;
      }
    };

    if (immediate || this.closeDelay === 0) {
      if (this.closeTimeout) {
        clearTimeout(this.closeTimeout);
        this.closeTimeout = null;
      }
      close();
      return;
    }

    if (!this.closeTimeout) {
      this.closeTimeout = setTimeout(close, this.closeDelay);
    }
  },

  async updatePosition() {
    if (!this.trigger || !this.content) return;

    const middleware = [offset(this.sideOffset), flip(), shift({ padding: 8 })];

    if (this.arrow) {
      const { arrow } = await import("@floating-ui/dom");
      middleware.push(arrow({ element: this.arrow }));
    }

    const { x, y, placement, middlewareData } = await computePosition(this.trigger, this.content, {
      placement: `${this.side}-${this.align === "center" ? "" : this.align}`.replace(/-$/, ""),
      middleware
    });

    Object.assign(this.content.style, {
      left: `${x}px`,
      top: `${y}px`
    });

    this.content.setAttribute("data-side", placement.split("-")[0]);
    this.content.setAttribute("data-align", placement.split("-")[1] || "center");

    if (this.arrow && middlewareData.arrow) {
      const { x: arrowX, y: arrowY } = middlewareData.arrow;
      const staticSide = {
        top: "bottom",
        right: "left",
        bottom: "top",
        left: "right"
      }[placement.split("-")[0]];

      Object.assign(this.arrow.style, {
        left: arrowX != null ? `${arrowX}px` : "",
        top: arrowY != null ? `${arrowY}px` : "",
        right: "",
        bottom: "",
        [staticSide]: "-4px"
      });
    }
  },

  destroyed() {
    if (this.openTimeout) clearTimeout(this.openTimeout);
    if (this.closeTimeout) clearTimeout(this.closeTimeout);
    if (this.cleanup) this.cleanup();
    if (this.trigger && this.onTriggerEnter) {
      this.trigger.removeEventListener("mouseenter", this.onTriggerEnter);
      this.trigger.removeEventListener("mouseleave", this.onTriggerLeave);
      this.trigger.removeEventListener("click", this.onTriggerClick);
    }
    if (this.content && this.onContentEnter) {
      this.content.removeEventListener("mouseenter", this.onContentEnter);
      this.content.removeEventListener("mouseleave", this.onContentLeave);
    }
    if (this.onOutsidePointerDown) {
      document.removeEventListener("pointerdown", this.onOutsidePointerDown);
    }
  }
};

export default Tooltip;
