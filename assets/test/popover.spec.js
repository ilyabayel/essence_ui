import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Popover Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "popover");
    await expect(page.locator("#popover-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens and closes on trigger click", async ({ page }) => {
    const root = page.locator("#popover-primitive");
    const trigger = root.locator("[data-essence-popover-trigger]");
    const content = page.locator("#popover-content");

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
    await expect(trigger).toHaveAttribute("aria-label", "Update dimensions");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
    await expect(trigger).toHaveAttribute("data-state", "open");
    await expect(content).toHaveAttribute("data-state", "open");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("closes on escape and close button", async ({ page }) => {
    const root = page.locator("#popover-primitive");
    const trigger = root.locator("[data-essence-popover-trigger]");
    const content = page.locator("#popover-content");
    const close = content.locator("[data-essence-popover-close]");

    await trigger.click();
    await expect(content).toBeVisible();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await close.click();
    await expect(content).toBeHidden();
  });

  test("closes on outside click", async ({ page }) => {
    const root = page.locator("#popover-primitive");
    const trigger = root.locator("[data-essence-popover-trigger]");
    const content = page.locator("#popover-content");

    await trigger.click();
    await expect(content).toBeVisible();

    // Click a neutral page point away from trigger/content (avoid storybook chrome).
    await page.mouse.click(8, 120);
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#popover-primitive");
    const trigger = root.locator("[data-essence-popover-trigger]");
    await trigger.click();
    await expect(page.locator("#popover-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="popover"]',
    });
  });
});
