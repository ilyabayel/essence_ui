import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

/** Wait until RadioGroupRoot hook has synced item tabindex / click handlers. */
async function waitForRadioGroupHook(root) {
  await expect(
    root.locator('[data-essence-radio-group-item][data-has-click]').first(),
  ).toBeVisible();
  await expect(
    root.locator(
      '[data-essence-radio-group-item][aria-checked="true"][tabindex="0"]',
    ),
  ).toBeVisible();
}

test.describe("Radio Group Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "radio_group");
  });

  test("exposes radiogroup semantics with default selection", async ({
    page,
  }) => {
    const root = page.locator("#radio-group-primitive");
    await waitForRadioGroupHook(root);

    const defaultItem = root.locator(
      '[data-essence-radio-group-item][data-value="default"]',
    );
    const comfortableItem = root.locator(
      '[data-essence-radio-group-item][data-value="comfortable"]',
    );
    const compactItem = root.locator(
      '[data-essence-radio-group-item][data-value="compact"]',
    );

    await expect(root).toHaveAttribute("role", "radiogroup");
    await expect(root).toHaveAttribute("aria-label", "View density");
    await expect(root).toHaveAttribute("data-value", "default");
    await expect(defaultItem).toHaveAttribute("role", "radio");
    await expect(defaultItem).toHaveAttribute("aria-checked", "true");
    await expect(defaultItem).toHaveAttribute("data-state", "checked");
    await expect(comfortableItem).toHaveAttribute("aria-checked", "false");
    await expect(compactItem).toHaveAttribute("aria-checked", "false");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);
  });

  test("selects item on click via label", async ({ page }) => {
    const root = page.locator("#radio-group-primitive");
    await waitForRadioGroupHook(root);

    const defaultItem = root.locator(
      '[data-essence-radio-group-item][data-value="default"]',
    );
    const comfortableItem = root.locator(
      '[data-essence-radio-group-item][data-value="comfortable"]',
    );
    const comfortableLabel = page.locator('label[for="r2"]');

    await comfortableLabel.click();
    await expect(root).toHaveAttribute("data-value", "comfortable");
    await expect(comfortableItem).toHaveAttribute("aria-checked", "true");
    await expect(comfortableItem).toHaveAttribute("data-state", "checked");
    await expect(defaultItem).toHaveAttribute("aria-checked", "false");
  });

  test("navigates and selects with arrow keys", async ({ page }) => {
    const root = page.locator("#radio-group-primitive");
    await waitForRadioGroupHook(root);

    const defaultItem = root.locator(
      '[data-essence-radio-group-item][data-value="default"]',
    );
    const comfortableItem = root.locator(
      '[data-essence-radio-group-item][data-value="comfortable"]',
    );
    const compactItem = root.locator(
      '[data-essence-radio-group-item][data-value="compact"]',
    );

    await defaultItem.focus();
    await page.keyboard.press("ArrowDown");
    await expect(comfortableItem).toBeFocused();
    await expect(comfortableItem).toHaveAttribute("aria-checked", "true");
    await expect(root).toHaveAttribute("data-value", "comfortable");

    await page.keyboard.press("ArrowDown");
    await expect(compactItem).toBeFocused();
    await expect(compactItem).toHaveAttribute("aria-checked", "true");

    await page.keyboard.press("ArrowDown");
    await expect(defaultItem).toBeFocused();
    await expect(defaultItem).toHaveAttribute("aria-checked", "true");

    await page.keyboard.press("ArrowUp");
    await expect(compactItem).toBeFocused();

    await page.keyboard.press("Home");
    await expect(defaultItem).toBeFocused();

    await page.keyboard.press("End");
    await expect(compactItem).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#radio-group-primitive");
    await waitForRadioGroupHook(root);
    await expectNoA11yViolations(page, {
      include: "#radio-group-primitive",
    });
  });
});

test.describe("Radio Group Component", () => {
  test("should select item on click via label", async ({ page }) => {
    await page.goto("/components/radio_group?variation_id=default");
    const root = page.locator("#radio-default");
    await waitForRadioGroupHook(root);

    const appleItem = root.locator(
      '[data-essence-radio-group-item][data-value="apple"]',
    );
    const orangeItem = root.locator(
      '[data-essence-radio-group-item][data-value="orange"]',
    );
    const orangeLabel = root.locator('label:has-text("Orange")');
    const hiddenInput = root.locator('input[type="hidden"][name="fruit"]');

    await expect(root).toHaveAttribute("data-value", "apple");
    await expect(appleItem).toHaveAttribute("aria-checked", "true");
    await expect(hiddenInput).toHaveValue("apple");

    await orangeLabel.click();
    await expect(root).toHaveAttribute("data-value", "orange");
    await expect(orangeItem).toHaveAttribute("aria-checked", "true");
    await expect(appleItem).toHaveAttribute("aria-checked", "false");
    await expect(hiddenInput).toHaveValue("orange");
  });

  test("should navigate with keyboard", async ({ page }) => {
    await page.goto("/components/radio_group?variation_id=default");
    const root = page.locator("#radio-default");
    await waitForRadioGroupHook(root);

    const appleItem = root.locator(
      '[data-essence-radio-group-item][data-value="apple"]',
    );
    const orangeItem = root.locator(
      '[data-essence-radio-group-item][data-value="orange"]',
    );
    const bananaItem = root.locator(
      '[data-essence-radio-group-item][data-value="banana"]',
    );

    await appleItem.focus();
    await page.keyboard.press("ArrowDown");
    await expect(orangeItem).toBeFocused();
    await expect(orangeItem).toHaveAttribute("aria-checked", "true");
    await expect(root).toHaveAttribute("data-value", "orange");

    await page.keyboard.press("ArrowDown");
    await expect(bananaItem).toBeFocused();
    await expect(bananaItem).toHaveAttribute("aria-checked", "true");

    await page.keyboard.press("ArrowDown");
    await expect(appleItem).toBeFocused();
    await expect(appleItem).toHaveAttribute("aria-checked", "true");

    await page.keyboard.press("ArrowUp");
    await expect(bananaItem).toBeFocused();

    await page.keyboard.press("End");
    await expect(bananaItem).toBeFocused();

    await page.keyboard.press("Home");
    await expect(appleItem).toBeFocused();
  });
});
