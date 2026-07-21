import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Direction Provider Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "direction_provider");
  });

  test("applies rtl direction to descendants", async ({ page }) => {
    const demo = page.locator(
      '.radix-demo[data-component="direction-provider"]',
    );
    const root = demo.locator('[dir="rtl"]');
    await expect(root).toBeVisible();
    await expect(root).toContainText("من اليمين إلى اليسار");
    await expect(root).toHaveCSS("direction", "rtl");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="direction-provider"]',
    });
  });
});
