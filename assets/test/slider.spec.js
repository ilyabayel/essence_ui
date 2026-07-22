import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Slider Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "slider");
  });

  test("exposes slider semantics and default value", async ({ page }) => {
    const root = page.locator("#slider-primitive");
    const thumb = root.locator("[data-essence-slider-thumb]");
    const track = root.locator("[data-essence-slider-track]");
    const range = root.locator("[data-essence-slider-range]");

    await expect(thumb).toHaveAttribute("role", "slider");
    await expect(thumb).toHaveAttribute("aria-valuenow", "50");
    await expect(thumb).toHaveAttribute("aria-valuemin", "0");
    await expect(thumb).toHaveAttribute("aria-valuemax", "100");
    await expect(thumb).toHaveAttribute("aria-label", "Volume");
    await expect(root).toHaveAttribute("data-orientation", "horizontal");
    await expect(track).toBeVisible();
    await expect(range).toBeVisible();

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
    expect(box.height).toBeGreaterThan(0);
  });

  test("updates value with keyboard arrows, Home, and End", async ({
    page,
  }) => {
    const root = page.locator("#slider-primitive");
    const thumb = root.locator("[data-essence-slider-thumb]");

    await expect(thumb).toHaveAttribute("aria-valuenow", "50");

    await thumb.focus();
    await page.keyboard.press("ArrowRight");
    await expect(thumb).toHaveAttribute("aria-valuenow", "51");

    await page.keyboard.press("ArrowLeft");
    await expect(thumb).toHaveAttribute("aria-valuenow", "50");

    await page.keyboard.press("Home");
    await expect(thumb).toHaveAttribute("aria-valuenow", "0");

    await page.keyboard.press("End");
    await expect(thumb).toHaveAttribute("aria-valuenow", "100");

    const start = await root.evaluate((el) =>
      el.style.getPropertyValue("--essence-slider-range-start"),
    );
    const end = await root.evaluate((el) =>
      el.style.getPropertyValue("--essence-slider-range-end"),
    );
    expect(start).toBe("0%");
    expect(end).toBe("100%");
  });

  test("supports range thumbs", async ({ page }) => {
    await gotoPrimitive(page, "slider", "range");

    const root = page.locator("#slider-range");
    const thumbs = root.locator("[data-essence-slider-thumb]");

    await expect(thumbs).toHaveCount(2);
    await expect(thumbs.nth(0)).toHaveAttribute("aria-valuenow", "25");
    await expect(thumbs.nth(1)).toHaveAttribute("aria-valuenow", "75");
    await expect(thumbs.nth(0)).toHaveAttribute("aria-label", "Minimum");
    await expect(thumbs.nth(1)).toHaveAttribute("aria-label", "Maximum");
    await expect(root).toHaveAttribute("role", "group");

    await thumbs.nth(0).focus();
    await page.keyboard.press("ArrowRight");
    await expect(thumbs.nth(0)).toHaveAttribute("aria-valuenow", "26");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("has no accessibility violations", async ({ page }) => {
    const thumb = page.locator(
      "#slider-primitive [data-essence-slider-thumb]",
    );
    await expect(thumb).toHaveAttribute("aria-valuenow", "50");
    await expectNoA11yViolations(page, {
      include: "#slider-primitive",
    });
  });

  test("range variation has no accessibility violations", async ({ page }) => {
    await gotoPrimitive(page, "slider", "range");
    const thumbs = page.locator("#slider-range [data-essence-slider-thumb]");
    await expect(thumbs.nth(0)).toHaveAttribute("aria-valuenow", "25");
    await expect(thumbs.nth(1)).toHaveAttribute("aria-valuenow", "75");
    await expectNoA11yViolations(page, {
      include: "#slider-range",
    });
  });
});
