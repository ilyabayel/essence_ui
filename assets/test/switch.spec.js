import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Switch Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "switch");
  });

  test("toggles checked state on click and Space", async ({ page }) => {
    const trigger = page.locator("#airplane-mode[data-essence-switch-trigger]");
    const thumb = page.locator("[data-essence-switch-thumb]");

    await expect(trigger).toHaveAttribute("role", "switch");
    await expect(trigger).toHaveAttribute("aria-checked", "false");
    await expect(trigger).toHaveAttribute("data-state", "unchecked");

    await trigger.click();
    await expect(trigger).toHaveAttribute("aria-checked", "true");
    await expect(trigger).toHaveAttribute("data-state", "checked");
    await expect(thumb).toHaveAttribute("data-state", "checked");

    await trigger.focus();
    await page.keyboard.press("Space");
    await expect(trigger).toHaveAttribute("aria-checked", "false");
    await expect(trigger).toHaveAttribute("data-state", "unchecked");
  });

  test("has accessible name via labelledby", async ({ page }) => {
    const trigger = page.getByRole("switch", { name: "Airplane mode" });
    await expect(trigger).toBeVisible();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="switch"]',
    });
  });
});
