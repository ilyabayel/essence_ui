import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Context Menu Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "context_menu");
    await expect(page.locator("#context-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens on right click and closes on escape", async ({ page }) => {
    const trigger = page.locator("[data-essence-context-menu-trigger]");
    const content = page.locator("[data-essence-context-menu-content]");

    await expect(content).toBeHidden();

    await trigger.click({ button: "right" });
    await expect(content).toBeVisible();
    await expect(content).toHaveAttribute("data-state", "open");
    await expect(trigger).toHaveAttribute("data-state", "open");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("navigates with keyboard and closes on item click", async ({ page }) => {
    const trigger = page.locator("[data-essence-context-menu-trigger]");
    const content = page.locator("[data-essence-context-menu-content]");
    const back = content.getByRole("menuitem", { name: /Back/ });
    const reload = content.getByRole("menuitem", { name: /Reload/ });

    await trigger.click({ button: "right" });
    await expect(content).toBeVisible();
    await expect(back).toBeFocused();

    await page.keyboard.press("ArrowDown");
    await expect(reload).toBeFocused();

    await reload.click();
    await expect(content).toBeHidden();
  });

  test("closes on outside click", async ({ page }) => {
    const trigger = page.locator("[data-essence-context-menu-trigger]");
    const content = page.locator("[data-essence-context-menu-content]");

    await trigger.click({ button: "right" });
    await expect(content).toBeVisible();

    await page.mouse.click(8, 120);
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const trigger = page.locator("[data-essence-context-menu-trigger]");
    await trigger.click({ button: "right" });
    await expect(page.locator("[data-essence-context-menu-content]")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="context-menu"]',
    });
  });
});
