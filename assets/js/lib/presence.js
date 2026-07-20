/**
 * Marks an element as open (data-state="open") and clears hidden styling.
 *
 * @param {Element} el
 * @param {Element[]} [extras] - Additional elements to set data-state on
 */
export function setOpen(el, extras = []) {
  if (!el) return;

  el.dataset.state = "open";
  el.style.display = "";
  el.hidden = false;

  extras.forEach((extra) => {
    if (extra) extra.dataset.state = "open";
  });
}

/**
 * Marks an element as closed. Optionally waits for animation before hiding.
 *
 * @param {Element} el
 * @param {object} [options]
 * @param {Element[]} [options.extras] - Additional elements to set data-state on
 * @param {number} [options.animationDelay] - ms to wait before hiding (skips animationend)
 * @param {boolean} [options.waitForAnimation=true] - Wait for animationend before hiding
 * @param {() => boolean} [options.shouldHide] - Return false to cancel hide (e.g. re-opened)
 */
export function setClosed(el, options = {}) {
  if (!el) return;

  const {
    extras = [],
    animationDelay,
    waitForAnimation = true,
    shouldHide = () => true,
  } = options;

  el.dataset.state = "closed";
  extras.forEach((extra) => {
    if (extra) extra.dataset.state = "closed";
  });

  const hide = () => {
    if (!shouldHide()) return;
    el.style.display = "none";
    el.hidden = true;
  };

  if (typeof animationDelay === "number") {
    setTimeout(hide, animationDelay);
    return;
  }

  if (!waitForAnimation) {
    hide();
    return;
  }

  const onAnimationEnd = () => {
    el.removeEventListener("animationend", onAnimationEnd);
    hide();
  };
  el.addEventListener("animationend", onAnimationEnd);
}
