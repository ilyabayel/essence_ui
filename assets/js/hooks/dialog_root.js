import { focusFirst } from "../lib/focus_scope.js";
import { activateModalLayer } from "../lib/modal_layer.js";

const DIALOG_SELECTORS = {
  trigger: "[data-radix-dialog-trigger]",
  overlay: "[data-radix-dialog-overlay]",
  content: "[data-radix-dialog-content]",
  close: "[data-radix-dialog-close]",
  title: "[data-radix-dialog-title]",
  description: "[data-radix-dialog-description]",
};

const ALERT_DIALOG_SELECTORS = {
  trigger: "[data-radix-alert-dialog-trigger]",
  overlay: "[data-radix-alert-dialog-overlay]",
  content: "[data-radix-alert-dialog-content]",
  close: "[data-radix-alert-dialog-cancel], [data-radix-alert-dialog-action]",
  cancel: "[data-radix-alert-dialog-cancel]",
  title: "[data-radix-alert-dialog-title]",
  description: "[data-radix-alert-dialog-description]",
};

let bodyScrollLocks = 0;
let bodyOverflowBeforeLock = "";

function lockBodyScroll() {
  if (bodyScrollLocks === 0) {
    bodyOverflowBeforeLock = document.body.style.overflow;
    document.body.style.overflow = "hidden";
  }
  bodyScrollLocks += 1;
}

function unlockBodyScroll() {
  if (bodyScrollLocks === 0) return;
  bodyScrollLocks -= 1;
  if (bodyScrollLocks === 0) {
    document.body.style.overflow = bodyOverflowBeforeLock;
  }
}

function createDialogRoot({
  selectors,
  closeOnOverlayDefault = true,
  focusCancel = false,
} = {}) {
  return {
    mounted() {
      this.selectors = selectors;
      this.focusCancel = focusCancel;
      this.closeOnOverlay =
        this.el.dataset.closeOnOverlay !== undefined
          ? this.el.dataset.closeOnOverlay !== "false"
          : closeOnOverlayDefault;
      this.modal = this.el.dataset.modal !== "false";
      this.scrollLocked = false;
      this.previousFocus = null;
      this.modalLayer = null;

      this.onTriggerClick = this.onTriggerClick.bind(this);
      this.onCloseClick = this.onCloseClick.bind(this);
      this.onOverlayClick = this.onOverlayClick.bind(this);
      this.onDocumentKeyDown = this.onDocumentKeyDown.bind(this);
      this.onOpenEvent = () => this.open();
      this.onCloseEvent = () => this.close();

      this.resolveParts();
      this.bindStaticListeners();
      this.el.addEventListener("open", this.onOpenEvent);
      this.el.addEventListener("close", this.onCloseEvent);

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
      this.syncModalAttributes();
      if (this.el.dataset.state === "open") {
        this.lockScroll();
        if (this.modal) this.modalLayer?.sync();
      } else {
        this.unlockScroll();
        this.releaseModalLayer();
      }
    },

    destroyed() {
      this.unlockScroll();
      this.releaseModalLayer();
      this.unbindOpenListeners();
      this.el.removeEventListener("open", this.onOpenEvent);
      this.el.removeEventListener("close", this.onCloseEvent);
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
      if (e.key !== "Escape" || e.isComposing || e.keyCode === 229) return;
      e.preventDefault();
      this.close();
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

      this.syncModalAttributes();
      this.bindOpenListeners();
      this.lockScroll();

      if (!isInitial) this.pushOpenChange(true);

      requestAnimationFrame(() => this.focusOnOpen());
    },

    close() {
      if (this.el.dataset.state === "closed") return;

      this.unlockScroll();
      this.releaseModalLayer();
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

    lockScroll() {
      if (!this.modal || this.scrollLocked) return;
      lockBodyScroll();
      this.scrollLocked = true;
    },

    unlockScroll() {
      if (!this.scrollLocked) return;
      this.scrollLocked = false;
      unlockBodyScroll();
    },

    bindOpenListeners() {
      if (this.modal) {
        this.ensureModalLayer();
        return;
      }
      document.addEventListener("keydown", this.onDocumentKeyDown);
    },

    unbindOpenListeners() {
      document.removeEventListener("keydown", this.onDocumentKeyDown);
    },

    ensureModalLayer() {
      if (!this.modal || !this.content) return;
      if (this.modalLayer?.content === this.content) {
        this.modalLayer.sync();
        return;
      }
      this.releaseModalLayer();
      const content = this.content;
      this.modalLayer = {
        content,
        ...activateModalLayer({
          content,
          interactives: [content, this.overlay],
          onEscape: () => this.close(),
        }),
      };
    },

    releaseModalLayer() {
      this.modalLayer?.release();
      this.modalLayer = null;
    },

    syncModalAttributes() {
      const content = this.content;
      if (!content) return;

      if (this.modal) content.setAttribute("aria-modal", "true");
      else content.removeAttribute("aria-modal");

      const title = content.querySelector(
        this.selectors.title || "[data-radix-dialog-title]",
      );
      const description = content.querySelector(
        this.selectors.description || "[data-radix-dialog-description]",
      );

      if (title && !content.hasAttribute("aria-labelledby")) {
        if (!title.id) title.id = `${content.id || this.el.id}-title`;
        content.setAttribute("aria-labelledby", title.id);
      }

      if (description && !content.hasAttribute("aria-describedby")) {
        if (!description.id) {
          description.id = `${content.id || this.el.id}-description`;
        }
        content.setAttribute("aria-describedby", description.id);
      }
    },

    focusOnOpen() {
      if (!this.content || this.el.dataset.state !== "open") return;

      if (this.focusCancel && this.selectors.cancel) {
        const cancel = this.content.querySelector(this.selectors.cancel);
        if (cancel) {
          cancel.focus({ preventScroll: true });
          return;
        }
      }

      focusFirst(this.content, { select: true, skipLinks: true });
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
  focusCancel: true,
});
