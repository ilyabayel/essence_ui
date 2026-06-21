export const ToggleRoot = {
  mounted() {
    this.onClick = this.onClick.bind(this);
    this.el.addEventListener("click", this.onClick);
  },

  destroyed() {
    this.el.removeEventListener("click", this.onClick);
  },

  onClick() {
    if (this.el.disabled) return;

    const pressed = this.el.dataset.state !== "on";
    this.el.dataset.state = pressed ? "on" : "off";
    this.el.setAttribute("aria-pressed", String(pressed));

    const event = this.el.dataset.onPressedChange;
    if (event) this.pushEvent(event, { pressed });
  },
};
