export const PasswordToggleFieldRoot = {
  mounted() {
    this.input = this.el.querySelector("[data-essence-password-toggle-input]");
    this.toggle = this.el.querySelector("[data-essence-password-toggle-toggle]");
    this._visible = this.el.dataset.visible === "true";

    this._onToggle = (event) => {
      event.preventDefault();
      this._setVisible(!this._visible);

      // Pointer toggles return focus to the input; keyboard keeps focus on the button
      if (event.detail !== 0 && this.input) {
        this.input.focus();
      }
    };

    this._onFormSubmit = () => {
      // Reset to hidden after submit to avoid accidental storage of visible passwords
      this._setVisible(false);
    };

    this.toggle?.addEventListener("click", this._onToggle);

    const form = this.input?.form || this.el.closest("form");
    if (form) {
      form.addEventListener("submit", this._onFormSubmit);
      this._form = form;
    }

    this._sync();
  },

  updated() {
    if (this.el.dataset.visible != null) {
      this._visible = this.el.dataset.visible === "true";
    }
    this._sync();
  },

  destroyed() {
    this.toggle?.removeEventListener("click", this._onToggle);
    this._form?.removeEventListener("submit", this._onFormSubmit);
  },

  _setVisible(visible) {
    if (this._visible === visible) return;
    this._visible = visible;
    this.el.dataset.visible = String(visible);
    this._sync();

    const event = this.el.dataset.onVisibilityChange;
    if (event) this.pushEvent(event, { visible });
  },

  _sync() {
    if (this.input) {
      this.input.type = this._visible ? "text" : "password";
    }

    if (this.toggle) {
      this.toggle.setAttribute("aria-pressed", String(this._visible));
      this.toggle.setAttribute(
        "aria-label",
        this._visible ? "Hide password" : "Show password",
      );
    }

    const icons = this.el.querySelectorAll("[data-essence-password-toggle-icon]");
    for (const icon of icons) {
      const isVisibleIcon = icon.hasAttribute("data-visible");
      const isHiddenIcon = icon.hasAttribute("data-hidden");
      let shouldHide = false;
      if (isVisibleIcon && !isHiddenIcon) {
        shouldHide = !this._visible;
      } else if (isHiddenIcon) {
        shouldHide = this._visible;
      }
      icon.hidden = shouldHide;
      icon.style.display = shouldHide ? "none" : "";
    }
  },
};
