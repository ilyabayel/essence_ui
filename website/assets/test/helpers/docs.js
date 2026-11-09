/**
 * Navigate to a primitives docs page with live demos.
 * @param {import('@playwright/test').Page} page
 * @param {string} name kebab or snake path segment (e.g. "dialog", "radio_group")
 * @param {string} [_variation] ignored — docs pages host all demos on one URL
 */
const PRIMITIVE_UTILITIES = new Set([
  "accessible_icon",
  "direction_provider",
  "slot",
  "visually_hidden",
]);

export async function gotoPrimitive(page, name, _variation) {
  const kebab = name.replaceAll("_", "-");
  const section = PRIMITIVE_UTILITIES.has(name) ? "utilities" : "components";
  await page.goto(`/primitives/docs/${section}/${kebab}`);
  await page.waitForLoadState("domcontentloaded");
  await waitForDocsHooks(page);
}

/**
 * Navigate to a themes docs component page.
 * @param {import('@playwright/test').Page} page
 * @param {string} name kebab or snake path segment
 */
export async function gotoTheme(page, name) {
  const kebab = name.replaceAll("_", "-");
  await page.goto(`/themes/docs/components/${kebab}`);
  await page.waitForLoadState("domcontentloaded");
  await waitForDocsHooks(page);
}

/**
 * Wait until the docs LiveView has connected and tagged the hooks it owns.
 * Chrome controls and hooks rendered through raw HTML sit inside the same
 * root but never receive `data-phx-id`.
 * @param {import('@playwright/test').Page} page
 */
async function waitForDocsHooks(page) {
  await page.waitForFunction(() => {
    const root =
      document.querySelector("[data-phx-main]") ||
      document.querySelector("[data-phx-session]");
    if (!root || !window.liveSocket?.isConnected?.()) return false;
    const hooks = Array.from(root.querySelectorAll("[phx-hook]"));
    if (hooks.length === 0) return true;
    return hooks.some((el) => el.hasAttribute("data-phx-id"));
  });
}
