export const ToolbarRoot = {
  mounted() {
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onFocusIn = this.onFocusIn.bind(this);
    this.onClick = this.onClick.bind(this);

    this.el.addEventListener("keydown", this.onKeyDown);
    this.el.addEventListener("focusin", this.onFocusIn);
    this.el.addEventListener("click", this.onClick);

    this.syncToggleGroups();
    this.syncTabIndexes();
  },

  updated() {
    this.syncToggleGroups();
    this.syncTabIndexes();
  },

  destroyed() {
    this.el.removeEventListener("keydown", this.onKeyDown);
    this.el.removeEventListener("focusin", this.onFocusIn);
    this.el.removeEventListener("click", this.onClick);
  },

  items() {
    return Array.from(this.el.querySelectorAll("[data-essence-toolbar-item]")).filter(
      (el) => !el.disabled && !el.hasAttribute("data-disabled")
    );
  },

  allItems() {
    return Array.from(this.el.querySelectorAll("[data-essence-toolbar-item]"));
  },

  syncTabIndexes(focused = null) {
    const items = this.items();
    if (!items.length) return;

    const active = focused && items.includes(focused) ? focused : items[0];
    this.allItems().forEach((item) => {
      item.tabIndex = item === active ? 0 : -1;
    });
  },

  onFocusIn(event) {
    const item = event.target.closest("[data-essence-toolbar-item]");
    if (item && this.el.contains(item)) {
      this.syncTabIndexes(item);
    }
  },

  onKeyDown(event) {
    const keys = ["ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown", "Home", "End"];
    if (!keys.includes(event.key)) return;

    const items = this.items();
    if (!items.length) return;

    const current = items.indexOf(document.activeElement);
    if (current === -1) return;

    const orientation = this.el.dataset.orientation || "horizontal";
    const vertical = orientation === "vertical";

    if ((event.key === "ArrowLeft" || event.key === "ArrowRight") && vertical) return;
    if ((event.key === "ArrowUp" || event.key === "ArrowDown") && !vertical) return;

    event.preventDefault();

    const loop = this.el.dataset.loop !== "false";
    const prevKey = vertical ? "ArrowUp" : "ArrowLeft";
    let next = current;

    if (event.key === "Home") next = 0;
    else if (event.key === "End") next = items.length - 1;
    else next += event.key === prevKey ? -1 : 1;

    if (next < 0) next = loop ? items.length - 1 : 0;
    if (next >= items.length) next = loop ? 0 : items.length - 1;

    items[next].focus();
    this.syncTabIndexes(items[next]);
  },

  onClick(event) {
    const item = event.target.closest("[data-essence-toolbar-toggle-item]");
    if (!item || !this.el.contains(item)) return;
    if (item.disabled || item.hasAttribute("data-disabled")) return;

    const group = item.closest("[data-essence-toolbar-toggle-group]");
    if (!group || group.hasAttribute("data-disabled")) return;

    const type = group.dataset.type || "single";
    const value = item.dataset.value;
    let values = (group.dataset.value || "").split(",").filter(Boolean);

    if (type === "single") {
      values = values[0] === value ? [] : [value];
    } else if (values.includes(value)) {
      values = values.filter((v) => v !== value);
    } else {
      values.push(value);
    }

    group.dataset.value = values.join(",");
    this.syncToggleGroup(group);

    const eventName = group.dataset.onValueChange;
    if (eventName) {
      this.pushEvent(eventName, {
        value: type === "single" ? values[0] || null : values,
      });
    }
  },

  syncToggleGroups() {
    this.el
      .querySelectorAll("[data-essence-toolbar-toggle-group]")
      .forEach((group) => this.syncToggleGroup(group));
  },

  syncToggleGroup(group) {
    const values = (group.dataset.value || "").split(",").filter(Boolean);
    const disabled = group.hasAttribute("data-disabled");

    group.querySelectorAll("[data-essence-toolbar-toggle-item]").forEach((item) => {
      const pressed = values.includes(item.dataset.value);
      item.dataset.state = pressed ? "on" : "off";
      item.setAttribute("aria-pressed", String(pressed));
      if (disabled) item.disabled = true;
    });
  },
};
