import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Scroll Area Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "scroll_area");
  });

  test("renders viewport, scrollbars, and corner", async ({ page }) => {
    const root = page.locator("#scroll-area-primitive");
    const viewport = root.locator("[data-essence-scroll-area-viewport]");
    const vertical = root.locator(
      '[data-essence-scroll-area-scrollbar][data-orientation="vertical"]',
    );
    const horizontal = root.locator(
      '[data-essence-scroll-area-scrollbar][data-orientation="horizontal"]',
    );
    const corner = root.locator("[data-essence-scroll-area-corner]");

    await expect(viewport).toBeVisible();
    await expect(viewport).toHaveAttribute("tabindex", "0");
    await expect(vertical).toBeVisible();
    await expect(vertical).toHaveAttribute("data-state", "visible");
    await expect(horizontal).toBeAttached();
    await expect(corner).toBeAttached();
    await expect(root).toHaveAttribute("data-type", "always");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
    expect(box.height).toBeGreaterThan(0);
  });

  test("updates vertical thumb on scroll", async ({ page }) => {
    const root = page.locator("#scroll-area-primitive");
    const viewport = root.locator("[data-essence-scroll-area-viewport]");
    const scrollbar = root.locator(
      '[data-essence-scroll-area-scrollbar][data-orientation="vertical"]',
    );
    const thumb = scrollbar.locator("[data-essence-scroll-area-thumb]");

    await expect(scrollbar).toHaveAttribute("data-state", "visible");

    const thumbHeight = await thumb.evaluate((el) => el.style.height);
    expect(thumbHeight).toMatch(/^\d+(\.\d+)?px$/);

    await viewport.evaluate((el) => {
      el.scrollTop = 80;
    });

    await expect
      .poll(async () => thumb.evaluate((el) => el.style.transform))
      .toMatch(/translateY\(/);
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#scroll-area-primitive");
    await expect(
      root.locator("[data-essence-scroll-area-viewport]"),
    ).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#scroll-area-primitive",
    });
  });
});
