export const AccordionRoot = {
  mounted() {
    this.onClick = this.onClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.el.addEventListener("click", this.onClick, true);
    this.el.addEventListener("keydown", this.onKeyDown);
    this.sync();
  },

  updated() {
    this.sync();
  },

  destroyed() {
    this.el.removeEventListener("click", this.onClick, true);
    this.el.removeEventListener("keydown", this.onKeyDown);
  },

  items() {
    return Array.from(this.el.querySelectorAll("[data-essence-accordion-item]"));
  },

  values() {
    return (this.el.dataset.value || "").split(",").filter(Boolean);
  },

  sync() {
    const orientation = this.el.dataset.orientation || "vertical";
    const values = this.values();
    const rootControlsValue = this.el.hasAttribute("data-value");
    const disabled = this.el.hasAttribute("data-disabled");

    this.items().forEach((item) => {
      const open = rootControlsValue ? values.includes(item.dataset.value) : item.dataset.state === "open";
      const itemDisabled = disabled || item.dataset.disabled === "true";

      item.dataset.orientation = orientation;
      if (disabled) item.dataset.disabled = "true";
      this.setItemOpen(item, open);

      item.querySelectorAll("[data-essence-accordion-header], [data-essence-accordion-trigger], [data-essence-accordion-content]").forEach((node) => {
        node.dataset.orientation = orientation;
        node.dataset.state = open ? "open" : "closed";
        if (itemDisabled) node.dataset.disabled = "";
      });
    });

    this.syncTriggerLocks();
  },

  onClick(event) {
    if (this.el.hasAttribute("data-disabled")) {
      event.preventDefault();
      event.stopImmediatePropagation();
      return;
    }

    const trigger = event.target.closest("[data-essence-accordion-trigger]");
    if (!trigger || !this.el.contains(trigger)) return;

    const item = trigger.closest("[data-essence-accordion-item]");
    if (!item || item.dataset.disabled === "true") return;

    // Accordion owns open state; prevent CollapsibleRoot from also toggling.
    event.preventDefault();
    event.stopImmediatePropagation();

    const type = this.el.dataset.type || "single";
    const collapsible = this.el.dataset.collapsible === "true";
    const value = item.dataset.value;
    const open = item.dataset.state === "open";
    let values = this.values();

    if (type === "single") {
      if (open && !collapsible) {
        return;
      }

      values = open ? [] : [value];
    } else if (open) {
      values = values.filter((current) => current !== value);
    } else {
      values.push(value);
    }

    this.el.dataset.value = values.join(",");
    this.sync();
    this.pushValueChange(values);
  },

  onKeyDown(event) {
    const trigger = event.target.closest("[data-essence-accordion-trigger]");
    if (!trigger || !this.el.contains(trigger)) return;

    const triggers = this.items()
      .filter((item) => item.dataset.disabled !== "true")
      .map((item) => item.querySelector("[data-essence-accordion-trigger]"))
      .filter(Boolean);

    const current = triggers.indexOf(trigger);
    if (current === -1) return;

    const vertical = (this.el.dataset.orientation || "vertical") === "vertical";
    const ltr = (this.el.getAttribute("dir") || "ltr") === "ltr";
    let next = current;

    switch (event.key) {
      case "Home":
        next = 0;
        break;
      case "End":
        next = triggers.length - 1;
        break;
      case "ArrowDown":
        if (!vertical) return;
        next = current + 1;
        break;
      case "ArrowUp":
        if (!vertical) return;
        next = current - 1;
        break;
      case "ArrowRight":
        if (vertical) return;
        next = current + (ltr ? 1 : -1);
        break;
      case "ArrowLeft":
        if (vertical) return;
        next = current + (ltr ? -1 : 1);
        break;
      default:
        return;
    }

    event.preventDefault();
    if (next < 0) next = triggers.length - 1;
    if (next >= triggers.length) next = 0;
    triggers[next].focus();
  },

  setItemOpen(item, open) {
    item.dataset.state = open ? "open" : "closed";
    item.dispatchEvent(
      new CustomEvent(open ? "essence:collapsible:open" : "essence:collapsible:close", {
        bubbles: false,
      }),
    );
  },

  syncTriggerLocks() {
    const single = (this.el.dataset.type || "single") === "single";
    const collapsible = this.el.dataset.collapsible === "true";

    this.items().forEach((item) => {
      const trigger = item.querySelector("[data-essence-accordion-trigger]");
      if (!trigger) return;

      if (single && !collapsible && item.dataset.state === "open") {
        trigger.setAttribute("aria-disabled", "true");
      } else {
        trigger.removeAttribute("aria-disabled");
      }
    });
  },

  pushValueChange(values) {
    const event = this.el.dataset.onValueChange;
    if (!event) return;

    const value = (this.el.dataset.type || "single") === "single" ? values[0] || "" : values;
    this.pushEvent(event, { value });
  },
};
