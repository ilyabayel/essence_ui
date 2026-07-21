import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Toggle Group Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "toggle_group");
  });

  test("single type selects exclusively and allows deselect", async ({
    page,
  }) => {
    const root = page.locator("#alignment[data-essence-toggle-group-root]");
    const left = root.locator(
      '[data-essence-toggle-group-item][data-value="left"]',
    );
    const center = root.locator(
      '[data-essence-toggle-group-item][data-value="center"]',
    );

    await expect(root).toHaveAttribute("role", "radiogroup");
    await expect(center).toHaveAttribute("data-state", "on");
    await expect(center).toHaveAttribute("aria-checked", "true");

    await left.click();
    await expect(left).toHaveAttribute("data-state", "on");
    await expect(center).toHaveAttribute("data-state", "off");
    await expect(root).toHaveAttribute("data-value", "left");

    await left.click();
    await expect(left).toHaveAttribute("data-state", "off");
  });

  test("arrow keys move focus between items", async ({ page }) => {
    const root = page.locator("#alignment[data-essence-toggle-group-root]");
    const left = root.locator(
      '[data-essence-toggle-group-item][data-value="left"]',
    );
    const center = root.locator(
      '[data-essence-toggle-group-item][data-value="center"]',
    );
    const right = root.locator(
      '[data-essence-toggle-group-item][data-value="right"]',
    );

    await center.focus();
    await expect(center).toBeFocused();
    await page.keyboard.press("ArrowRight");
    await expect(right).toBeFocused();
    await page.keyboard.press("ArrowLeft");
    await expect(center).toBeFocused();
    await page.keyboard.press("Home");
    await expect(left).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="toggle-group"]',
    });
  });
});
