/**
 * ToastRoot — open/close, auto-dismiss, close button, Escape when focused.
 * Duration comes from the root's data-duration or the nearest provider.
 */
export const ToastRoot = {
  mounted() {
    this._timer = null;
    this._remaining = null;
    this._startedAt = null;

    this.provider = this.el.closest("[data-essence-toast-provider]");
    this._syncSwipeDirection();

    this._onCloseClick = (event) => {
      if (event.target.closest("[data-essence-toast-close]")) {
        event.preventDefault();
        this.close();
      }
    };

    this._onKeyDown = (event) => {
      if (event.key === "Escape" && this.el.contains(document.activeElement)) {
        event.preventDefault();
        this.close();
      }
    };

    this._onPointerEnter = () => this._pauseTimer();
    this._onPointerLeave = () => this._resumeTimer();
    this._onFocusIn = () => this._pauseTimer();
    this._onFocusOut = (event) => {
      if (!this.el.contains(event.relatedTarget)) {
        this._resumeTimer();
      }
    };

    this._onExternalOpen = () => this.open();
    this._onExternalClose = () => this.close();

    this.el.addEventListener("click", this._onCloseClick);
    this.el.addEventListener("keydown", this._onKeyDown);
    this.el.addEventListener("pointerenter", this._onPointerEnter);
    this.el.addEventListener("pointerleave", this._onPointerLeave);
    this.el.addEventListener("focusin", this._onFocusIn);
    this.el.addEventListener("focusout", this._onFocusOut);
    this.el.addEventListener("essence:toast:open", this._onExternalOpen);
    this.el.addEventListener("essence:toast:close", this._onExternalClose);

    if (this.el.dataset.state === "open") {
      this.open(true);
    }
  },

  updated() {
    this._syncSwipeDirection();
    if (this.el.dataset.state === "open" && this.el.hidden === false) {
      if (!this._timer && this._remaining == null) {
        this._startTimer();
      }
    } else if (this.el.dataset.state === "closed") {
      this._clearTimer();
      this.el.hidden = true;
    }
  },

  destroyed() {
    this._clearTimer();
    this.el.removeEventListener("click", this._onCloseClick);
    this.el.removeEventListener("keydown", this._onKeyDown);
    this.el.removeEventListener("pointerenter", this._onPointerEnter);
    this.el.removeEventListener("pointerleave", this._onPointerLeave);
    this.el.removeEventListener("focusin", this._onFocusIn);
    this.el.removeEventListener("focusout", this._onFocusOut);
    this.el.removeEventListener("essence:toast:open", this._onExternalOpen);
    this.el.removeEventListener("essence:toast:close", this._onExternalClose);
  },

  open(isInitial = false) {
    this.el.dataset.state = "open";
    this.el.hidden = false;
    this._syncSwipeDirection();
    if (!isInitial) this._pushOpenChange(true);
    this._startTimer();
  },

  close() {
    if (this.el.dataset.state === "closed") return;

    this._clearTimer();
    this.el.dataset.state = "closed";
    this.el.hidden = true;
    this._pushOpenChange(false);
  },

  _syncSwipeDirection() {
    const direction =
      this.el.dataset.swipeDirection ||
      this.provider?.dataset.swipeDirection ||
      "right";
    this.el.dataset.swipeDirection = direction;
  },

  _duration() {
    const fromRoot = this.el.dataset.duration;
    if (fromRoot != null && fromRoot !== "") {
      const n = Number(fromRoot);
      if (!Number.isNaN(n)) return n;
    }
    const fromProvider = this.provider?.dataset.duration;
    if (fromProvider != null && fromProvider !== "") {
      const n = Number(fromProvider);
      if (!Number.isNaN(n)) return n;
    }
    return 5000;
  },

  _startTimer() {
    this._clearTimer();
    const duration = this._duration();
    if (duration <= 0) return;

    this._remaining = duration;
    this._startedAt = Date.now();
    this._timer = setTimeout(() => this.close(), duration);
  },

  _pauseTimer() {
    if (this._timer == null) return;
    clearTimeout(this._timer);
    this._timer = null;
    if (this._startedAt != null && this._remaining != null) {
      this._remaining = Math.max(0, this._remaining - (Date.now() - this._startedAt));
    }
    this._startedAt = null;
  },

  _resumeTimer() {
    if (this.el.dataset.state !== "open") return;
    if (this._timer != null) return;
    if (this._remaining == null) {
      this._startTimer();
      return;
    }
    if (this._remaining <= 0) {
      this.close();
      return;
    }
    this._startedAt = Date.now();
    this._timer = setTimeout(() => this.close(), this._remaining);
  },

  _clearTimer() {
    if (this._timer != null) {
      clearTimeout(this._timer);
      this._timer = null;
    }
    this._remaining = null;
    this._startedAt = null;
  },

  _pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  },
};
