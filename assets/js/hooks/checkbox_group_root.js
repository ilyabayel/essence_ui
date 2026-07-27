/**
 * CheckboxGroupRoot Hook
 *
 * Multi-select group with roving focus (Radix CheckboxGroup primitive parity).
 */
export const CheckboxGroupRoot = {
  mounted() {
    this.onItemClick = this.onItemClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);

    this.el.addEventListener("keydown", this.onKeyDown);
    this.syncValue();
  },

  updated() {
    this.syncValue();
  },

  parseValue() {
    const raw = this.el.getAttribute("data-value");
    if (!raw) return [];
    try {
      const parsed = JSON.parse(raw);
      return Array.isArray(parsed) ? parsed.map(String) : [];
    } catch {
      return raw
        .split(",")
        .map((v) => v.trim())
        .filter(Boolean);
    }
  },

  syncValue() {
    const currentValues = this.parseValue();
    const items = Array.from(
      this.el.querySelectorAll("[data-radix-checkbox-group-item]"),
    );
    const isRootDisabled = this.el.hasAttribute("data-disabled");
    const name = this.el.getAttribute("data-name");
    const isRequired = this.el.hasAttribute("data-required");

    const enabledItems = items.filter((item) => {
      const isItemDisabled = item.hasAttribute("data-disabled");
      return !(isItemDisabled || isRootDisabled);
    });

    // Roving tabindex: first checked enabled item, else first enabled item
    let focusTarget = enabledItems.find((item) =>
      currentValues.includes(item.getAttribute("data-value")),
    );
    if (!focusTarget) focusTarget = enabledItems[0];

    items.forEach((item) => {
      const itemValue = item.getAttribute("data-value");
      const isSelected = currentValues.includes(itemValue);
      const isItemDisabled = item.hasAttribute("data-disabled");
      const isDisabled = isItemDisabled || isRootDisabled;

      item.setAttribute("aria-checked", isSelected.toString());
      item.setAttribute(
        "tabindex",
        item === focusTarget && !isDisabled ? "0" : "-1",
      );
      item.setAttribute("data-state", isSelected ? "checked" : "unchecked");

      if (isRootDisabled) {
        item.setAttribute("disabled", "disabled");
      } else if (!isItemDisabled) {
        item.removeAttribute("disabled");
      }

      const indicator = item.querySelector(
        "[data-radix-checkbox-group-indicator]",
      );
      if (indicator) {
        const forceMount = indicator.hasAttribute("data-force-mount");
        indicator.style.display =
          isSelected || forceMount ? "flex" : "none";
        indicator.setAttribute(
          "data-state",
          isSelected ? "checked" : "unchecked",
        );
      }

      const input =
        item.nextElementSibling?.matches?.(
          "input[data-radix-checkbox-group-input]",
        )
          ? item.nextElementSibling
          : this.el.querySelector(
              `input[data-radix-checkbox-group-input][value="${CSS.escape(itemValue)}"]`,
            );

      if (input) {
        input.checked = isSelected;
        if (isSelected) input.setAttribute("checked", "");
        else input.removeAttribute("checked");
        input.disabled = isDisabled;
        if (name) input.name = name;
        else input.removeAttribute("name");
        input.required = isRequired;
      }

      if (!item.hasAttribute("data-has-click")) {
        item.addEventListener("click", this.onItemClick);
        item.setAttribute("data-has-click", "true");
      }
    });
  },

  onItemClick(e) {
    const item = e.currentTarget;
    const isRootDisabled = this.el.hasAttribute("data-disabled");
    const isItemDisabled = item.hasAttribute("data-disabled");
    if (isItemDisabled || isRootDisabled) return;

    const value = item.getAttribute("data-value");
    this.toggleValue(value);
  },

  toggleValue(value) {
    const current = this.parseValue();
    const next = current.includes(value)
      ? current.filter((v) => v !== value)
      : [...current, value];

    this.el.setAttribute("data-value", JSON.stringify(next));
    this.syncValue();

    const onValueChange = this.el.getAttribute("data-on-value-change");
    if (onValueChange) {
      this.pushEvent(onValueChange, { value: next });
    }
  },

  onKeyDown(e) {
    if (this.el.hasAttribute("data-disabled")) return;

    const items = Array.from(
      this.el.querySelectorAll("[data-radix-checkbox-group-item]"),
    );
    const enabledItems = items.filter((item) => {
      const isDisabled =
        item.hasAttribute("data-disabled") || item.hasAttribute("disabled");
      return !isDisabled;
    });
    if (enabledItems.length === 0) return;

    const currentIndex = enabledItems.indexOf(document.activeElement);
    const isHorizontal =
      this.el.getAttribute("data-orientation") === "horizontal";
    const loop = this.el.getAttribute("data-loop") !== "false";

    // Space/Enter toggle focused item (do not select-on-arrow like radios)
    if (e.key === " " || e.key === "Enter") {
      if (currentIndex === -1) return;
      e.preventDefault();
      this.toggleValue(enabledItems[currentIndex].getAttribute("data-value"));
      return;
    }

    let nextIndex = -1;
    switch (e.key) {
      case "ArrowDown":
      case "ArrowRight":
        if (isHorizontal && e.key === "ArrowDown") return;
        if (!isHorizontal && e.key === "ArrowRight") return;
        e.preventDefault();
        nextIndex = currentIndex + 1;
        if (nextIndex >= enabledItems.length)
          nextIndex = loop ? 0 : enabledItems.length - 1;
        break;
      case "ArrowUp":
      case "ArrowLeft":
        if (isHorizontal && e.key === "ArrowUp") return;
        if (!isHorizontal && e.key === "ArrowLeft") return;
        e.preventDefault();
        nextIndex = currentIndex - 1;
        if (nextIndex < 0) nextIndex = loop ? enabledItems.length - 1 : 0;
        break;
      case "Home":
        e.preventDefault();
        nextIndex = 0;
        break;
      case "End":
        e.preventDefault();
        nextIndex = enabledItems.length - 1;
        break;
      default:
        return;
    }

    if (nextIndex !== -1) {
      enabledItems[nextIndex].focus();
    }
  },

  destroyed() {
    this.el.removeEventListener("keydown", this.onKeyDown);
  },
};
