import { test, expect } from "@playwright/test";
import { gotoTheme } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function waitForCheckboxGroupHook(root) {
  await expect(
    root.locator("[data-radix-checkbox-group-item][data-has-click]").first(),
  ).toBeVisible();
}

test.describe("Checkbox Group Themes", () => {
  test("toggles items and supports multi-select", async ({ page }) => {
    await gotoTheme(page, "checkbox_group");
    const root = page.locator("[data-radix-checkbox-group-root]").first();
    await waitForCheckboxGroupHook(root);

    const option1 = root.locator(
      '[data-radix-checkbox-group-item][data-value="1"]',
    );
    const option2 = root.locator(
      '[data-radix-checkbox-group-item][data-value="2"]',
    );

    await expect(option1).toHaveAttribute("aria-checked", "true");
    await expect(option2).toHaveAttribute("aria-checked", "false");

    await option2.click();
    await expect(option1).toHaveAttribute("aria-checked", "true");
    await expect(option2).toHaveAttribute("aria-checked", "true");

    await option1.click();
    await expect(option1).toHaveAttribute("aria-checked", "false");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoTheme(page, "checkbox_group");
    const root = page.locator("[data-radix-checkbox-group-root]").first();
    await waitForCheckboxGroupHook(root);
    await expectNoA11yViolations(page, {
      include: '[data-radix-checkbox-group-root]',
    });
  });
});
