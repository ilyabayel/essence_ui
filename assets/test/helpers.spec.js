import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Playwright helpers", () => {
  test("gotoPrimitive loads a storybook variation", async ({ page }) => {
    await gotoPrimitive(page, "label");
    await expect(page.locator("label").first()).toBeVisible();
  });

  test("expectNoA11yViolations runs axe on a simple story", async ({ page }) => {
    await gotoPrimitive(page, "label");
    const demo = page.locator('.radix-demo[data-component="label"]');
    await expect(demo.locator("label").first()).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="label"]',
    });
  });
});
