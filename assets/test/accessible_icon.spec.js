import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Accessible Icon Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "accessible_icon");
  });

  test("hides decorative icon and exposes label", async ({ page }) => {
    const demo = page.locator('.radix-demo[data-component="accessible-icon"]');
    const btn = demo.locator("button.IconButton");
    const iconWrap = btn.locator('span[aria-hidden="true"]');
    const sr = btn.locator("span").filter({ hasText: "Close" });

    await expect(iconWrap).toHaveAttribute("focusable", "false");
    await expect(sr).toBeAttached();
    await expect(btn).toHaveAccessibleName("Close");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="accessible-icon"]',
    });
  });
});
