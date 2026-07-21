import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Tooltip Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "tooltip");
    await expect(page.locator("#tooltip-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens on hover after delay and closes on leave", async ({ page }) => {
    const root = page.locator("#tooltip-primitive");
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    const content = page.locator("#tooltip-content");

    await expect(content).toBeHidden();

    await trigger.hover();
    await expect(content).toBeVisible();
    await expect(content).toHaveAttribute("role", "tooltip");
    await expect(content).toHaveAttribute("data-state", "delayed-open");
    await expect(content).toContainText("Add to library");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);

    await page.mouse.move(0, 0);
    await expect(content).toBeHidden();
  });

  test("opens on focus and closes on escape", async ({ page }) => {
    const root = page.locator("#tooltip-primitive");
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    const content = page.locator("#tooltip-content");

    await trigger.focus();
    await expect(content).toBeVisible();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#tooltip-primitive");
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    await trigger.hover();
    await expect(page.locator("#tooltip-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="tooltip"]',
    });
  });
});
