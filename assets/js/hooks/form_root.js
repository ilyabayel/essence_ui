const VALIDITY_KEYS = [
  "valueMissing",
  "typeMismatch",
  "patternMismatch",
  "tooLong",
  "tooShort",
  "rangeUnderflow",
  "rangeOverflow",
  "stepMismatch",
  "badInput",
  "customError",
  "valid",
];

function findControl(field) {
  const name = field.dataset.name;
  const scoped = field.querySelector("[data-essence-form-control]");
  const root = scoped || field;

  if (name) {
    const byName = root.querySelector(
      `input[name="${CSS.escape(name)}"], select[name="${CSS.escape(name)}"], textarea[name="${CSS.escape(name)}"]`,
    );
    if (byName) return byName;
  }

  return root.querySelector("input, select, textarea");
}

function findFields(form) {
  return Array.from(form.querySelectorAll("[data-essence-form-field]"));
}

function findMessages(form, field) {
  const name = field.dataset.name;
  const inField = Array.from(field.querySelectorAll("[data-essence-form-message]"));
  const outside = Array.from(
    form.querySelectorAll(`[data-essence-form-message][data-name="${CSS.escape(name)}"]`),
  ).filter((el) => !field.contains(el));
  return [...inField, ...outside];
}

function findValidityStates(form, field) {
  const name = field.dataset.name;
  const inField = Array.from(field.querySelectorAll("[data-essence-form-validity-state]"));
  const outside = Array.from(
    form.querySelectorAll(
      `[data-essence-form-validity-state][data-name="${CSS.escape(name)}"]`,
    ),
  ).filter((el) => !field.contains(el));
  return [...inField, ...outside];
}

function syncField(form, field) {
  const control = findControl(field);
  const serverInvalid = field.hasAttribute("data-server-invalid");
  const validity = control?.validity;
  const clientInvalid = control ? !control.validity.valid : false;
  const invalid = serverInvalid || clientInvalid;

  if (control) {
    associateLabel(field, control);
  }

  if (invalid) {
    field.setAttribute("data-invalid", "");
  } else {
    field.removeAttribute("data-invalid");
  }

  if (control) {
    if (invalid) {
      control.setAttribute("aria-invalid", "true");
      control.setAttribute("data-invalid", "");
    } else {
      control.removeAttribute("aria-invalid");
      control.removeAttribute("data-invalid");
    }
  }

  for (const message of findMessages(form, field)) {
    const match = message.dataset.match;
    const forceMatch = message.hasAttribute("data-force-match");
    let show = false;

    if (forceMatch) {
      show = true;
    } else if (!match) {
      show = invalid;
    } else if (VALIDITY_KEYS.includes(match)) {
      show = Boolean(validity?.[match]);
    } else {
      // Custom match name (e.g. server error key) — show when server-invalid
      show = serverInvalid;
    }

    message.hidden = !show;
  }

  for (const stateEl of findValidityStates(form, field)) {
    stateEl.dataset.valid = validity ? String(validity.valid) : "true";
    for (const key of VALIDITY_KEYS) {
      if (key === "valid") continue;
      stateEl.dataset[key] = validity ? String(Boolean(validity[key])) : "false";
    }
    if (invalid) {
      stateEl.setAttribute("data-invalid", "");
    } else {
      stateEl.removeAttribute("data-invalid");
    }
  }
}

function associateLabel(field, control) {
  if (!control.id) {
    const name = field.dataset.name || "field";
    control.id = `essence-form-${name}-${Math.random().toString(36).slice(2, 9)}`;
  }

  const labels = Array.from(field.querySelectorAll("[data-essence-form-label]"));
  for (const label of labels) {
    if (!label.getAttribute("for")) {
      label.setAttribute("for", control.id);
    }
  }
}

function syncForm(form) {
  for (const field of findFields(form)) {
    syncField(form, field);
  }
}

function formIsValid(form) {
  return findFields(form).every((field) => {
    if (field.hasAttribute("data-server-invalid")) return false;
    const control = findControl(field);
    return !control || control.validity.valid;
  });
}

export const FormRoot = {
  mounted() {
    this._onSubmit = (event) => {
      syncForm(this.el);
      if (!formIsValid(this.el)) {
        event.preventDefault();
        const firstInvalid = findFields(this.el).find((field) => {
          if (field.hasAttribute("data-server-invalid")) return true;
          const control = findControl(field);
          return control && !control.validity.valid;
        });
        findControl(firstInvalid)?.focus?.();
      }
    };

    this._onInvalid = (event) => {
      event.preventDefault();
      const field = event.target.closest?.("[data-essence-form-field]");
      if (field) syncField(this.el, field);
      else syncForm(this.el);
    };

    this._onInput = (event) => {
      const field = event.target.closest?.("[data-essence-form-field]");
      if (field) {
        // Clear server invalid once the user edits
        field.removeAttribute("data-server-invalid");
        syncField(this.el, field);
      }
    };

    this._onBlur = (event) => {
      const field = event.target.closest?.("[data-essence-form-field]");
      if (field) syncField(this.el, field);
    };

    this.el.addEventListener("submit", this._onSubmit);
    this.el.addEventListener("invalid", this._onInvalid, true);
    this.el.addEventListener("input", this._onInput);
    this.el.addEventListener("change", this._onInput);
    this.el.addEventListener("blur", this._onBlur, true);

    syncForm(this.el);
  },

  updated() {
    syncForm(this.el);
  },

  destroyed() {
    this.el.removeEventListener("submit", this._onSubmit);
    this.el.removeEventListener("invalid", this._onInvalid, true);
    this.el.removeEventListener("input", this._onInput);
    this.el.removeEventListener("change", this._onInput);
    this.el.removeEventListener("blur", this._onBlur, true);
  },
};
