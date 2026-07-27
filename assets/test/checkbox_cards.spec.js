import { test, expect } from "@playwright/test";
import { gotoTheme } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function waitForCheckboxGroupHook(root) {
  await expect(
    root.locator("[data-radix-checkbox-group-item][data-has-click]").first(),
  ).toBeVisible();
}

test.describe("Checkbox Cards Themes", () => {
  test("toggles card selection on click", async ({ page }) => {
    await gotoTheme(page, "checkbox_cards");
    const root = page.locator("#checkbox-cards-hero");
    await waitForCheckboxGroupHook(root);

    const item1 = root.locator(
      '[data-radix-checkbox-group-item][data-value="1"]',
    );
    const item2 = root.locator(
      '[data-radix-checkbox-group-item][data-value="2"]',
    );
    const card2 = root.locator(".rt-CheckboxCardsItem").nth(1);

    await expect(item1).toHaveAttribute("aria-checked", "true");

    await card2.click();
    await expect(item2).toHaveAttribute("aria-checked", "true");
    await expect(item1).toHaveAttribute("aria-checked", "true");

    await item1.click();
    await expect(item1).toHaveAttribute("aria-checked", "false");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoTheme(page, "checkbox_cards");
    const root = page.locator("#checkbox-cards-hero");
    await waitForCheckboxGroupHook(root);
    await expectNoA11yViolations(page, {
      include: "#checkbox-cards-hero",
    });
  });
});
