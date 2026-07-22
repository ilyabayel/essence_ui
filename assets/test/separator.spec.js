import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Separator Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "separator");
  });

  test("renders semantic horizontal and decorative vertical separators", async ({
    page,
  }) => {
    const demo = page.locator('.radix-demo[data-component="separator"]');
    const semantic = demo.locator('[role="separator"]');
    await expect(semantic).toHaveCount(1);
    await expect(semantic).toHaveAttribute("data-orientation", "horizontal");
    await expect(semantic).toHaveAttribute("aria-orientation", "horizontal");

    const decorative = demo.locator(
      '[role="none"][data-orientation="vertical"]',
    );
    await expect(decorative).toHaveCount(2);
    await expect(decorative.first()).not.toHaveAttribute("aria-orientation");

    const box = await semantic.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(box.height);
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="separator"]',
    });
  });
});
