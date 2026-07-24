import { trapFocus, focusFirst } from "../lib/focus_scope.js";

const DIALOG_SELECTORS = {
  trigger: "[data-essence-dialog-trigger]",
  overlay: "[data-essence-dialog-overlay]",
  content: "[data-essence-dialog-content]",
  close: "[data-essence-dialog-close]",
};

const ALERT_DIALOG_SELECTORS = {
  trigger: "[data-essence-alert-dialog-trigger]",
  overlay: "[data-essence-alert-dialog-overlay]",
  content: "[data-essence-alert-dialog-content]",
  close: "[data-essence-alert-dialog-cancel], [data-essence-alert-dialog-action]",
};

function createDialogRoot({ selectors, closeOnOverlayDefault = true } = {}) {
  return {
    mounted() {
      this.selectors = selectors;
      this.closeOnOverlay =
        this.el.dataset.closeOnOverlay !== undefined
          ? this.el.dataset.closeOnOverlay !== "false"
          : closeOnOverlayDefault;
      this.modal = this.el.dataset.modal !== "false";
      this.previousFocus = null;

      this.onTriggerClick = this.onTriggerClick.bind(this);
      this.onCloseClick = this.onCloseClick.bind(this);
      this.onOverlayClick = this.onOverlayClick.bind(this);
      this.onDocumentKeyDown = this.onDocumentKeyDown.bind(this);

      this.resolveParts();
      this.bindStaticListeners();

      if (this.el.dataset.state === "open") {
        this.open(true);
      } else {
        this.applyClosedUI(true);
      }
      this.el.setAttribute("data-hydrated", "");
    },

    updated() {
      this.resolveParts();
      this.bindStaticListeners();

      const shouldBeOpen = this.el.dataset.state === "open";
      const isOpen = this.content && !this.content.hidden;
      if (shouldBeOpen && !isOpen) {
        this.open(true);
      } else if (!shouldBeOpen && isOpen) {
        this.close();
      }
    },

    destroyed() {
      this.unbindOpenListeners();
      this.trigger?.removeEventListener("click", this.onTriggerClick);
      this.overlay?.removeEventListener("click", this.onOverlayClick);
      this.closeButtons?.forEach((btn) => {
        btn.removeEventListener("click", this.onCloseClick);
      });
    },

    resolveParts() {
      this.trigger = this.el.querySelector(this.selectors.trigger);

      const portalTpl = this.el.querySelector("template[data-phx-portal]");
      let scope = this.el;

      if (portalTpl?.id) {
        const teleported = document.querySelector(
          `[data-phx-teleported-src="${portalTpl.id}"]`
        );
        if (teleported) {
          scope = teleported;
        }
      }

      this.overlay =
        scope.querySelector(this.selectors.overlay) ||
        this.el.querySelector(this.selectors.overlay);
      this.content =
        scope.querySelector(this.selectors.content) ||
        this.el.querySelector(this.selectors.content);

      const closeRoot = this.content || this.el;
      this.closeButtons = Array.from(closeRoot.querySelectorAll(this.selectors.close));
    },

    bindStaticListeners() {
      this.trigger?.removeEventListener("click", this.onTriggerClick);
      this.trigger?.addEventListener("click", this.onTriggerClick);

      this.overlay?.removeEventListener("click", this.onOverlayClick);
      this.overlay?.addEventListener("click", this.onOverlayClick);

      this.closeButtons?.forEach((btn) => {
        btn.removeEventListener("click", this.onCloseClick);
        btn.addEventListener("click", this.onCloseClick);
      });
    },

    onTriggerClick(e) {
      e.preventDefault();
      if (this.el.dataset.state === "open") {
        this.close();
      } else {
        this.open();
      }
    },

    onCloseClick(e) {
      e.preventDefault();
      this.close();
    },

    onOverlayClick(e) {
      if (!this.closeOnOverlay) return;
      if (e.target === this.overlay) {
        this.close();
      }
    },

    onDocumentKeyDown(e) {
      if (e.key === "Escape") {
        e.preventDefault();
        this.close();
        return;
      }

      if (this.modal && this.content) {
        trapFocus(e, this.content);
      }
    },

    open(isInitial = false) {
      this.resolveParts();
      this.previousFocus = document.activeElement;

      this.el.dataset.state = "open";
      if (this.trigger) {
        this.trigger.dataset.state = "open";
        this.trigger.setAttribute("aria-expanded", "true");
      }
      if (this.overlay) {
        this.overlay.hidden = false;
        this.overlay.dataset.state = "open";
      }
      if (this.content) {
        this.content.hidden = false;
        this.content.dataset.state = "open";
      }

      this.bindOpenListeners();

      if (!isInitial) this.pushOpenChange(true);

      requestAnimationFrame(() => {
        if (this.content) focusFirst(this.content);
      });
    },

    close() {
      if (this.el.dataset.state === "closed") return;

      this.el.dataset.state = "closed";
      this.pushOpenChange(false);
      this.applyClosedUI();
      this.unbindOpenListeners();
      this.returnFocus();
    },

    applyClosedUI(immediate = false) {
      if (this.trigger) {
        this.trigger.dataset.state = "closed";
        this.trigger.setAttribute("aria-expanded", "false");
      }

      [this.overlay, this.content].forEach((el) => {
        if (!el) return;
        el.dataset.state = "closed";

        if (immediate) {
          el.hidden = true;
          return;
        }

        let settled = false;
        const settle = () => {
          if (settled || this.el.dataset.state !== "closed") return;
          settled = true;
          el.hidden = true;
          el.removeEventListener("animationend", onEnd);
          el.removeEventListener("transitionend", onEnd);
        };

        const onEnd = (e) => {
          if (e.target !== el) return;
          settle();
        };
        el.addEventListener("animationend", onEnd);
        el.addEventListener("transitionend", onEnd);

        // Fallback: open animations leave animation-name set, so animationend
        // may not fire again on close when no close animation is defined.
        setTimeout(settle, 200);
      });
    },

    bindOpenListeners() {
      document.addEventListener("keydown", this.onDocumentKeyDown);
    },

    unbindOpenListeners() {
      document.removeEventListener("keydown", this.onDocumentKeyDown);
    },

    returnFocus() {
      if (this.previousFocus && typeof this.previousFocus.focus === "function") {
        this.previousFocus.focus();
      } else {
        this.trigger?.focus();
      }
    },

    pushOpenChange(open) {
      const event = this.el.dataset.onOpenChange;
      if (event) this.pushEvent(event, { open });
    },
  };
}

export const DialogRoot = createDialogRoot({
  selectors: DIALOG_SELECTORS,
  closeOnOverlayDefault: true,
});

export const AlertDialogRoot = createDialogRoot({
  selectors: ALERT_DIALOG_SELECTORS,
  closeOnOverlayDefault: false,
});
