const DEFAULT_INDICATOR_TRANSITION =
  "transform 200ms cubic-bezier(0.45, 0.05, 0.2, 1)";

export const TabsRoot = {
  mounted() {
    this.onClick = this.onClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.el.addEventListener("click", this.onClick);
    this.list()?.addEventListener("keydown", this.onKeyDown);
    this.reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
    this.indicatorValue = null;
    this.wireAria();
    this.sync(this.el.dataset.value);
    this.placeIndicator(false);
  },

  updated() {
    this.wireAria();
    const value = this.el.dataset.value;
    const animate = this.indicatorValue != null && value !== this.indicatorValue;
    this.sync(value);
    const indicator = this.indicator();
    const rebound = indicator ? this.bindIndicator(indicator) : false;
    if (animate || rebound || this.indicatorValue == null) {
      this.placeIndicator(animate && !rebound);
    }
  },

  destroyed() {
    this.el.removeEventListener("click", this.onClick);
    this.list()?.removeEventListener("keydown", this.onKeyDown);
    this.indicatorObserver?.disconnect();
    if (this.indicatorFrame) cancelAnimationFrame(this.indicatorFrame);
  },

  list() {
    return this.el.querySelector("[data-radix-tabs-list]");
  },

  triggers() {
    return Array.from(this.el.querySelectorAll("[data-radix-tabs-trigger]"));
  },

  contents() {
    return Array.from(this.el.querySelectorAll("[data-radix-tabs-content]"));
  },

  enabledTriggers() {
    return this.triggers().filter((t) => !t.disabled && !t.hasAttribute("data-disabled"));
  },

  /** Wire ids / aria-controls / aria-labelledby / orientation. */
  wireAria() {
    const rootId = this.el.id;
    const orientation = this.el.dataset.orientation || "horizontal";
    const list = this.list();

    if (list) {
      list.setAttribute("aria-orientation", orientation);
      list.dataset.orientation = orientation;
    }

    this.triggers().forEach((trigger) => {
      const value = trigger.dataset.value;
      if (!value) return;
      if (!trigger.id && rootId) trigger.id = `${rootId}-trigger-${value}`;
      if (rootId) trigger.setAttribute("aria-controls", `${rootId}-content-${value}`);
      trigger.dataset.orientation = orientation;
      if (!trigger.hasAttribute("data-radix-collection-item")) {
        trigger.setAttribute("data-radix-collection-item", "");
      }
    });

    this.contents().forEach((content) => {
      const value = content.dataset.value;
      if (!value) return;
      if (!content.id && rootId) content.id = `${rootId}-content-${value}`;
      if (rootId) content.setAttribute("aria-labelledby", `${rootId}-trigger-${value}`);
      content.dataset.orientation = orientation;
    });
  },

  onClick(event) {
    const trigger = event.target.closest("[data-radix-tabs-trigger]");
    if (!trigger || !this.el.contains(trigger)) return;
    if (trigger.disabled || trigger.hasAttribute("data-disabled")) return;
    // Focus the trigger before the active panel is hidden, or focus is lost.
    trigger.focus();
    this.activate(trigger.dataset.value, true);
  },

  onKeyDown(event) {
    const trigger = event.target?.closest?.("[data-radix-tabs-trigger]");
    if (!trigger || event.target !== trigger || !this.el.contains(trigger)) return;
    if (trigger.disabled || trigger.hasAttribute("data-disabled")) return;

    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault();
      this.activate(trigger.dataset.value, true);
      return;
    }

    const keys = ["ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown", "Home", "End"];
    if (!keys.includes(event.key)) return;

    const enabled = this.enabledTriggers();
    if (!enabled.length) return;

    const current = enabled.indexOf(trigger);
    if (current === -1) return;

    const orientation = this.el.dataset.orientation || "horizontal";
    const vertical = orientation === "vertical";
    const rtl = !vertical && (this.el.getAttribute("dir") || "ltr") === "rtl";
    const prevKey = vertical ? "ArrowUp" : rtl ? "ArrowRight" : "ArrowLeft";
    const nextKey = vertical ? "ArrowDown" : rtl ? "ArrowLeft" : "ArrowRight";

    if (event.key === "ArrowLeft" || event.key === "ArrowRight") {
      if (vertical) return;
    }
    if (event.key === "ArrowUp" || event.key === "ArrowDown") {
      if (!vertical) return;
    }

    event.preventDefault();

    const list = this.list();
    const loop = list?.dataset.loop !== "false";
    let next = current;

    if (event.key === "Home") next = 0;
    else if (event.key === "End") next = enabled.length - 1;
    else next += event.key === prevKey ? -1 : 1;

    if (next < 0) next = loop ? enabled.length - 1 : 0;
    if (next >= enabled.length) next = loop ? 0 : enabled.length - 1;

    const target = enabled[next];
    target.focus();

    if (this.el.dataset.activationMode !== "manual") {
      this.activate(target.dataset.value, true);
    }
  },

  activate(value, notify = false) {
    if (!value) return;
    const animate = this.indicatorValue != null && value !== this.indicatorValue;
    this.el.dataset.value = value;
    this.sync(value);
    if (animate || this.indicatorValue == null) this.placeIndicator(animate);

    if (notify) {
      const eventName = this.el.dataset.onValueChange;
      if (eventName) this.pushEvent(eventName, { value });
    }
  },

  sync(value) {
    const active = value || this.el.dataset.value || "";

    this.triggers().forEach((trigger) => {
      const isActive = trigger.dataset.value === active;
      trigger.dataset.state = isActive ? "active" : "inactive";
      trigger.setAttribute("aria-selected", isActive ? "true" : "false");
      trigger.tabIndex = isActive ? 0 : -1;
    });

    this.contents().forEach((content) => {
      const isActive = content.dataset.value === active;
      content.dataset.state = isActive ? "active" : "inactive";
      if (!content.hasAttribute("data-force-mount") || isActive) {
        content.hidden = !isActive;
      }
    });

    // Ensure at least one tab is tabbable when none match
    if (active && !this.triggers().some((t) => t.dataset.value === active)) {
      const first = this.enabledTriggers()[0];
      if (first) first.tabIndex = 0;
    } else if (!active) {
      const first = this.enabledTriggers()[0];
      if (first) first.tabIndex = 0;
    }
  },

  indicator() {
    return this.el.querySelector("[data-radix-tabs-indicator]");
  },

  activeTrigger() {
    return this.triggers().find((trigger) => trigger.dataset.state === "active");
  },

  bindIndicator(indicator) {
    const list = indicator.closest("[data-radix-tabs-list]");
    if (!list) return false;
    if (getComputedStyle(list).position === "static") {
      list.style.position = "relative";
    }
    if (!this.indicatorObserver) {
      this.indicatorObserver = new ResizeObserver(() => this.placeIndicator(false));
    }
    if (this.indicatorList === list) return false;
    if (this.indicatorList) this.indicatorObserver.unobserve(this.indicatorList);
    this.indicatorObserver.observe(list);
    const rebound = this.indicatorList != null;
    this.indicatorList = list;
    return rebound;
  },

  indicatorGeometry(indicator, trigger) {
    const list = indicator.closest("[data-radix-tabs-list]");
    if (!list) {
      return {
        x: trigger.offsetLeft,
        y: trigger.offsetTop,
        width: trigger.offsetWidth,
        height: trigger.offsetHeight,
      };
    }

    const listRect = list.getBoundingClientRect();
    const rect = trigger.getBoundingClientRect();
    return {
      x: rect.left - listRect.left + list.scrollLeft - list.clientLeft,
      y: rect.top - listRect.top + list.scrollTop - list.clientTop,
      width: rect.width,
      height: rect.height,
    };
  },

  placeIndicator(animate) {
    if (this.placingIndicator) return;
    const indicator = this.indicator();
    if (!indicator) return;
    const trigger = this.activeTrigger();
    if (!trigger) return;

    this.placingIndicator = true;
    try {
      this.bindIndicator(indicator);
      this.indicatorValue = trigger.dataset.value;
      this.indicatorGeneration = (this.indicatorGeneration || 0) + 1;
      const generation = this.indicatorGeneration;
      if (this.indicatorFrame) cancelAnimationFrame(this.indicatorFrame);

      const configured = indicator.dataset.transition || DEFAULT_INDICATOR_TRANSITION;
      const reduce = this.reduceMotion?.matches;
      const motion = animate && !reduce && configured !== "none" ? configured : "none";

      const apply = () => {
        if (generation !== this.indicatorGeneration) return;
        const current = this.triggers().find((item) => item.dataset.value === trigger.dataset.value);
        if (!current) return;
        const box = this.indicatorGeometry(indicator, current);
        indicator.style.setProperty("--radix-tabs-indicator-x", `${box.x}px`);
        indicator.style.setProperty("--radix-tabs-indicator-y", `${box.y}px`);
        indicator.style.setProperty("--radix-tabs-indicator-width", `${box.width}px`);
        indicator.style.setProperty("--radix-tabs-indicator-height", `${box.height}px`);
        indicator.hidden = false;
        indicator.dataset.state = "active";
      };

      indicator.style.setProperty("--radix-tabs-indicator-transition", motion);

      if (motion === "none") {
        apply();
        this.indicatorFrame = requestAnimationFrame(() => {
          if (generation !== this.indicatorGeneration) return;
          this.indicatorFrame = null;
          if (!reduce && configured !== "none") {
            indicator.style.setProperty("--radix-tabs-indicator-transition", configured);
          }
        });
        return;
      }

      // Commit the transition before moving, or the first change does not animate.
      queueMicrotask(() => {
        if (generation !== this.indicatorGeneration) return;
        this.indicatorFrame = requestAnimationFrame(() => {
          if (generation !== this.indicatorGeneration) return;
          this.indicatorFrame = null;
          apply();
        });
      });
    } finally {
      this.placingIndicator = false;
    }
  },
};
