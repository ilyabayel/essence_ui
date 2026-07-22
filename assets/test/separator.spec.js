import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";

test.describe("Separator Primitive", () => {
  /** Separator story uses Storybook iframe container. */
  function demo(page) {
    return page
      .frameLocator('iframe[id*="separator"]')
      .locator('.radix-demo[data-component="separator"]');
  }

  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "separator");
  });

  test("renders semantic horizontal and decorative vertical separators", async ({
    page,
  }) => {
    const root = demo(page);
    const semantic = root.locator('[role="separator"]');
    await expect(semantic).toHaveCount(1);
    await expect(semantic).toHaveAttribute("data-orientation", "horizontal");
    await expect(semantic).toHaveAttribute("aria-orientation", "horizontal");

    const decorative = root.locator(
      '[role="none"][data-orientation="vertical"]',
    );
    await expect(decorative).toHaveCount(2);
    await expect(decorative.first()).not.toHaveAttribute("aria-orientation");

    const box = await semantic.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(box.height);
  });

  test("has expected accessibility attributes", async ({ page }) => {
    const root = demo(page);
    const semantic = root.locator('[role="separator"]');
    await expect(semantic).toHaveAttribute("aria-orientation", "horizontal");
    await expect(
      root.locator('[role="none"][data-orientation="vertical"]').first(),
    ).not.toHaveAttribute("aria-orientation");
  });
});
