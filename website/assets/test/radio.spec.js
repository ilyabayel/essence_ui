import { test, expect } from "@playwright/test";
import { gotoTheme } from "./helpers/docs.js";

test.describe("Radio", () => {
  test.beforeEach(async ({ page }) => {
    await gotoTheme(page, "radio");
  });

  test("should render as input type radio", async ({ page }) => {
    const radio = page.locator('input[name="radio-hero"][value="1"]');
    await expect(radio).toBeVisible();
    await expect(radio).toHaveAttribute("type", "radio");
    await expect(radio).toBeChecked();
  });

  test("should be checkable", async ({ page }) => {
    const first = page.locator('input[name="radio-hero"][value="1"]');
    const second = page.locator('input[name="radio-hero"][value="2"]');
    await expect(first).toBeChecked();

    await second.click();
    await expect(second).toBeChecked();
    await expect(first).not.toBeChecked();
  });

  test("should support disabled state", async ({ page }) => {
    const radio = page.locator('input[name="radio-disabled"][value="1"]');
    await expect(radio).toBeDisabled();
  });

  test("should support high contrast", async ({ page }) => {
    const radio = page.locator('input[name="radio-hc-indigo-contrast"]');
    await expect(radio).toHaveAttribute("data-accent-color", "indigo");
  });

  test("should work within a manual label", async ({ page }) => {
    const defaultLabel = page.locator('label:has-text("Default")').first();
    const comfortableLabel = page
      .locator('label:has-text("Comfortable")')
      .first();
    const defaultRadio = defaultLabel.locator('input[type="radio"]');
    const comfortableRadio = comfortableLabel.locator('input[type="radio"]');

    await expect(defaultRadio).toBeChecked();
    await expect(comfortableRadio).not.toBeChecked();

    await comfortableLabel.click();
    await expect(comfortableRadio).toBeChecked();
    await expect(defaultRadio).not.toBeChecked();
  });
});
