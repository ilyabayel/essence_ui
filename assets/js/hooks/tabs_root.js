export const TabsRoot = {
  mounted() {
    this.onClick = this.onClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.el.addEventListener("click", this.onClick);
    this.list()?.addEventListener("keydown", this.onKeyDown);
    this.sync(this.el.dataset.value);
  },

  updated() {
    this.sync(this.el.dataset.value);
  },

  destroyed() {
    this.el.removeEventListener("click", this.onClick);
    this.list()?.removeEventListener("keydown", this.onKeyDown);
  },

  list() {
    return this.el.querySelector("[data-essence-tabs-list]");
  },

  triggers() {
    return Array.from(this.el.querySelectorAll("[data-essence-tabs-trigger]"));
  },

  contents() {
    return Array.from(this.el.querySelectorAll("[data-essence-tabs-content]"));
  },

  enabledTriggers() {
    return this.triggers().filter((t) => !t.disabled && !t.hasAttribute("data-disabled"));
  },

  onClick(event) {
    const trigger = event.target.closest("[data-essence-tabs-trigger]");
    if (!trigger || !this.el.contains(trigger)) return;
    if (trigger.disabled || trigger.hasAttribute("data-disabled")) return;
    this.activate(trigger.dataset.value, true);
  },

  onKeyDown(event) {
    const keys = ["ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown", "Home", "End"];
    if (!keys.includes(event.key)) return;

    const enabled = this.enabledTriggers();
    if (!enabled.length) return;

    const current = enabled.indexOf(document.activeElement);
    if (current === -1) return;

    const orientation = this.el.dataset.orientation || "horizontal";
    const vertical = orientation === "vertical";
    const prevKey = vertical ? "ArrowUp" : "ArrowLeft";
    const nextKey = vertical ? "ArrowDown" : "ArrowRight";

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
    this.el.dataset.value = value;
    this.sync(value);

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
};
