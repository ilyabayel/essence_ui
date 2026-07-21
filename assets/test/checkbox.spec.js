import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Checkbox Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "checkbox");
  });

  test("starts checked and toggles on click and Space", async ({ page }) => {
    const demo = page.locator('.radix-demo[data-component="checkbox"]');
    const trigger = demo.locator("#c1[data-essence-checkbox-trigger]");
    const indicator = demo.locator("[data-essence-checkbox-indicator]");

    await expect(trigger).toHaveAttribute("role", "checkbox");
    await expect(trigger).toHaveAttribute("aria-checked", "true");
    await expect(trigger).toHaveAttribute("data-state", "checked");
    await expect(indicator).toBeVisible();

    await trigger.click();
    await expect(trigger).toHaveAttribute("aria-checked", "false");
    await expect(trigger).toHaveAttribute("data-state", "unchecked");

    await trigger.focus();
    await page.keyboard.press("Space");
    await expect(trigger).toHaveAttribute("aria-checked", "true");
    await expect(trigger).toHaveAttribute("data-state", "checked");
  });

  test("Enter does not toggle (WAI-ARIA checkbox)", async ({ page }) => {
    const trigger = page.locator("#c1[data-essence-checkbox-trigger]");
    await expect(trigger).toHaveAttribute("aria-checked", "true");
    await trigger.focus();
    await page.keyboard.press("Enter");
    await expect(trigger).toHaveAttribute("aria-checked", "true");
  });

  test("label click toggles checkbox", async ({ page }) => {
    const demo = page.locator('.radix-demo[data-component="checkbox"]');
    const trigger = demo.locator("#c1");
    const label = demo.locator('label[for="c1"]');

    await expect(trigger).toHaveAttribute("aria-checked", "true");
    await label.click();
    await expect(trigger).toHaveAttribute("aria-checked", "false");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="checkbox"]',
    });
  });
});
