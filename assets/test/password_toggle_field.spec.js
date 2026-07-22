import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Password Toggle Field Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "password_toggle_field");
  });

  test("toggles input type and aria-pressed", async ({ page }) => {
    const root = page.locator("#password-toggle-primitive");
    const input = root.locator("[data-essence-password-toggle-input]");
    const toggle = root.locator("[data-essence-password-toggle-toggle]");

    await expect(input).toHaveAttribute("type", "password");
    await expect(toggle).toHaveAttribute("aria-pressed", "false");
    await expect(root).toHaveAttribute("data-visible", "false");

    await toggle.click();

    await expect(input).toHaveAttribute("type", "text");
    await expect(toggle).toHaveAttribute("aria-pressed", "true");
    await expect(root).toHaveAttribute("data-visible", "true");
    await expect(toggle).toHaveAttribute("aria-label", "Hide password");

    await toggle.click();

    await expect(input).toHaveAttribute("type", "password");
    await expect(toggle).toHaveAttribute("aria-pressed", "false");
  });

  test("shows and hides icon slots", async ({ page }) => {
    const root = page.locator("#password-toggle-primitive");
    const toggle = root.locator("[data-essence-password-toggle-toggle]");
    const visibleIcon = root.locator(
      "[data-essence-password-toggle-icon][data-visible]",
    );
    const hiddenIcon = root.locator(
      "[data-essence-password-toggle-icon][data-hidden]",
    );

    await expect(visibleIcon).toBeHidden();
    await expect(hiddenIcon).toBeVisible();

    await toggle.click();

    await expect(visibleIcon).toBeVisible();
    await expect(hiddenIcon).toBeHidden();
  });

  test("accepts typed password and stays laid out", async ({ page }) => {
    const root = page.locator("#password-toggle-primitive");
    const input = root.locator("[data-essence-password-toggle-input]");

    await input.fill("s3cret");
    await expect(input).toHaveValue("s3cret");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
    expect(box.height).toBeGreaterThan(0);
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#password-toggle-primitive");
    await expect(
      root.locator("[data-essence-password-toggle-input]"),
    ).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#password-toggle-primitive",
    });
  });
});
