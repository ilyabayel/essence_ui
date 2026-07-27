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
      include: '.essence-demo[data-component="tooltip"]',
    });
  });
});

test.describe("Tooltip Themes", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto("/storybook/themes/components/tooltip?variation_id=default");
    await page.waitForLoadState("domcontentloaded");
    await page.waitForFunction(() => {
      const hooks = Array.from(document.querySelectorAll("[phx-hook]")).filter(
        (el) => !el.id?.startsWith("psb-"),
      );
      if (hooks.length === 0) return true;
      return hooks.every((el) => el.hasAttribute("data-phx-id"));
    });
    await expect(
      page.locator(".est-TooltipRoot[data-hydrated]").first(),
    ).toBeVisible();
  });

  test("opens when hovering nested button trigger", async ({ page }) => {
    const root = page.locator(".est-TooltipRoot").first();
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    const button = trigger.locator("button");
    const contentId = await trigger.getAttribute("aria-describedby");
    const content = page.locator(`#${contentId}`);

    await expect(button).toBeVisible();
    await expect(trigger.locator("button")).toHaveCount(1);
    await expect(content).toBeHidden();

    await button.hover();
    await expect(content).toBeVisible({ timeout: 2000 });
    await expect(content).toHaveAttribute("data-state", "delayed-open");
    await expect(content).toContainText("This is a tooltip");

    await page.mouse.move(0, 0);
    await expect(content).toBeHidden();
  });
});

test.describe("Tooltip Primitive (touch)", () => {
  test.use({
    hasTouch: true,
    isMobile: true,
    viewport: { width: 390, height: 844 },
  });

  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "tooltip");
    await expect(page.locator("#tooltip-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens on tap and closes on second tap", async ({ page }) => {
    const root = page.locator("#tooltip-primitive");
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    const content = page.locator("#tooltip-content");

    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(content).toContainText("Add to library");

    await trigger.click();
    await expect(content).toBeHidden();
  });

  test("closes when tapping outside", async ({ page }) => {
    const root = page.locator("#tooltip-primitive");
    const trigger = root.locator("[data-essence-tooltip-trigger]");
    const content = page.locator("#tooltip-content");

    await trigger.click();
    await expect(content).toBeVisible();

    await page
      .locator('.essence-demo[data-component="tooltip"]')
      .click({ position: { x: 8, y: 8 }, force: true });
    await expect(content).toBeHidden();
  });
});
