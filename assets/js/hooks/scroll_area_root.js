import { hasFinePointerHover, whenMouse } from "../lib/pointer";

const MIN_THUMB = 18;

function clamp(value, min, max) {
  return Math.min(Math.max(value, min), max);
}

function thumbSize(viewportSize, contentSize, scrollbarSize, paddingStart, paddingEnd) {
  const ratio = viewportSize / contentSize;
  if (!Number.isFinite(ratio) || ratio >= 1 || ratio <= 0) return 0;
  const track = scrollbarSize - paddingStart - paddingEnd;
  return Math.max(track * ratio, MIN_THUMB);
}

function thumbOffset(scrollPos, viewportSize, contentSize, scrollbarSize, paddingStart, paddingEnd) {
  const size = thumbSize(viewportSize, contentSize, scrollbarSize, paddingStart, paddingEnd);
  if (!size) return 0;
  const track = scrollbarSize - paddingStart - paddingEnd;
  const maxScroll = contentSize - viewportSize;
  const maxThumb = track - size;
  if (maxScroll <= 0 || maxThumb <= 0) return 0;
  return (scrollPos / maxScroll) * maxThumb;
}

function scrollFromPointer(
  pointerPos,
  pointerOffset,
  viewportSize,
  contentSize,
  scrollbarSize,
  paddingStart,
  paddingEnd,
) {
  const size = thumbSize(viewportSize, contentSize, scrollbarSize, paddingStart, paddingEnd);
  const offset = pointerOffset || size / 2;
  const thumbOffsetFromEnd = size - offset;
  const minPos = paddingStart + offset;
  const maxPos = scrollbarSize - paddingEnd - thumbOffsetFromEnd;
  const maxScroll = contentSize - viewportSize;
  if (maxPos === minPos) return 0;
  const ratio = (pointerPos - minPos) / (maxPos - minPos);
  return clamp(ratio * maxScroll, 0, maxScroll);
}

