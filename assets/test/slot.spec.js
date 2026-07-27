import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Slot Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "slot");
  });

  test("renders composed button with slot props", async ({ page }) => {
    const demo = page.locator('.essence-demo[data-component="slot"]');
    const button = demo.locator("button.DemoButton.violet");

    await expect(button).toBeVisible();
    await expect(button).toHaveText("Composed Button");
    await expect(button).toHaveClass(/Button/);
    await expect(button).toHaveClass(/violet/);

    const box = await button.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
    expect(box.height).toBeGreaterThan(0);
  });

  test("is activatable with keyboard", async ({ page }) => {
    const button = page.locator(
      '.essence-demo[data-component="slot"] button.DemoButton',
    );

    await button.focus();
    await expect(button).toBeFocused();
    await page.keyboard.press("Enter");
    await expect(button).toBeVisible();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expect(
      page.locator('.essence-demo[data-component="slot"] button'),
    ).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.essence-demo[data-component="slot"]',
    });
  });
});
