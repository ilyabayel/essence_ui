import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Select Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "select");
    await expect(page.locator("#select-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens and closes on trigger click", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const content = page.locator("#select-primitive-content");

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-label", "Food");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    // Content is positioned over the trigger; dismiss with Escape.
    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("selects item on click", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const value = root.locator("[data-essence-select-value]");
    const content = page.locator("#select-primitive-content");
    const orangeItem = content.locator(
      '[data-essence-select-item][data-value="orange"]',
    );

    await trigger.click();
    await orangeItem.click();

    await expect(content).toBeHidden();
    await expect(root).toHaveAttribute("data-value", "orange");
    await expect(value).toHaveText("Orange");
  });

  test("closes on escape key", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const content = page.locator("#select-primitive-content");

    await trigger.click();
    await expect(content).toBeVisible();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toBeFocused();
  });

  test("navigates with keyboard", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const content = page.locator("#select-primitive-content");
    const appleItem = content.locator(
      '[data-essence-select-item][data-value="apple"]',
    );
    const bananaItem = content.locator(
      '[data-essence-select-item][data-value="banana"]',
    );

    await trigger.focus();
    await page.keyboard.press("Enter");
    await expect(content).toBeVisible();

    await page.keyboard.press("ArrowDown");
    await expect(bananaItem).toBeFocused();

    await page.keyboard.press("ArrowUp");
    await expect(appleItem).toBeFocused();

    await page.keyboard.press("ArrowDown");
    await page.keyboard.press("Enter");

    await expect(content).toBeHidden();
    await expect(root).toHaveAttribute("data-value", "banana");
  });

  test("supports typeahead to enabled items", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const content = page.locator("#select-primitive-content");
    const broccoliItem = content.locator(
      '[data-essence-select-item][data-value="broccoli"]',
    );

    await trigger.click();
    await expect(content).toBeVisible();
    await page.keyboard.type("bro");

    await expect(broccoliItem).toBeFocused();
  });

  test("has no accessibility violations when closed", async ({ page }) => {
    const root = page.locator("#select-primitive");
    await expect(root.locator("[data-essence-select-trigger]")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#select-primitive",
    });
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#select-primitive");
    const trigger = root.locator("[data-essence-select-trigger]");
    const content = page.locator("#select-primitive-content");

    await trigger.click();
    await expect(content).toBeVisible();
    await expectNoA11yViolations(page, {
      include: [".radix-demo[data-component='select']", "#select-primitive-content"],
    });
  });
});
