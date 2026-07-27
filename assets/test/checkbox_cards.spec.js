import { test, expect } from "@playwright/test";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function gotoThemesCheckboxCards(page, variation = "default") {
  await page.goto(
    `/storybook/themes/components/checkbox_cards?variation_id=${variation}`,
  );
  await page.waitForLoadState("domcontentloaded");
  await page.waitForFunction(() => {
    const hooks = Array.from(document.querySelectorAll("[phx-hook]")).filter(
      (el) => !el.id?.startsWith("psb-"),
    );
    if (hooks.length === 0) return true;
    return hooks.every((el) => el.hasAttribute("data-phx-id"));
  });
}

async function waitForCheckboxGroupHook(root) {
  await expect(
    root.locator("[data-essence-checkbox-group-item][data-has-click]").first(),
  ).toBeVisible();
}

test.describe("Checkbox Cards Themes", () => {
  test("toggles card selection on click", async ({ page }) => {
    await gotoThemesCheckboxCards(page);
    const root = page.locator("[data-essence-checkbox-group-root]").first();
    await waitForCheckboxGroupHook(root);

    const item1 = root.locator(
      '[data-essence-checkbox-group-item][data-value="1"]',
    );
    const item2 = root.locator(
      '[data-essence-checkbox-group-item][data-value="2"]',
    );
    const card2 = root.locator(".est-CheckboxCardsItem").nth(1);

    await expect(item1).toHaveAttribute("aria-checked", "true");

    await card2.click();
    await expect(item2).toHaveAttribute("aria-checked", "true");
    await expect(item1).toHaveAttribute("aria-checked", "true");

    await card2.click();
    await expect(item2).toHaveAttribute("aria-checked", "false");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoThemesCheckboxCards(page);
    const root = page.locator("#checkbox-cards-default");
    await waitForCheckboxGroupHook(root);
    await expectNoA11yViolations(page, {
      include: "#checkbox-cards-default",
    });
  });
});
