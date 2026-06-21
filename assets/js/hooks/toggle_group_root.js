export const ToggleGroupRoot = {
  mounted() {
    this.onClick = this.onClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.el.addEventListener("click", this.onClick);
    this.el.addEventListener("keydown", this.onKeyDown);
    this.sync();
  },

  updated() {
    this.sync();
  },

  destroyed() {
    this.el.removeEventListener("click", this.onClick);
    this.el.removeEventListener("keydown", this.onKeyDown);
  },

  items() {
    return Array.from(this.el.querySelectorAll("[data-essence-toggle-group-item]"));
  },

  values() {
    return (this.el.dataset.value || "").split(",").filter(Boolean);
  },

  sync() {
    const values = this.values();
    const single = this.el.dataset.type === "single";
    const disabled = this.el.hasAttribute("data-disabled");

    this.items().forEach((item, index) => {
      const pressed = values.includes(item.dataset.value);
      item.dataset.state = pressed ? "on" : "off";
      item.setAttribute("aria-pressed", single ? "false" : String(pressed));
      if (single) {
        item.setAttribute("role", "radio");
        item.setAttribute("aria-checked", String(pressed));
      }
      item.tabIndex = index === 0 || pressed ? 0 : -1;
      if (disabled) item.disabled = true;
    });
  },

  onClick(event) {
    const item = event.target.closest("[data-essence-toggle-group-item]");
    if (!item || item.disabled || this.el.hasAttribute("data-disabled")) return;

    const type = this.el.dataset.type;
    const value = item.dataset.value;
    let values = this.values();

    if (type === "single") {
      values = values[0] === value ? [] : [value];
    } else if (values.includes(value)) {
      values = values.filter((current) => current !== value);
    } else {
      values.push(value);
    }

    this.el.dataset.value = values.join(",");
    this.sync();

    const eventName = this.el.dataset.onValueChange;
    if (eventName) this.pushEvent(eventName, { value: type === "single" ? values[0] || null : values });
  },

  onKeyDown(event) {
    const keys = ["ArrowRight", "ArrowDown", "ArrowLeft", "ArrowUp", "Home", "End"];
    if (!keys.includes(event.key)) return;

    const enabled = this.items().filter((item) => !item.disabled);
    const current = enabled.indexOf(document.activeElement);
    if (current === -1) return;

    event.preventDefault();

    const loop = this.el.dataset.loop !== "false";
    let next = current;

    if (event.key === "Home") next = 0;
    else if (event.key === "End") next = enabled.length - 1;
    else next += event.key === "ArrowLeft" || event.key === "ArrowUp" ? -1 : 1;

    if (next < 0) next = loop ? enabled.length - 1 : 0;
    if (next >= enabled.length) next = loop ? 0 : enabled.length - 1;
    enabled[next].focus();
  },
};
