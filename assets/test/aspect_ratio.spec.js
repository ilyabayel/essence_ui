import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Aspect Ratio Primitive", () => {
  test("enforces 16:9 layout on the docs demo", async ({ page }) => {
    await gotoPrimitive(page, "aspect_ratio", "primitive");
    const demo = page.locator(
      '#primitive-component .radix-demo[data-component="aspect-ratio"]',
    );
    const wrapper = demo.locator("[data-radix-aspect-ratio-wrapper]");
    await expect(wrapper).toBeVisible();
    await expect(demo.locator("img.Image")).toBeVisible();

    const box = await wrapper.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width / box.height).toBeCloseTo(16 / 9, 1);
  });

  test("enforces 1:1 layout on the square variation", async ({ page }) => {
    await gotoPrimitive(page, "aspect_ratio", "square");
    const demo = page.locator(
      '#square-component .radix-demo[data-component="aspect-ratio"]',
    );
    await expect(demo.getByText("1:1")).toBeVisible();

    const wrapper = demo.locator("[data-radix-aspect-ratio-wrapper]");
    const box = await wrapper.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width / box.height).toBeCloseTo(1, 1);
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoPrimitive(page, "aspect_ratio", "primitive");
    await expectNoA11yViolations(page, {
      include: '#primitive-component .radix-demo[data-component="aspect-ratio"]',
    });
  });
});
