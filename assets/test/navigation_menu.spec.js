import { test, expect, devices } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Navigation Menu Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "navigation_menu");
    await expect(page.locator("#nav-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens content on trigger click and closes on escape", async ({
    page,
  }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#learn-trigger");
    const content = page.locator("#learn-content");

    await expect(content).toBeHidden();
    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expect(page.locator("#nav-primitive")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#nav-primitive",
    });
  });
});

test.describe("Navigation Menu Primitive (touch)", () => {
  test.use({ ...devices["iPhone 12"] });

  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "navigation_menu");
    await expect(page.locator("#nav-primitive[data-hydrated]")).toBeVisible();
  });

  test("tap opens Learn and keeps it open past hover delay", async ({
    page,
  }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#learn-trigger");
    const content = page.locator("#learn-content");

    await expect(content).toBeHidden();
    await trigger.tap();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    // Hover delay is 200ms; stay open well past that window (no blink).
    await page.waitForTimeout(350);
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
  });

  test("second tap closes Learn", async ({ page }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#learn-trigger");
    const content = page.locator("#learn-content");

    await trigger.tap();
    await expect(content).toBeVisible();

    await trigger.tap();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("outside tap closes Overview", async ({ page }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#overview-trigger");
    const content = page.locator("#overview-content");

    await trigger.tap();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    await page.locator("body").tap({ position: { x: 10, y: 10 } });
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });
});
