import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Progress Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "progress");
  });

  test("exposes progressbar semantics and loading state", async ({ page }) => {
    const demo = page.locator('.radix-demo[data-component="progress"]');
    const bar = demo.locator('[role="progressbar"]');

    await expect(bar).toHaveAttribute("aria-valuemin", "0");
    await expect(bar).toHaveAttribute("aria-valuemax", "100");
    await expect(bar).toHaveAttribute("aria-valuenow", "66");
    await expect(bar).toHaveAttribute("aria-valuetext", "66%");
    await expect(bar).toHaveAttribute("data-state", "loading");
    await expect(bar).toHaveAttribute("data-value", "66");

    const box = await bar.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="progress"]',
    });
  });
});
