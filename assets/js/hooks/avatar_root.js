export const AvatarRoot = {
  mounted() {
    this.timer = null;
    this.status = "idle";
    this.sync = this.sync.bind(this);
    this.image = this.el.querySelector("[data-essence-avatar-image]");
    this.fallback = this.el.querySelector("[data-essence-avatar-fallback]");

    if (this.image) {
      this.image.addEventListener("load", this.sync);
      this.image.addEventListener("error", this.sync);
    }

    this.sync();
  },

  updated() {
    this.sync();
  },

  destroyed() {
    clearTimeout(this.timer);

    if (this.image) {
      this.image.removeEventListener("load", this.sync);
      this.image.removeEventListener("error", this.sync);
    }
  },

  sync() {
    clearTimeout(this.timer);

    const status = this.loadingStatus();
    const loaded = status === "loaded";

    this.setStatus(status);
    if (this.image) this.image.style.display = loaded ? "" : "none";
    if (!this.fallback) return;

    this.fallback.style.display = "none";
    if (loaded) return;

    const delay = Number(this.fallback.dataset.delayMs || 0);
    this.timer = setTimeout(() => {
      this.fallback.style.display = "";
    }, delay);
  },

  loadingStatus() {
    if (!this.image || !this.image.getAttribute("src")) return "error";
    if (!this.image.complete) return "loading";
    return this.image.naturalWidth > 0 ? "loaded" : "error";
  },

  setStatus(status) {
    this.el.dataset.status = status;
    if (this.status === status) return;

    this.status = status;
    const event = this.image?.dataset.onLoadingStatusChange;
    if (event) this.pushEvent(event, { status });
  },
};
