/**
 * ToastViewport — focus region / hotkey (F8 by default, matching Radix).
 */
export const ToastViewport = {
  mounted() {
    this._onKeyDown = (event) => {
      const hotkey = this.el.dataset.hotkey || "F8";
      if (event.key === hotkey && !event.metaKey && !event.ctrlKey && !event.altKey) {
        event.preventDefault();
        this.el.focus();
      }
    };

    document.addEventListener("keydown", this._onKeyDown);
  },

  destroyed() {
    document.removeEventListener("keydown", this._onKeyDown);
  },
};
