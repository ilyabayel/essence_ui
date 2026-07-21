import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Collapsible Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "collapsible");
  });

  test("should toggle content on click and set CSS variables", async ({
    page,
  }) => {
    const trigger = page.locator("[data-essence-collapsible-trigger]");
    const content = page.locator("[data-essence-collapsible-content]");

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
    await expect(trigger).toHaveAttribute("data-state", "open");

    const height = await content.evaluate((el) =>
      el.style.getPropertyValue("--essence-collapsible-content-height"),
    );
    expect(height).toMatch(/^\d+(\.\d+)?px$/);
    expect(parseFloat(height)).toBeGreaterThan(0);

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("should support delayed hiding for exit animations", async ({
    page,
  }) => {
    const trigger = page.locator("[data-essence-collapsible-trigger]");
    const content = page.locator("[data-essence-collapsible-content]");

    await trigger.click();
    await expect(content).toBeVisible();

    await content.evaluate((el) => {
      el.style.transition = "opacity 1s linear";
    });

    await trigger.click();
    await expect(content).toHaveAttribute("data-state", "closed");

    const isHidden = await content.evaluate((el) => el.hidden);
    expect(isHidden).toBe(false);

    await content.evaluate((el) => {
      el.dispatchEvent(new Event("transitionend", { bubbles: true }));
    });

    await expect(content).toBeHidden();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="collapsible"]',
    });
  });
});
