import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Hover Card Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "hover_card");
    await expect(
      page.locator("#hover-card-primitive[data-hydrated]"),
    ).toBeVisible();
  });

  test("opens on hover after delay and closes on leave", async ({ page }) => {
    const root = page.locator("#hover-card-primitive");
    const trigger = root.locator("[data-radix-hover-card-trigger]");
    const content = page.locator("#hover-card-content");

    await expect(content).toBeHidden();

    await trigger.hover();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("data-state", "open");
    await expect(content).toHaveAttribute("data-state", "open");
    await expect(content).toContainText("@essence_ui");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.mouse.move(0, 0);
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("stays open when moving from trigger to content", async ({ page }) => {
    const root = page.locator("#hover-card-primitive");
    const trigger = root.locator("[data-radix-hover-card-trigger]");
    const content = page.locator("#hover-card-content");

    await trigger.hover();
    await expect(content).toBeVisible();

    await content.hover();
    await expect(content).toBeVisible();
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#hover-card-primitive");
    const trigger = root.locator("[data-radix-hover-card-trigger]");
    await trigger.hover();
    await expect(page.locator("#hover-card-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.essence-demo[data-component="hover-card"]',
    });
  });
});

test.describe("Hover Card Primitive (touch)", () => {
  test.use({
    hasTouch: true,
    isMobile: true,
    viewport: { width: 390, height: 844 },
  });

  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "hover_card");
    await expect(
      page.locator("#hover-card-primitive[data-hydrated]"),
    ).toBeVisible();
  });

  test("opens on tap and closes on second tap", async ({ page }) => {
    const root = page.locator("#hover-card-primitive");
    const trigger = root.locator("[data-radix-hover-card-trigger]");
    const content = page.locator("#hover-card-content");

    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("data-state", "open");

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("closes when tapping outside", async ({ page }) => {
    const root = page.locator("#hover-card-primitive");
    const trigger = root.locator("[data-radix-hover-card-trigger]");
    const content = page.locator("#hover-card-content");

    await trigger.click();
    await expect(content).toBeVisible();

    await page
      .locator('.essence-demo[data-component="hover-card"]')
      .click({ position: { x: 8, y: 8 }, force: true });
    await expect(content).toBeHidden();
  });
});
