import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Toolbar Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "toolbar");
    await expect(page.locator("#toolbar-primitive[data-hydrated]")).toBeVisible();
  });

  test("navigates focusable items with arrow keys", async ({ page }) => {
    const root = page.locator("#toolbar-primitive");
    const bold = root.locator(
      '[data-essence-toolbar-toggle-item][data-value="bold"]',
    );
    const italic = root.locator(
      '[data-essence-toolbar-toggle-item][data-value="italic"]',
    );
    const strike = root.locator(
      '[data-essence-toolbar-toggle-item][data-value="strikethrough"]',
    );

    await bold.focus();
    await expect(bold).toBeFocused();

    await page.keyboard.press("ArrowRight");
    await expect(italic).toBeFocused();

    await page.keyboard.press("ArrowRight");
    await expect(strike).toBeFocused();

    await page.keyboard.press("Home");
    await expect(bold).toBeFocused();

    await page.keyboard.press("End");
    const share = root.locator("[data-essence-toolbar-button]", {
      hasText: "Share",
    });
    await expect(share).toBeFocused();

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("toggles items in toggle group", async ({ page }) => {
    const root = page.locator("#toolbar-primitive");
    const left = root.locator(
      '[data-essence-toolbar-toggle-item][data-value="left"]',
    );
    const center = root.locator(
      '[data-essence-toolbar-toggle-item][data-value="center"]',
    );

    await expect(center).toHaveAttribute("data-state", "on");
    await expect(center).toHaveAttribute("aria-pressed", "true");

    await left.click();
    await expect(left).toHaveAttribute("data-state", "on");
    await expect(center).toHaveAttribute("data-state", "off");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expect(page.locator("#toolbar-primitive")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#toolbar-primitive",
    });
  });
});
