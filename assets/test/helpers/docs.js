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
 * Wait until LiveView hooks inside the main LiveView have mounted.
 * Layout chrome hooks (e.g. AppearanceToggle) sit outside LV and never get data-phx-id.
 * @param {import('@playwright/test').Page} page
 */
async function waitForDocsHooks(page) {
  await page.waitForFunction(() => {
    const root =
      document.querySelector("[data-phx-main]") ||
      document.querySelector("[data-phx-session]");
    if (!root) return false;
    const hooks = Array.from(root.querySelectorAll("[phx-hook]"));
    if (hooks.length === 0) return true;
    return hooks.every((el) => el.hasAttribute("data-phx-id"));
  });
}
