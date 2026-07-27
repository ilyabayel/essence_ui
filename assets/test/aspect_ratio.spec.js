import { test, expect } from "@playwright/test";
import { gotoPrimitive, gotoTheme } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Aspect Ratio Primitive", () => {
  test("enforces 16:9 layout on the docs demo", async ({ page }) => {
    await gotoPrimitive(page, "aspect_ratio");
    const demo = page.locator('.essence-demo[data-component="aspect-ratio"]');
    const wrapper = demo.locator("[data-radix-aspect-ratio-wrapper]");
    await expect(wrapper).toBeVisible();
    await expect(demo.locator("img")).toBeVisible();

    const box = await wrapper.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width / box.height).toBeCloseTo(16 / 9, 1);
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoPrimitive(page, "aspect_ratio");
    await expectNoA11yViolations(page, {
      include: '.essence-demo[data-component="aspect-ratio"]',
    });
  });
});

test.describe("Aspect Ratio Themes", () => {
  test("renders themed aspect ratio demo", async ({ page }) => {
    await gotoTheme(page, "aspect_ratio");
    await expect(page.locator("[data-radix-aspect-ratio-wrapper]").first()).toBeVisible();
  });
});
