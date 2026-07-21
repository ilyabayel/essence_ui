function isAllowedChar(char, validationType) {
  if (!char) return false;
  if (validationType === "none") return char.length === 1;
  if (validationType === "alphanumeric") return /^[a-zA-Z0-9]$/.test(char);
  return /^[0-9]$/.test(char);
}

function sanitize(value, validationType, length) {
  const chars = Array.from(value || "").filter((ch) =>
    isAllowedChar(ch, validationType),
  );
  return chars.slice(0, length).join("");
}

export const OneTimePasswordFieldRoot = {
  mounted() {
    this._completed = false;
    this._bind();
    this._syncFromInputs();
    this.el.setAttribute("data-hydrated", "");
  },

  updated() {
    this._bind();
    if (this.el.dataset.value != null) {
      this._setValue(this.el.dataset.value, { silent: true, fromServer: true });
    }
  },

  destroyed() {
    this._unbind();
  },

  _bind() {
    this._unbind();
    this.inputs = Array.from(
      this.el.querySelectorAll("[data-essence-otp-input]"),
    ).sort((a, b) => Number(a.dataset.index) - Number(b.dataset.index));
    this.hidden = this.el.querySelector("[data-essence-otp-hidden]");

    this._onInput = (event) => this._handleInput(event);
    this._onKeyDown = (event) => this._handleKeyDown(event);
    this._onPaste = (event) => this._handlePaste(event);
    this._onFocus = (event) => {
      event.target.select?.();
    };

    for (const input of this.inputs) {
      input.addEventListener("input", this._onInput);
      input.addEventListener("keydown", this._onKeyDown);
      input.addEventListener("paste", this._onPaste);
      input.addEventListener("focus", this._onFocus);
    }
  },

  _unbind() {
    if (!this.inputs) return;
    for (const input of this.inputs) {
      input.removeEventListener("input", this._onInput);
      input.removeEventListener("keydown", this._onKeyDown);
      input.removeEventListener("paste", this._onPaste);
      input.removeEventListener("focus", this._onFocus);
    }
  },

  _length() {
    return Number(this.el.dataset.length) || this.inputs.length || 6;
  },

  _validationType() {
    return this.el.dataset.validationType || "numeric";
  },

  _disabled() {
    return this.el.hasAttribute("data-disabled") || this.el.hasAttribute("data-readonly");
  },

  _readValue() {
    return this.inputs.map((input) => input.value || "").join("");
  },

  _setValue(value, { silent = false, fromServer = false } = {}) {
    const next = sanitize(value, this._validationType(), this._length());
    const chars = Array.from(next);

    this.inputs.forEach((input, index) => {
      input.value = chars[index] || "";
    });

    if (this.hidden) this.hidden.value = next;
    this.el.dataset.value = next;

    if (!silent) {
      const onChange = this.el.dataset.onValueChange;
      if (onChange) this.pushEvent(onChange, { value: next });
    }

    if (!fromServer) this._maybeComplete(next);
  },

  _syncFromInputs() {
    const value = this._readValue();
    if (this.hidden) this.hidden.value = value;
    this.el.dataset.value = value;
  },

  _maybeComplete(value) {
    const length = this._length();
    if (value.length === length) {
      if (!this._completed) {
        this._completed = true;
        const onComplete = this.el.dataset.onComplete;
        if (onComplete) this.pushEvent(onComplete, { value });

        if (this.el.dataset.autoSubmit === "true") {
          const form = this.hidden?.form || this.el.closest("form");
          form?.requestSubmit?.() || form?.submit?.();
        }
      }
    } else {
      this._completed = false;
    }
  },

  _focusIndex(index) {
    const input = this.inputs[index];
    if (input) {
      input.focus();
      input.select?.();
    }
  },

  _handleInput(event) {
    if (this._disabled()) return;

    const input = event.target;
    const index = Number(input.dataset.index);
    const validationType = this._validationType();
    let raw = input.value || "";

    // Some browsers insert the full OTP into one field
    if (raw.length > 1) {
      this._setValue(raw);
      const nextIndex = Math.min(raw.length, this._length()) - 1;
      this._focusIndex(Math.max(nextIndex, 0));
      return;
    }

    const char = raw.slice(-1);
    if (char && !isAllowedChar(char, validationType)) {
      input.value = "";
      this._syncFromInputs();
      return;
    }

    input.value = char;
    this._syncFromInputs();

    const value = this._readValue();
    this.el.dataset.value = value;
    if (this.hidden) this.hidden.value = value;

    const onChange = this.el.dataset.onValueChange;
    if (onChange) this.pushEvent(onChange, { value });

    if (char && index < this.inputs.length - 1) {
      this._focusIndex(index + 1);
    }

    this._maybeComplete(value);
  },

  _handleKeyDown(event) {
    if (this._disabled()) return;

    const input = event.target;
    const index = Number(input.dataset.index);
    const orientation = this.el.dataset.orientation || "horizontal";
    const nextKey = orientation === "vertical" ? "ArrowDown" : "ArrowRight";
    const prevKey = orientation === "vertical" ? "ArrowUp" : "ArrowLeft";

    switch (event.key) {
      case "Backspace": {
        event.preventDefault();
        if (input.value) {
          input.value = "";
          this._syncFromInputs();
          const value = this._readValue();
          this.el.dataset.value = value;
          if (this.hidden) this.hidden.value = value;
          this._completed = false;
          const onChange = this.el.dataset.onValueChange;
          if (onChange) this.pushEvent(onChange, { value });
        } else if (index > 0) {
          this._focusIndex(index - 1);
          const prev = this.inputs[index - 1];
          if (prev) {
            prev.value = "";
            this._syncFromInputs();
            const value = this._readValue();
            this.el.dataset.value = value;
            if (this.hidden) this.hidden.value = value;
            this._completed = false;
            const onChange = this.el.dataset.onValueChange;
            if (onChange) this.pushEvent(onChange, { value });
          }
        }
        break;
      }
      case "Delete": {
        event.preventDefault();
        input.value = "";
        // Shift later values back
        for (let i = index; i < this.inputs.length - 1; i++) {
          this.inputs[i].value = this.inputs[i + 1].value;
        }
        this.inputs[this.inputs.length - 1].value = "";
        this._syncFromInputs();
        this._completed = false;
        const value = this._readValue();
        const onChange = this.el.dataset.onValueChange;
        if (onChange) this.pushEvent(onChange, { value });
        break;
      }
      case nextKey: {
        event.preventDefault();
        this._focusIndex(index + 1);
        break;
      }
      case prevKey: {
        event.preventDefault();
        this._focusIndex(index - 1);
        break;
      }
      case "Home": {
        event.preventDefault();
        this._focusIndex(0);
        break;
      }
      case "End": {
        event.preventDefault();
        this._focusIndex(this.inputs.length - 1);
        break;
      }
      case "Enter": {
        const form = this.hidden?.form || this.el.closest("form");
        if (form) {
          event.preventDefault();
          form.requestSubmit?.() || form.submit?.();
        }
        break;
      }
      default: {
        // Cmd/Ctrl+Backspace clears all
        if (
          (event.metaKey || event.ctrlKey) &&
          (event.key === "Backspace" || event.key === "Delete")
        ) {
          event.preventDefault();
          this._setValue("");
          this._focusIndex(0);
        }
      }
    }
  },

  _handlePaste(event) {
    if (this._disabled()) return;
    event.preventDefault();
    const text = event.clipboardData?.getData("text") || "";
    this._setValue(text);
    const filled = Math.min(sanitize(text, this._validationType(), this._length()).length, this._length());
    this._focusIndex(Math.max(filled - 1, 0));
  },
};
