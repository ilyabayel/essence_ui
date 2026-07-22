import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Avatar Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "avatar");
  });

  test("shows fallback when there is no image", async ({ page }) => {
    const root = page.locator("#avatar-3[data-essence-avatar-root]");
    const fallback = root.locator("[data-essence-avatar-fallback]");
    await expect(fallback).toBeVisible();
    await expect(fallback).toHaveText("PD");
    await expect(root).toHaveAttribute("data-status", "error");
  });

  test("loads image and hides fallback", async ({ page }) => {
    const root = page.locator("#avatar-1[data-essence-avatar-root]");
    const image = root.locator("[data-essence-avatar-image]");
    const fallback = root.locator("[data-essence-avatar-fallback]");

    await expect(image).toBeVisible({ timeout: 15_000 });
    await expect(root).toHaveAttribute("data-status", "loaded", {
      timeout: 15_000,
    });
    await expect(fallback).toBeHidden();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="avatar"]',
    });
  });
});
