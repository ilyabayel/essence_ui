import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Dialog Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "dialog");
    await expect(page.locator("#dialog-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens and closes via trigger, escape, and close button", async ({
    page,
  }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-essence-dialog-trigger]");
    const content = page.locator("#dialog-content");
    const overlay = page.locator("[data-essence-dialog-overlay]");
    const close = content.locator(
      '[data-essence-dialog-close][aria-label="Close"]',
    );

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(overlay).toBeVisible();
    await expect(trigger).toHaveAttribute("data-state", "open");
    await expect(content).toHaveAttribute("data-state", "open");
    await expect(content).toContainText("Edit profile");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");

    await trigger.click();
    await expect(content).toBeVisible();
    await close.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("closes on overlay click", async ({ page }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-essence-dialog-trigger]");
    const content = page.locator("#dialog-content");
    const overlay = page.locator("[data-essence-dialog-overlay]");

    await trigger.click();
    await expect(content).toBeVisible();

    const contentBox = await content.boundingBox();
    const overlayBox = await overlay.boundingBox();
    expect(contentBox).not.toBeNull();
    expect(overlayBox).not.toBeNull();

    // Click overlay corner away from dialog content and storybook header.
    await page.mouse.click(overlayBox.x + 12, overlayBox.y + overlayBox.height - 12);
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-essence-dialog-trigger]");
    await trigger.click();
    await expect(page.locator("#dialog-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: ["#dialog-content", "[data-essence-dialog-overlay]"],
    });
  });
});
