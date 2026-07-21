import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Toggle Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "toggle");
  });

  test("toggles pressed state on click and Space", async ({ page }) => {
    const toggle = page.getByRole("button", { name: "Toggle italic" });

    await expect(toggle).toHaveAttribute("aria-pressed", "false");
    await expect(toggle).toHaveAttribute("data-state", "off");

    await toggle.click();
    await expect(toggle).toHaveAttribute("aria-pressed", "true");
    await expect(toggle).toHaveAttribute("data-state", "on");

    await toggle.focus();
    await page.keyboard.press("Space");
    await expect(toggle).toHaveAttribute("aria-pressed", "false");
    await expect(toggle).toHaveAttribute("data-state", "off");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="toggle"]',
    });
  });
});
