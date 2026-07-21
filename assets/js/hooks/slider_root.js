export const SliderRoot = {
  mounted() {
    this.onPointerDown = this.onPointerDown.bind(this);
    this.onPointerMove = this.onPointerMove.bind(this);
    this.onPointerUp = this.onPointerUp.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);

    this.el.addEventListener("pointerdown", this.onPointerDown);
    this.el.addEventListener("keydown", this.onKeyDown);

    this.values = this.parseValues(this.el.dataset.value);
    this.activeIndex = null;
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
    return Array.from(this.el.querySelectorAll("[data-essence-slider-thumb]"));
  },

  track() {
    return this.el.querySelector("[data-essence-slider-track]");
  },

  range() {
    return this.el.querySelector("[data-essence-slider-range]");
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

      if (orientation === "horizontal") {
        thumb.style.left = `${pct}%`;
        thumb.style.top = "";
        thumb.style.bottom = "";
      } else {
        thumb.style.bottom = `${pct}%`;
        thumb.style.left = "";
        thumb.style.top = "";
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

      this.el.style.setProperty("--essence-slider-range-start", `${start}%`);
      this.el.style.setProperty("--essence-slider-range-end", `${end}%`);
      this.el.style.setProperty("--radix-slider-range-start", `${start}%`);
      this.el.style.setProperty("--radix-slider-range-end", `${end}%`);

      if (orientation === "horizontal") {
        range.style.left = `${start}%`;
        range.style.right = `${100 - end}%`;
        range.style.bottom = "";
        range.style.top = "";
      } else {
        range.style.bottom = `${start}%`;
        range.style.top = `${100 - end}%`;
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

    let container = this.el.querySelector("[data-essence-slider-inputs]");
    if (!container) {
      container = document.createElement("span");
      container.setAttribute("data-essence-slider-inputs", "");
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
      ratio = (event.clientX - rect.left) / rect.width;
      if (this.el.dir === "rtl") ratio = 1 - ratio;
    } else {
      ratio = 1 - (event.clientY - rect.top) / rect.height;
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

    const thumb = event.target.closest("[data-essence-slider-thumb]");
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

  onKeyDown(event) {
    if (this.disabled()) return;

    const thumb = event.target.closest("[data-essence-slider-thumb]");
    if (!thumb || !this.el.contains(thumb)) return;

    const index = Number(thumb.dataset.index ?? this.thumbs().indexOf(thumb));
    const step = this.step();
    const bigStep = step * 10;
    let next = this.values[index];

    switch (event.key) {
      case "ArrowRight":
      case "ArrowUp":
        next += step;
        break;
      case "ArrowLeft":
      case "ArrowDown":
        next -= step;
        break;
      case "PageUp":
        next += bigStep;
        break;
      case "PageDown":
        next -= bigStep;
        break;
      case "Home":
        next = this.min();
        break;
      case "End":
        next = this.max();
        break;
      default:
        return;
    }

    event.preventDefault();
    this.setValueAt(index, next, true);
  },
};
