import { test, expect } from "@playwright/test";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function gotoThemesCheckboxGroup(page, variation = "default") {
  await page.goto(
    `/storybook/themes/components/checkbox_group?variation_id=${variation}`,
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
    root.locator("[data-radix-checkbox-group-item][data-has-click]").first(),
  ).toBeVisible();
}

test.describe("Checkbox Group Themes", () => {
  test("toggles items and supports multi-select", async ({ page }) => {
    await gotoThemesCheckboxGroup(page);
    const root = page.locator("[data-radix-checkbox-group-root]").first();
    await waitForCheckboxGroupHook(root);

    const option1 = root.locator(
      '[data-radix-checkbox-group-item][data-value="option1"]',
    );
    const option2 = root.locator(
      '[data-radix-checkbox-group-item][data-value="option2"]',
    );

    await expect(option2).toHaveAttribute("aria-checked", "true");
    await expect(option1).toHaveAttribute("aria-checked", "false");

    await option1.click();
    await expect(option1).toHaveAttribute("aria-checked", "true");
    await expect(option2).toHaveAttribute("aria-checked", "true");

    await option2.click();
    await expect(option2).toHaveAttribute("aria-checked", "false");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoThemesCheckboxGroup(page);
    const root = page.locator("#checkbox-group-themes-default");
    await waitForCheckboxGroupHook(root);
    await expectNoA11yViolations(page, {
      include: "#checkbox-group-themes-default",
    });
  });
});
