export const AppearanceToggle = {
  mounted() {
    this.syncIcon();
    this.el.addEventListener("click", () => {
      const root = document.documentElement;
      const dark = root.classList.contains("dark-theme");
      root.classList.remove("light-theme", "dark-theme", "light", "dark");
      if (dark) {
        root.classList.add("light-theme", "light");
        localStorage.setItem("essence-appearance", "light");
      } else {
        root.classList.add("dark-theme", "dark");
        localStorage.setItem("essence-appearance", "dark");
      }
      this.syncIcon();
    });
  },
  syncIcon() {
    const dark = document.documentElement.classList.contains("dark-theme");
    this.el.dataset.appearance = dark ? "dark" : "light";
  },
};

export function bootAppearance() {
  const stored = localStorage.getItem("essence-appearance");
  const root = document.documentElement;
  root.classList.remove("light-theme", "dark-theme", "light", "dark");
  if (stored === "dark") {
    root.classList.add("dark-theme", "dark");
  } else if (stored === "light") {
    root.classList.add("light-theme", "light");
  } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    root.classList.add("dark-theme", "dark");
  } else {
    root.classList.add("light-theme", "light");
  }
}

export const CopyCode = {
  mounted() {
    const btn = this.el.querySelector("[data-copy]");
    const code = this.el.querySelector("code");
    if (!btn || !code) return;
    btn.addEventListener("click", async () => {
      await navigator.clipboard.writeText(code.innerText);
      const prev = btn.textContent;
      btn.textContent = "Copied";
      setTimeout(() => {
        btn.textContent = prev;
      }, 1500);
    });
  },
};

export const Clipboard = {
  mounted() {
    this.handleEvent("copy_to_clipboard", ({ text }) => {
      navigator.clipboard.writeText(text);
    });
    this.handleEvent("set_appearance", ({ appearance }) => {
      const root = document.documentElement;
      if (appearance === "dark") {
        root.classList.remove("light-theme", "light");
        root.classList.add("dark-theme", "dark");
        localStorage.setItem("essence-appearance", "dark");
      } else if (appearance === "light") {
        root.classList.remove("dark-theme", "dark");
        root.classList.add("light-theme", "light");
        localStorage.setItem("essence-appearance", "light");
      }
    });
  },
};
