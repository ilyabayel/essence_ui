/**
 * Isolate primitive demo markup + CSS in an open Shadow DOM.
 *
 * Defers attach until after a microtask so descendant LiveView hooks
 * (AccordionRoot, etc.) mount while still in the light DOM.
 */
export const DocsDemoFrame = {
  mounted() {
    queueMicrotask(() => this.attachShadowFrame());
  },

  attachShadowFrame() {
    if (this.el.shadowRoot) return;

    const canvasCss = this.el.dataset.canvasCss || "";
    const demoCss = this.el.dataset.demoCss || "";
    const shadow = this.el.attachShadow({ mode: "open" });

    if (canvasCss) {
      const style = document.createElement("style");
      style.textContent = canvasCss;
      shadow.appendChild(style);
    }

    if (demoCss) {
      const style = document.createElement("style");
      style.textContent = demoCss;
      shadow.appendChild(style);
    }

    while (this.el.firstChild) {
      shadow.appendChild(this.el.firstChild);
    }
  },
};
