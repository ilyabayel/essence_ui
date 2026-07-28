/**
 * Docs mobile nav drawer: inert when closed below the laptop breakpoint,
 * so off-canvas links are not in the tab order.
 */
const LAPTOP_MQ = "(min-width: 901px)";

export const DocsSidebar = {
  mounted() {
    this.mq = window.matchMedia(LAPTOP_MQ);
    this.onMq = () => this.sync();
    this.mq.addEventListener("change", this.onMq);
    this.sync();
  },

  updated() {
    this.sync();
  },

  destroyed() {
    this.mq?.removeEventListener("change", this.onMq);
  },

  sync() {
    const desktop = this.mq.matches;
    const open = this.el.classList.contains("is-open");
    this.el.inert = !desktop && !open;
    this.el.setAttribute("aria-hidden", desktop || open ? "false" : "true");
  },
};
