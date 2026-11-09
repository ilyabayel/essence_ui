export const SliderRoot = {
  mounted() {
    this.onPointerDown = this.onPointerDown.bind(this);
    this.onPointerMove = this.onPointerMove.bind(this);
    this.onPointerUp = this.onPointerUp.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);

    this.el.addEventListener("pointerdown", this.onPointerDown);
    this.el.addEventListener("keydown", this.onKeyDown);

    this.values = this.parseValues(this.el.dataset.value);
    this.initialValues = [...this.values];
    this.activeIndex = null;
    this.onFormReset = () => {
      this.values = [...this.initialValues];
      this.sync();
    };
    this.bindFormReset();
    this.sync();
  },

  updated() {
    this.values = this.parseValues(this.el.dataset.value);
    this.sync();
  },

  destroyed() {
    this.el.removeEventListener("pointerdown", this.onPointerDown);
    this.el.removeEventListener("keydown", this.onKeyDown);
    window.removeEventListener("pointermove", this.onPointerMove);
    window.removeEventListener("pointerup", this.onPointerUp);
    this._form?.removeEventListener("reset", this.onFormReset);
  },

  bindFormReset() {
    const form = this.el.closest("form");
    if (this._form === form) return;
    this._form?.removeEventListener("reset", this.onFormReset);
    this._form = form;
    form?.addEventListener("reset", this.onFormReset);
  },

  parseValues(raw) {
    if (!raw) return [0];
    try {
      const parsed = JSON.parse(raw);
      if (Array.isArray(parsed)) return parsed.map(Number);
    } catch (_e) {
      // fall through to space/comma separated
    }
    return raw
      .split(/[\s,]+/)
      .filter(Boolean)
      .map(Number);
  },

  encodeValues(values) {
    return JSON.stringify(values);
  },

  min() {
    return Number(this.el.dataset.min ?? 0);
  },

  max() {
    return Number(this.el.dataset.max ?? 100);
  },

  step() {
    return Number(this.el.dataset.step ?? 1);
  },

  orientation() {
    return this.el.dataset.orientation || "horizontal";
  },

  disabled() {
    return this.el.hasAttribute("data-disabled");
  },

  thumbs() {
    return Array.from(this.el.querySelectorAll("[data-radix-slider-thumb]"));
  },

  track() {
    return this.el.querySelector("[data-radix-slider-track]");
  },

  range() {
    return this.el.querySelector("[data-radix-slider-range]");
  },

  percent(value) {
    const min = this.min();
    const max = this.max();
    const range = max - min || 1;
    return ((value - min) / range) * 100;
  },

  clamp(value) {
    const min = this.min();
    const max = this.max();
    const step = this.step();
    const clamped = Math.min(max, Math.max(min, value));
    const stepped = Math.round((clamped - min) / step) * step + min;
    return Math.min(max, Math.max(min, stepped));
  },

  sync() {
    const thumbs = this.thumbs();
    const orientation = this.orientation();
    const disabled = this.disabled();

    // Ensure we have values for each thumb
    while (this.values.length < thumbs.length) {
      this.values.push(this.min());
    }
    if (thumbs.length > 0) {
      this.values = this.values.slice(0, thumbs.length);
    }

    this.values = this.values.map((v) => this.clamp(v));
    this.el.dataset.value = this.encodeValues(this.values);

    thumbs.forEach((thumb, index) => {
      const value = this.values[index] ?? this.min();
      const pct = this.percent(value);
      thumb.setAttribute("aria-valuemin", String(this.min()));
      thumb.setAttribute("aria-valuemax", String(this.max()));
      thumb.setAttribute("aria-valuenow", String(value));
      thumb.setAttribute("aria-orientation", orientation);
      thumb.dataset.orientation = orientation;
      thumb.tabIndex = disabled ? -1 : 0;
      if (disabled) thumb.setAttribute("data-disabled", "");
      else thumb.removeAttribute("data-disabled");

      thumb.style.position = "absolute";
      const horizontal = orientation === "horizontal";
      const fromStart = horizontal ? this.slidingFromLeft() : !this.inverted();
      if (horizontal) {
        thumb.style.left = fromStart ? `${pct}%` : "";
        thumb.style.right = fromStart ? "" : `${pct}%`;
        thumb.style.top = "";
        thumb.style.bottom = "";
        thumb.style.transform = "translateX(-50%)";
      } else {
        thumb.style.bottom = fromStart ? `${pct}%` : "";
        thumb.style.top = fromStart ? "" : `${pct}%`;
        thumb.style.left = "";
        thumb.style.right = "";
        thumb.style.transform = "translateY(50%)";
      }
    });

    const range = this.range();
    if (range) {
      const pcts = this.values.map((v) => this.percent(v));
      let start;
      let end;
      if (pcts.length >= 2) {
        start = Math.min(...pcts);
        end = Math.max(...pcts);
      } else {
        start = 0;
        end = pcts[0] ?? 0;
      }

      this.el.style.setProperty("--radix-slider-range-start", `${start}%`);
      this.el.style.setProperty("--radix-slider-range-end", `${end}%`);
      this.el.style.setProperty("--radix-slider-range-start", `${start}%`);
      this.el.style.setProperty("--radix-slider-range-end", `${end}%`);

      const horizontal = orientation === "horizontal";
      const fromStart = horizontal ? this.slidingFromLeft() : !this.inverted();
      if (horizontal) {
        range.style.left = fromStart ? `${start}%` : `${100 - end}%`;
        range.style.right = fromStart ? `${100 - end}%` : `${start}%`;
        range.style.bottom = "";
        range.style.top = "";
      } else {
        range.style.bottom = fromStart ? `${start}%` : `${100 - end}%`;
        range.style.top = fromStart ? `${100 - end}%` : `${start}%`;
        range.style.left = "";
        range.style.right = "";
      }
      range.dataset.orientation = orientation;
    }

    // Sync hidden inputs if name is set
    this.syncInputs();
  },

  syncInputs() {
    const name = this.el.dataset.name;
    if (!name) return;

    let container = this.el.querySelector("[data-radix-slider-inputs]");
    if (!container) {
      container = document.createElement("span");
      container.setAttribute("data-radix-slider-inputs", "");
      container.style.display = "contents";
      this.el.appendChild(container);
    }

    const multi = this.values.length > 1;
    container.innerHTML = "";
    this.values.forEach((value) => {
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = multi ? `${name}[]` : name;
      input.value = String(value);
      container.appendChild(input);
    });
  },

  valueFromPointer(event) {
    const track = this.track() || this.el;
    const rect = track.getBoundingClientRect();
    const orientation = this.orientation();
    let ratio;

    if (orientation === "horizontal") {
      ratio = (event.clientX - rect.left) / (rect.width || 1);
      if (!this.slidingFromLeft()) ratio = 1 - ratio;
    } else if (!this.inverted()) {
      ratio = 1 - (event.clientY - rect.top) / (rect.height || 1);
    } else {
      ratio = (event.clientY - rect.top) / (rect.height || 1);
    }

    ratio = Math.min(1, Math.max(0, ratio));
    return this.clamp(this.min() + ratio * (this.max() - this.min()));
  },

  closestThumbIndex(value) {
    let best = 0;
    let bestDist = Infinity;
    this.values.forEach((v, i) => {
      const dist = Math.abs(v - value);
      if (dist < bestDist) {
        bestDist = dist;
        best = i;
      }
    });
    return best;
  },

  setValueAt(index, value, notify = false) {
    const next = [...this.values];
    next[index] = this.clamp(value);

    // Keep thumbs ordered when multiple
    if (next.length > 1) {
      const minSteps = Number(this.el.dataset.minStepsBetweenThumbs || 0);
      const minGap = minSteps * this.step();
      if (index > 0 && next[index] < next[index - 1] + minGap) {
        next[index] = next[index - 1] + minGap;
      }
      if (index < next.length - 1 && next[index] > next[index + 1] - minGap) {
        next[index] = next[index + 1] - minGap;
      }
    }

    this.values = next.map((v) => this.clamp(v));
    this.el.dataset.value = this.encodeValues(this.values);
    this.sync();

    if (notify) {
      const eventName = this.el.dataset.onValueChange;
      if (eventName) this.pushEvent(eventName, { value: this.values });
    }
  },

  onPointerDown(event) {
    if (this.disabled()) return;
    if (event.button !== 0) return;

    const thumb = event.target.closest("[data-radix-slider-thumb]");
    const value = this.valueFromPointer(event);
    this.activeIndex = thumb
      ? Number(thumb.dataset.index ?? this.thumbs().indexOf(thumb))
      : this.closestThumbIndex(value);

    this.setValueAt(this.activeIndex, value, true);
    this.thumbs()[this.activeIndex]?.focus();

    window.addEventListener("pointermove", this.onPointerMove);
    window.addEventListener("pointerup", this.onPointerUp);
    event.preventDefault();
  },

  onPointerMove(event) {
    if (this.activeIndex == null) return;
    this.setValueAt(this.activeIndex, this.valueFromPointer(event), true);
  },

  onPointerUp() {
    this.activeIndex = null;
    window.removeEventListener("pointermove", this.onPointerMove);
    window.removeEventListener("pointerup", this.onPointerUp);
  },

  inverted() {
    return this.el.hasAttribute("data-inverted");
  },

  /**
   * Horizontal value grows from the left unless `dir="rtl"` or `inverted`
   * flips it. Both together cancel out, matching Radix.
   */
  slidingFromLeft() {
    const rtl = (this.el.getAttribute("dir") || "ltr") === "rtl";
    const inverted = this.inverted();
    return rtl ? inverted : !inverted;
  },

  backKeys() {
    if (this.orientation() === "vertical") {
      return this.inverted()
        ? ["PageDown", "ArrowUp", "ArrowLeft"]
        : ["PageDown", "ArrowDown", "ArrowLeft"];
    }
    return this.slidingFromLeft()
      ? ["PageDown", "ArrowDown", "ArrowLeft"]
      : ["PageDown", "ArrowDown", "ArrowRight"];
  },

  onKeyDown(event) {
    if (this.disabled()) return;

    const thumb = event.target.closest("[data-radix-slider-thumb]");
    if (!thumb || !this.el.contains(thumb)) return;

    const index = Number(thumb.dataset.index ?? this.thumbs().indexOf(thumb));

    if (event.key === "Home") {
      event.preventDefault();
      this.setValueAt(0, this.min(), true);
      return;
    }

    if (event.key === "End") {
      event.preventDefault();
      this.setValueAt(this.values.length - 1, this.max(), true);
      return;
    }

    const keys = [
      "ArrowRight",
      "ArrowLeft",
      "ArrowUp",
      "ArrowDown",
      "PageUp",
      "PageDown",
    ];
    if (!keys.includes(event.key)) return;

    event.preventDefault();
    const direction = this.backKeys().includes(event.key) ? -1 : 1;
    const multiplier =
      event.shiftKey || event.key === "PageUp" || event.key === "PageDown"
        ? 10
        : 1;
    this.setValueAt(index, this.values[index] + direction * this.step() * multiplier, true);
  },
};
