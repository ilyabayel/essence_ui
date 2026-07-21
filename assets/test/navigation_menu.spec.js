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
