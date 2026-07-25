import { test, expect } from "@playwright/test";
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
  test.use({
    hasTouch: true,
    isMobile: true,
    viewport: { width: 390, height: 844 },
  });

  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "navigation_menu");
    await expect(page.locator("#nav-primitive[data-hydrated]")).toBeVisible();
  });

  test("touch pointer race does not blink Learn open then closed", async ({
    page,
  }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#learn-trigger");
    const content = page.locator("#learn-content");

    await expect(content).toBeHidden();

    // Reproduce the touch sequence that used to blink: enter → leave → click.
    // Hover is mouse-only now; leftover leave timers must not close after click.
    await trigger.dispatchEvent("pointerenter", { pointerType: "touch" });
    await trigger.dispatchEvent("pointerleave", { pointerType: "touch" });
    await trigger.click();

    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    // Hover delay is 200ms; stay open well past that window (no blink).
    await page.waitForTimeout(350);
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
  });

  test("second activation closes Learn", async ({ page }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#learn-trigger");
    const content = page.locator("#learn-content");

    await trigger.click();
    await expect(content).toBeVisible();

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("outside pointerdown closes Overview", async ({ page }) => {
    const root = page.locator("#nav-primitive");
    const trigger = root.locator("#overview-trigger");
    const content = page.locator("#overview-content");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    await page.locator("h2").filter({ hasText: "Navigation Menu" }).click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });
});
