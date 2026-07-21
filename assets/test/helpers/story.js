/**
 * Navigate to a Phoenix Storybook primitive variation.
 * @param {import('@playwright/test').Page} page
 * @param {string} name kebab or snake story path segment (e.g. "dialog", "radio_group")
 * @param {string} [variation="primitive"]
 */
export async function gotoPrimitive(page, name, variation = "primitive") {
  const path = `/primitives/${name}?variation_id=${variation}`;
  await page.goto(path);
  await page.waitForLoadState("domcontentloaded");
}

/**
 * Navigate to a Phoenix Storybook component variation.
 * @param {import('@playwright/test').Page} page
 * @param {string} name
 * @param {string} [variation]
 */
export async function gotoComponent(page, name, variation) {
  const qs = variation ? `?variation_id=${variation}` : "";
  await page.goto(`/components/${name}${qs}`);
  await page.waitForLoadState("domcontentloaded");
}
