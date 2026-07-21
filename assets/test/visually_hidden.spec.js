import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Visually Hidden Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "visually_hidden");
  });

  test("hides text visually while keeping it for assistive tech", async ({
    page,
  }) => {
    const demo = page.locator('.radix-demo[data-component="visually-hidden"]');
    const btn = demo.locator("button");
    const hidden = btn.locator("span").filter({ hasText: "the document" });

    await expect(btn).toBeVisible();
    await expect(btn).toContainText("Save");
    await expect(hidden).toBeAttached();
    await expect(hidden).toHaveCSS("position", "absolute");
    await expect(btn).toHaveAccessibleName(/Save\s+the document/i);
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="visually-hidden"]',
    });
  });
});
