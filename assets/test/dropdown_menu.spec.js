import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Dropdown Menu Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "dropdown_menu");
    await expect(
      page.locator("#dropdown-primitive[data-hydrated]"),
    ).toBeVisible();
  });

  test("opens and closes on trigger click", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
    await expect(trigger).toHaveAttribute("aria-label", "Customise options");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
    await expect(content).toHaveAttribute("data-state", "open");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("navigates with arrows and closes on escape", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");
    const items = content.locator(
      "[data-essence-dropdown-menu-item]:not([data-disabled]), [data-essence-dropdown-menu-checkbox-item]",
    );

    await trigger.click();
    await expect(content).toBeVisible();

    await page.keyboard.press("ArrowDown");
    await expect(items.nth(1)).toBeFocused();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
  });

  test("closes on outside click and item select", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");
    const item = content
      .locator("[data-essence-dropdown-menu-item]")
      .filter({ hasText: "Close" });

    await trigger.click();
    await expect(content).toBeVisible();

    await page.mouse.click(8, 120);
    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await item.click();
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    await trigger.click();
    await expect(page.locator("#dropdown-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="dropdown-menu"]',
    });
  });
});
