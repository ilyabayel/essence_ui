export const LabelRoot = {
  mounted() {
    this.onMouseDown = (event) => {
      if (event.target.closest("button, input, select, textarea")) return;
      if (!event.defaultPrevented && event.detail > 1) event.preventDefault();
    };

    this.el.addEventListener("mousedown", this.onMouseDown);
  },

  destroyed() {
    this.el.removeEventListener("mousedown", this.onMouseDown);
  },
};