export const ScrollAreaRoot = {
  mounted() {
    this.viewport = this.el.querySelector("[data-essence-scroll-area-viewport]");
    this.content = this.el.querySelector("[data-essence-scroll-area-content]");
    this.verticalScrollbar = this.el.querySelector(
      '[data-essence-scroll-area-scrollbar][data-orientation="vertical"]',
    );
    this.horizontalScrollbar = this.el.querySelector(
      '[data-essence-scroll-area-scrollbar][data-orientation="horizontal"]',
    );
    this.verticalThumb = this.verticalScrollbar?.querySelector("[data-essence-scroll-area-thumb]");
    this.horizontalThumb = this.horizontalScrollbar?.querySelector(
      "[data-essence-scroll-area-thumb]",
    );
    this.corner = this.el.querySelector("[data-essence-scroll-area-corner]");
    this.type = this.el.dataset.type || "hover";
    if (this.type === "hover" && !hasFinePointerHover()) {
      this.type = "scroll";
    }
    this.hideDelay = parseInt(this.el.dataset.scrollHideDelay || "600", 10);
    this.dir = this.el.getAttribute("dir") || "ltr";
    this.isDragging = false;
    this.pointerOffset = 0;
    this._dragOrientation = null;
    this._dragRect = null;

    this.onScroll = this.onScroll.bind(this);
    this.updateScrollbars = this.updateScrollbars.bind(this);
    this.hideScrollbars = this.hideScrollbars.bind(this);
    this.showScrollbars = this.showScrollbars.bind(this);
    this.onPointerDown = this.onPointerDown.bind(this);
    this.onPointerMove = this.onPointerMove.bind(this);
    this.onPointerUp = this.onPointerUp.bind(this);

    if (!this.viewport) return;

    this.applyViewportOverflow();
    this.positionScrollbars();

    this.viewport.addEventListener("scroll", this.onScroll, { passive: true });
    window.addEventListener("resize", this.updateScrollbars);
    document.addEventListener("pointermove", this.onPointerMove);
    document.addEventListener("pointerup", this.onPointerUp);

    this.verticalScrollbar?.addEventListener("pointerdown", this.onPointerDown);
    this.horizontalScrollbar?.addEventListener("pointerdown", this.onPointerDown);

    this.updateScrollbars();

    if (this.type === "hover") {
      this._hoverShow = whenMouse(this.showScrollbars);
      this._hoverHide = whenMouse(() => {
        clearTimeout(this.hideTimeout);
        this.hideTimeout = setTimeout(this.hideScrollbars, this.hideDelay);
      });
      this.el.addEventListener("pointerenter", this._hoverShow);
      this.el.addEventListener("pointerleave", this._hoverHide);
      this.setScrollbarState("hidden");
    } else if (this.type === "scroll") {
      this.setScrollbarState("hidden");
    } else {
      this.setScrollbarState("visible");
    }

    this.observer = new MutationObserver(this.updateScrollbars);
    this.observer.observe(this.viewport, {
      childList: true,
      subtree: true,
      characterData: true,
    });

    if (typeof ResizeObserver !== "undefined") {
      this.resizeObserver = new ResizeObserver(this.updateScrollbars);
      this.resizeObserver.observe(this.viewport);
      if (this.content) this.resizeObserver.observe(this.content);
    }
  },

  applyViewportOverflow() {
    if (!this.viewport) return;
    // Match Radix: enable scroll only on axes that have a scrollbar part.
    this.viewport.style.overflowX = this.horizontalScrollbar ? "scroll" : "hidden";
    this.viewport.style.overflowY = this.verticalScrollbar ? "scroll" : "hidden";
  },

  positionScrollbars() {
    if (this.verticalScrollbar) {
      Object.assign(this.verticalScrollbar.style, {
        position: "absolute",
        top: "0",
        bottom: "var(--essence-scroll-area-corner-height, 0px)",
        ...(this.dir === "rtl" ? { left: "0", right: "auto" } : { right: "0", left: "auto" }),
      });
    }
    if (this.horizontalScrollbar) {
      Object.assign(this.horizontalScrollbar.style, {
        position: "absolute",
        bottom: "0",
        left: this.dir === "rtl" ? "var(--essence-scroll-area-corner-width, 0px)" : "0",
        right: this.dir === "ltr" ? "var(--essence-scroll-area-corner-width, 0px)" : "0",
      });
    }
    if (this.corner) {
      Object.assign(this.corner.style, {
        position: "absolute",
        bottom: "0",
        ...(this.dir === "rtl" ? { left: "0", right: "auto" } : { right: "0", left: "auto" }),
      });
    }
  },

  onScroll() {
    this.updateThumbPositions();
    if (this.type === "scroll") {
      this.showScrollbars();
      clearTimeout(this.hideTimeout);
      this.hideTimeout = setTimeout(this.hideScrollbars, this.hideDelay);
    }
  },

  setScrollbarState(state) {
    if (this.verticalScrollbar) this.verticalScrollbar.dataset.state = state;
    if (this.horizontalScrollbar) this.horizontalScrollbar.dataset.state = state;
  },

  showScrollbars() {
    clearTimeout(this.hideTimeout);
    this.setScrollbarState("visible");
  },

  hideScrollbars() {
    if (this.type === "always" || this.isDragging) return;
    this.setScrollbarState("hidden");
  },

  updateScrollbars() {
    if (!this.viewport) return;

    const { offsetHeight, scrollHeight, offsetWidth, scrollWidth } = this.viewport;
    const hasVerticalScroll = Boolean(this.verticalScrollbar) && scrollHeight > offsetHeight + 1;
    const hasHorizontalScroll =
      Boolean(this.horizontalScrollbar) && scrollWidth > offsetWidth + 1;

    if (this.verticalScrollbar) {
      this.verticalScrollbar.style.display = hasVerticalScroll ? "flex" : "none";
      if (this.type === "auto") {
        this.verticalScrollbar.dataset.state = hasVerticalScroll ? "visible" : "hidden";
      }
    }
    if (this.horizontalScrollbar) {
      this.horizontalScrollbar.style.display = hasHorizontalScroll ? "flex" : "none";
      if (this.type === "auto") {
        this.horizontalScrollbar.dataset.state = hasHorizontalScroll ? "visible" : "hidden";
      }
    }

    const cornerWidth =
      hasVerticalScroll && this.verticalScrollbar ? this.verticalScrollbar.offsetWidth : 0;
    const cornerHeight =
      hasHorizontalScroll && this.horizontalScrollbar ? this.horizontalScrollbar.offsetHeight : 0;

    this.el.style.setProperty("--essence-scroll-area-corner-width", `${cornerWidth}px`);
    this.el.style.setProperty("--essence-scroll-area-corner-height", `${cornerHeight}px`);

    if (this.corner) {
      const showCorner = this.type !== "scroll" && hasVerticalScroll && hasHorizontalScroll;
      this.corner.style.display = showCorner ? "block" : "none";
      if (showCorner) {
        this.corner.style.width = `${cornerWidth}px`;
        this.corner.style.height = `${cornerHeight}px`;
      }
    }

    if (hasVerticalScroll && this.verticalThumb && this.verticalScrollbar) {
      const cs = getComputedStyle(this.verticalScrollbar);
      const padStart = parseInt(cs.paddingTop, 10) || 0;
      const padEnd = parseInt(cs.paddingBottom, 10) || 0;
      const size = thumbSize(
        offsetHeight,
        scrollHeight,
        this.verticalScrollbar.clientHeight,
        padStart,
        padEnd,
      );
      this.verticalThumb.style.height = size ? `${size}px` : "0px";
      this.verticalThumb.style.width = "100%";
      this.verticalThumb.dataset.state = size ? "visible" : "hidden";
    }

    if (hasHorizontalScroll && this.horizontalThumb && this.horizontalScrollbar) {
      const cs = getComputedStyle(this.horizontalScrollbar);
      const padStart = parseInt(cs.paddingLeft, 10) || 0;
      const padEnd = parseInt(cs.paddingRight, 10) || 0;
      const size = thumbSize(
        offsetWidth,
        scrollWidth,
        this.horizontalScrollbar.clientWidth,
        padStart,
        padEnd,
      );
      this.horizontalThumb.style.width = size ? `${size}px` : "0px";
      this.horizontalThumb.style.height = "100%";
      this.horizontalThumb.dataset.state = size ? "visible" : "hidden";
    }

    this.updateThumbPositions();
  },

  updateThumbPositions() {
    if (!this.viewport) return;

    const { scrollTop, scrollHeight, offsetHeight, scrollLeft, scrollWidth, offsetWidth } =
      this.viewport;

    if (this.verticalThumb && this.verticalScrollbar && scrollHeight > offsetHeight) {
      const cs = getComputedStyle(this.verticalScrollbar);
      const padStart = parseInt(cs.paddingTop, 10) || 0;
      const padEnd = parseInt(cs.paddingBottom, 10) || 0;
      const offset = thumbOffset(
        scrollTop,
        offsetHeight,
        scrollHeight,
        this.verticalScrollbar.clientHeight,
        padStart,
        padEnd,
      );
      this.verticalThumb.style.transform = `translate3d(0, ${offset}px, 0)`;
    }

    if (this.horizontalThumb && this.horizontalScrollbar && scrollWidth > offsetWidth) {
      const cs = getComputedStyle(this.horizontalScrollbar);
      const padStart = parseInt(cs.paddingLeft, 10) || 0;
      const padEnd = parseInt(cs.paddingRight, 10) || 0;
      const offset = thumbOffset(
        scrollLeft,
        offsetWidth,
        scrollWidth,
        this.horizontalScrollbar.clientWidth,
        padStart,
        padEnd,
      );
      this.horizontalThumb.style.transform = `translate3d(${offset}px, 0, 0)`;
    }
  },

  onPointerDown(event) {
    if (event.button !== 0) return;
    const scrollbar = event.currentTarget;
    const orientation = scrollbar.dataset.orientation;
    const thumb = orientation === "vertical" ? this.verticalThumb : this.horizontalThumb;
    if (!thumb || !this.viewport) return;

    this.isDragging = true;
    this._dragOrientation = orientation;
    scrollbar.setPointerCapture(event.pointerId);

    const thumbRect = thumb.getBoundingClientRect();
    this.pointerOffset =
      orientation === "vertical" ? event.clientY - thumbRect.top : event.clientX - thumbRect.left;

    this._prevUserSelect = document.body.style.webkitUserSelect;
    document.body.style.webkitUserSelect = "none";
    this.viewport.style.scrollBehavior = "auto";
    this._dragRect = scrollbar.getBoundingClientRect();
    this.dragTo(event);
    this.showScrollbars();
  },

  onPointerMove(event) {
    if (!this.isDragging) return;
    this.dragTo(event);
  },

  onPointerUp() {
    if (!this.isDragging) return;
    this.isDragging = false;
    this._dragOrientation = null;
    this._dragRect = null;
    document.body.style.webkitUserSelect = this._prevUserSelect || "";
    if (this.viewport) this.viewport.style.scrollBehavior = "";

    if (this.type === "hover" && !this.el.matches(":hover")) {
      this.hideScrollbars();
    }
  },

  dragTo(event) {
    if (!this.viewport || !this._dragRect || !this._dragOrientation) return;

    if (this._dragOrientation === "vertical" && this.verticalScrollbar) {
      const y = event.clientY - this._dragRect.top;
      const cs = getComputedStyle(this.verticalScrollbar);
      const padStart = parseInt(cs.paddingTop, 10) || 0;
      const padEnd = parseInt(cs.paddingBottom, 10) || 0;
      this.viewport.scrollTop = scrollFromPointer(
        y,
        this.pointerOffset,
        this.viewport.offsetHeight,
        this.viewport.scrollHeight,
        this.verticalScrollbar.clientHeight,
        padStart,
        padEnd,
      );
    }

    if (this._dragOrientation === "horizontal" && this.horizontalScrollbar) {
      const x = event.clientX - this._dragRect.left;
      const cs = getComputedStyle(this.horizontalScrollbar);
      const padStart = parseInt(cs.paddingLeft, 10) || 0;
      const padEnd = parseInt(cs.paddingRight, 10) || 0;
      this.viewport.scrollLeft = scrollFromPointer(
        x,
        this.pointerOffset,
        this.viewport.offsetWidth,
        this.viewport.scrollWidth,
        this.horizontalScrollbar.clientWidth,
        padStart,
        padEnd,
      );
    }
  },

  destroyed() {
    this.viewport?.removeEventListener("scroll", this.onScroll);
    window.removeEventListener("resize", this.updateScrollbars);
    document.removeEventListener("pointermove", this.onPointerMove);
    document.removeEventListener("pointerup", this.onPointerUp);
    this.verticalScrollbar?.removeEventListener("pointerdown", this.onPointerDown);
    this.horizontalScrollbar?.removeEventListener("pointerdown", this.onPointerDown);
    if (this._hoverShow) {
      this.el.removeEventListener("pointerenter", this._hoverShow);
      this.el.removeEventListener("pointerleave", this._hoverHide);
    }
    this.observer?.disconnect();
    this.resizeObserver?.disconnect();
    clearTimeout(this.hideTimeout);
  },
};
