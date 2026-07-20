export const ScrollAreaRoot = {
  mounted() {
    this.viewport = this.el.querySelector("[data-essence-scroll-area-viewport]");
    this.verticalScrollbar = this.el.querySelector(
      '[data-essence-scroll-area-scrollbar][data-orientation="vertical"]'
    );
    this.horizontalScrollbar = this.el.querySelector(
      '[data-essence-scroll-area-scrollbar][data-orientation="horizontal"]'
    );
    this.verticalThumb = this.verticalScrollbar?.querySelector("[data-essence-scroll-area-thumb]");
    this.horizontalThumb = this.horizontalScrollbar?.querySelector(
      "[data-essence-scroll-area-thumb]"
    );
    this.corner = this.el.querySelector("[data-essence-scroll-area-corner]");
    this.type = this.el.dataset.type || "hover";
    this.hideDelay = parseInt(this.el.dataset.scrollHideDelay || "600", 10);
    this.isDragging = false;

    this.onScroll = this.onScroll.bind(this);
    this.updateScrollbars = this.updateScrollbars.bind(this);
    this.hideScrollbars = this.hideScrollbars.bind(this);
    this.showScrollbars = this.showScrollbars.bind(this);

    if (!this.viewport) return;

    this.viewport.addEventListener("scroll", this.onScroll);
    window.addEventListener("resize", this.updateScrollbars);

    this.updateScrollbars();

    if (this.type === "hover") {
      this.el.addEventListener("mouseenter", this.showScrollbars);
      this.el.addEventListener("mouseleave", this.hideScrollbars);
      this.setScrollbarState("hidden");
    } else if (this.type === "scroll") {
      this.setScrollbarState("hidden");
    } else if (this.type === "always") {
      this.setScrollbarState("visible");
    } else if (this.type === "auto") {
      this.setScrollbarState("visible");
    }

    this.observer = new MutationObserver(this.updateScrollbars);
    this.observer.observe(this.viewport, {
      childList: true,
      subtree: true,
      characterData: true,
    });
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
    this.setScrollbarState("visible");
  },

  hideScrollbars() {
    if (this.type === "always" || this.isDragging) return;
    this.setScrollbarState("hidden");
  },

  updateScrollbars() {
    if (!this.viewport) return;

    const { offsetHeight, scrollHeight, offsetWidth, scrollWidth } = this.viewport;
    const hasVerticalScroll = scrollHeight > offsetHeight;
    const hasHorizontalScroll = scrollWidth > offsetWidth;

    if (this.verticalScrollbar) {
      this.verticalScrollbar.style.display = hasVerticalScroll ? "flex" : "none";
    }
    if (this.horizontalScrollbar) {
      this.horizontalScrollbar.style.display = hasHorizontalScroll ? "flex" : "none";
    }
    if (this.corner) {
      this.corner.style.display =
        hasVerticalScroll && hasHorizontalScroll ? "block" : "none";
    }

    if (hasVerticalScroll && this.verticalThumb) {
      const thumbHeight = Math.max((offsetHeight / scrollHeight) * offsetHeight, 20);
      this.verticalThumb.style.height = `${thumbHeight}px`;
    }

    if (hasHorizontalScroll && this.horizontalThumb) {
      const thumbWidth = Math.max((offsetWidth / scrollWidth) * offsetWidth, 20);
      this.horizontalThumb.style.width = `${thumbWidth}px`;
    }

    this.updateThumbPositions();
  },

  updateThumbPositions() {
    if (!this.viewport) return;

    const { scrollTop, scrollHeight, offsetHeight, scrollLeft, scrollWidth, offsetWidth } =
      this.viewport;

    if (scrollHeight > offsetHeight && this.verticalThumb) {
      const maxScrollTop = scrollHeight - offsetHeight;
      const maxThumbTop = offsetHeight - this.verticalThumb.offsetHeight;
      const thumbTop = maxScrollTop > 0 ? (scrollTop / maxScrollTop) * maxThumbTop : 0;
      this.verticalThumb.style.transform = `translateY(${thumbTop}px)`;
    }

    if (scrollWidth > offsetWidth && this.horizontalThumb) {
      const maxScrollLeft = scrollWidth - offsetWidth;
      const maxThumbLeft = offsetWidth - this.horizontalThumb.offsetWidth;
      const thumbLeft = maxScrollLeft > 0 ? (scrollLeft / maxScrollLeft) * maxThumbLeft : 0;
      this.horizontalThumb.style.transform = `translateX(${thumbLeft}px)`;
    }
  },

  destroyed() {
    this.viewport?.removeEventListener("scroll", this.onScroll);
    window.removeEventListener("resize", this.updateScrollbars);
    this.el.removeEventListener("mouseenter", this.showScrollbars);
    this.el.removeEventListener("mouseleave", this.hideScrollbars);
    this.observer?.disconnect();
    clearTimeout(this.hideTimeout);
  },
};
