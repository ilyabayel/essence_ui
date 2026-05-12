export const CheckboxRoot = {
  mounted() {
    this.trigger = this.el; // Now the hook is on the button itself
    this.indicator = this.el.querySelector("[data-essence-checkbox-indicator]");

    // Find input as sibling or via parent
    this.input = this.el.nextElementSibling?.hasAttribute(
      "data-essence-checkbox-input",
    )
      ? this.el.nextElementSibling
      : this.el.parentElement?.querySelector("[data-essence-checkbox-input]");

    this._initialState = this.el.dataset.state;
    this._updateState();

    this._onClick = (event) => {
      if (this.el.dataset.disabled === "true") return;

      const currentState = this.el.dataset.state;
      const nextChecked =
        currentState === "indeterminate" ? true : currentState !== "checked";

      this._setChecked(nextChecked);

      // Stop propagation if there's an input, so we only bubble the input's change/click
      if (this.input && !event.defaultPrevented) {
        event.stopPropagation();
      }
    };

    this._onKeyDown = (event) => {
      // According to WAI ARIA, Checkboxes don't activate on enter keypress
      if (event.key === "Enter") event.preventDefault();
    };

    this.trigger.addEventListener("click", this._onClick);
    this.trigger.addEventListener("keydown", this._onKeyDown);

    const form = this.trigger.form || this.el.closest("form");
    if (form) {
      this._onFormReset = () => {
        const initialState = this._initialState;
        const initialChecked =
          initialState === "indeterminate"
            ? "indeterminate"
            : initialState === "checked";
        this._setChecked(initialChecked);
      };
      form.addEventListener("reset", this._onFormReset);
    }

    // Measure size and apply to input (Radix logic)
    if (this.input) {
      this._resizeObserver = new ResizeObserver(() => {
        const rect = this.trigger.getBoundingClientRect();
        this.input.style.width = `${rect.width}px`;
        this.input.style.height = `${rect.height}px`;
      });
      this._resizeObserver.observe(this.trigger);
    }
  },

  updated() {
    this._updateState();
  },

  destroyed() {
    this.trigger.removeEventListener("click", this._onClick);
    this.trigger.removeEventListener("keydown", this._onKeyDown);

    const form = this.trigger.form || this.el.closest("form");
    if (form && this._onFormReset) {
      form.removeEventListener("reset", this._onFormReset);
    }

    this._resizeObserver?.disconnect();
  },

  _updateState() {
    const state = this.el.dataset.state;
    const disabled = this.el.dataset.disabled === "true";

    this.trigger.setAttribute(
      "aria-checked",
      state === "indeterminate"
        ? "mixed"
        : state === "checked"
          ? "true"
          : "false",
    );
    this.trigger.setAttribute(
      "aria-required",
      this.el.dataset.required === "true" ? "true" : "false",
    );
    this.trigger.dataset.state = state;

    if (disabled) {
      this.trigger.setAttribute("disabled", "");
      this.trigger.dataset.disabled = "";
    } else {
      this.trigger.removeAttribute("disabled");
      delete this.trigger.dataset.disabled;
    }

    if (this.indicator) {
      this.indicator.dataset.state = state;
      if (disabled) {
        this.indicator.dataset.disabled = "";
      } else {
        delete this.indicator.dataset.disabled;
      }

      const isPresent = state === "checked" || state === "indeterminate";
      this.indicator.style.display = isPresent ? "" : "none";
    }

    if (this.input) {
      this.input.checked = state === "checked";
      this.input.indeterminate = state === "indeterminate";
      this.input.disabled = disabled;

      if (this.el.dataset.name) this.input.name = this.el.dataset.name;
      if (this.el.dataset.value) this.input.value = this.el.dataset.value;
      if (this.el.dataset.required === "true") this.input.required = true;
      if (this.el.dataset.form)
        this.input.setAttribute("form", this.el.dataset.form);
    }
  },

  _setChecked(checked) {
    const newState =
      checked === "indeterminate"
        ? "indeterminate"
        : checked
          ? "checked"
          : "unchecked";

    if (this.el.dataset.state === newState) return;

    this.el.dataset.state = newState;
    this._updateState();

    const onCheckedChange = this.el.dataset.onCheckedChange;
    if (onCheckedChange) {
      this.pushEvent(onCheckedChange, { checked: checked });
    }

    if (this.input) {
      const event = new Event("click", { bubbles: true });
      this.input.dispatchEvent(event);
    }
  },
};
