/**
 * Inherit Essence UI theme tokens onto portaled overlay content.
 *
 * Matches Radix Themes behavior: portalled Content is wrapped in Theme so
 * CSS variables (--space-*, --color-panel-solid, --shadow-*, etc.) resolve.
 *
 * @param {Element} el - Portaled content element
 * @param {Element} source - Element still inside the theme tree (trigger/root)
 */
export function applyPortalTheme(el, source) {
  if (!el || !source) return;

  const theme = source.closest(".essence-ui");
  // Already under a theme ancestor in the live DOM (not portaled away).
  if (theme && theme.contains(el)) return;

  el.classList.add("essence-ui");

  for (const attr of [
    "data-accent-color",
    "data-gray-color",
    "data-scaling",
    "data-radius",
  ]) {
    const current = el.getAttribute(attr);
    if (current) continue;

    const donor = source.closest(`[${attr}]`);
    const value = donor?.getAttribute(attr);
    if (value) el.setAttribute(attr, value);
  }
}
