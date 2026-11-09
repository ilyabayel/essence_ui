/**
 * ToastRoot — open/close, auto-dismiss, close button, Escape when focused.
 * Duration comes from the root's data-duration or the nearest provider.
 */
export const ToastRoot = {
  mounted() {
    this._timer = null;
    this._remaining = null;
    this._startedAt = null;

    this.provider = this.el.closest("[data-radix-toast-provider]");
    this._syncSwipeDirection();

    this._onCloseClick = (event) => {
      if (event.target.closest("[data-radix-toast-close]")) {
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
    this._onWindowBlur = () => this._pauseTimer();
    this._onWindowFocus = () => {
      if (this.el.matches(":hover") || this.el.contains(document.activeElement)) return;
      this._resumeTimer();
    };

    this._pointerStart = null;
    this._swipeDelta = null;
    this._onPointerDown = (event) => this._pointerDown(event);
    this._onPointerMove = (event) => this._pointerMove(event);
    this._onPointerUp = (event) => this._pointerUp(event);

    this._onExternalOpen = () => this.open();
    this._onExternalClose = () => this.close();

    this.el.addEventListener("click", this._onCloseClick);
    this.el.addEventListener("keydown", this._onKeyDown);
    this.el.addEventListener("pointerenter", this._onPointerEnter);
    this.el.addEventListener("pointerleave", this._onPointerLeave);
    this.el.addEventListener("focusin", this._onFocusIn);
    this.el.addEventListener("focusout", this._onFocusOut);
    this.el.addEventListener("pointerdown", this._onPointerDown);
    this.el.addEventListener("pointermove", this._onPointerMove);
    this.el.addEventListener("pointerup", this._onPointerUp);
    this.el.addEventListener("pointercancel", this._onPointerUp);
    window.addEventListener("blur", this._onWindowBlur);
    window.addEventListener("focus", this._onWindowFocus);
    this.el.addEventListener("essence:toast:open", this._onExternalOpen);
    this.el.addEventListener("essence:toast:close", this._onExternalClose);

    if (this.el.dataset.state === "open") {
      this.open(true);
    }
    this.el.setAttribute("data-hydrated", "");
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
    this.el.removeEventListener("pointerdown", this._onPointerDown);
    this.el.removeEventListener("pointermove", this._onPointerMove);
    this.el.removeEventListener("pointerup", this._onPointerUp);
    this.el.removeEventListener("pointercancel", this._onPointerUp);
    window.removeEventListener("blur", this._onWindowBlur);
    window.removeEventListener("focus", this._onWindowFocus);
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

  _swipeThreshold() {
    const raw = this.provider?.dataset.swipeThreshold ?? this.el.dataset.swipeThreshold;
    if (raw == null || raw === "") return 50;
    const value = Number(raw);
    return Number.isNaN(value) ? 50 : value;
  },

  _direction() {
    return this.el.dataset.swipeDirection || "right";
  },

  _pointerDown(event) {
    if (event.button !== 0 || this.el.dataset.state !== "open") return;
    this._pointerStart = { x: event.clientX, y: event.clientY };
    this._swipeDelta = null;
  },

  _pointerMove(event) {
    if (!this._pointerStart) return;

    const x = event.clientX - this._pointerStart.x;
    const y = event.clientY - this._pointerStart.y;
    const direction = this._direction();
    const horizontal = direction === "left" || direction === "right";
    const clamp = direction === "left" || direction === "up" ? Math.min : Math.max;
    const delta = {
      x: horizontal ? clamp(0, x) : 0,
      y: horizontal ? 0 : clamp(0, y),
    };
    const buffer = event.pointerType === "touch" ? 10 : 2;

    if (this._swipeDelta) {
      this._swipeDelta = delta;
      this._paintSwipe("move", delta);
      return;
    }

    if (isDeltaInDirection(delta, direction, buffer)) {
      this._swipeDelta = delta;
      this._paintSwipe("start", delta);
      try {
        this.el.setPointerCapture?.(event.pointerId);
      } catch (_error) {
        // Synthetic pointer moves may not own an active pointer id.
      }
      return;
    }

    if (Math.abs(x) > buffer || Math.abs(y) > buffer) {
      this._pointerStart = null;
    }
  },

  _pointerUp(event) {
    const delta = this._swipeDelta;
    if (this.el.hasPointerCapture?.(event.pointerId)) {
      this.el.releasePointerCapture(event.pointerId);
    }
    this._swipeDelta = null;
    this._pointerStart = null;
    if (!delta) return;

    if (isDeltaInDirection(delta, this._direction(), this._swipeThreshold())) {
      this._paintSwipe("end", delta);
      this.close();
    } else {
      this._clearSwipe();
    }

    this.el.addEventListener("click", (clickEvent) => clickEvent.preventDefault(), {
      once: true,
    });
  },

  _paintSwipe(state, delta) {
    this.el.setAttribute("data-swipe", state);
    if (state === "end") {
      this.el.style.removeProperty("--radix-toast-swipe-move-x");
      this.el.style.removeProperty("--radix-toast-swipe-move-y");
      this.el.style.setProperty("--radix-toast-swipe-end-x", `${delta.x}px`);
      this.el.style.setProperty("--radix-toast-swipe-end-y", `${delta.y}px`);
      return;
    }
    this.el.style.setProperty("--radix-toast-swipe-move-x", `${delta.x}px`);
    this.el.style.setProperty("--radix-toast-swipe-move-y", `${delta.y}px`);
  },

  _clearSwipe() {
    this.el.setAttribute("data-swipe", "cancel");
    for (const prop of [
      "--radix-toast-swipe-move-x",
      "--radix-toast-swipe-move-y",
      "--radix-toast-swipe-end-x",
      "--radix-toast-swipe-end-y",
    ]) {
      this.el.style.removeProperty(prop);
    }
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

function isDeltaInDirection(delta, direction, threshold = 0) {
  const deltaX = Math.abs(delta.x);
  const deltaY = Math.abs(delta.y);
  const isHorizontal = deltaX > deltaY;
  if (direction === "left" || direction === "right") {
    return isHorizontal && deltaX > threshold;
  }
  return !isHorizontal && deltaY > threshold;
}
