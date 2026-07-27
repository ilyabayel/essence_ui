export const CheckboxRoot = {
  mounted() {
    this.trigger = this.el; // Now the hook is on the button itself
    this.indicator = this.el.querySelector("[data-radix-checkbox-indicator]");

    // Find input as sibling or via parent
    this.input = this.el.nextElementSibling?.hasAttribute(
      "data-radix-checkbox-input",
    )
      ? this.el.nextElementSibling
      : this.el.parentElement?.querySelector("[data-radix-checkbox-input]");

    this._initialState = this.el.dataset.state;
    this._updateState();

    this._onClick = (event) => {
      if (this.el.hasAttribute("data-disabled")) return;

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

    // Measure size and apply to input (size sync)
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
    const disabled = this.el.hasAttribute("data-disabled");

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

      // Match Radix Themes: Indicator Presence mounts only when checked/indeterminate.
      // Icon is a single SVG swapped by HEEx; hook only toggles indicator visibility.
      const isPresent = state === "checked" || state === "indeterminate";
      this.indicator.style.display = isPresent ? "flex" : "none";

      // When toggling between checked ↔ indeterminate after mount, swap icon in JS
      // so LiveView SSR icon matches current state without waiting for a re-render.
      this._syncIndicatorIcon(state);
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

  _syncIndicatorIcon(state) {
    if (!this.indicator || state === "unchecked") return;

    const wantIndeterminate = state === "indeterminate";
    const current = this.indicator.querySelector("svg");
    if (!current) return;

    // Heuristic: indeterminate icon is the horizontal bar (path starts near M0.75)
    const path = current.querySelector("path")?.getAttribute("d") || "";
    const isIndeterminateIcon = path.startsWith("M0.75");
    if (wantIndeterminate === isIndeterminateIcon) return;

    const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    svg.setAttribute("width", "9");
    svg.setAttribute("height", "9");
    svg.setAttribute("viewBox", "0 0 9 9");
    svg.setAttribute("fill", "currentcolor");
    const p = document.createElementNS("http://www.w3.org/2000/svg", "path");
    p.setAttribute("fill-rule", "evenodd");
    p.setAttribute("clip-rule", "evenodd");
    p.setAttribute(
      "d",
      wantIndeterminate
        ? "M0.75 4.5C0.75 4.08579 1.08579 3.75 1.5 3.75H7.5C7.91421 3.75 8.25 4.08579 8.25 4.5C8.25 4.91421 7.91421 5.25 7.5 5.25H1.5C1.08579 5.25 0.75 4.91421 0.75 4.5Z"
        : "M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z",
    );
    svg.appendChild(p);
    this.indicator.replaceChildren(svg);
  },
};
