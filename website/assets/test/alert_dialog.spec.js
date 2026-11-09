import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Alert Dialog Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "alert_dialog");
    await expect(
      page.locator("#alert-dialog-primitive[data-hydrated]"),
    ).toBeVisible();
  });

  test("opens from trigger and shows title and description", async ({
    page,
  }) => {
    const root = page.locator("#alert-dialog-primitive");
    const trigger = root.locator("[data-radix-alert-dialog-trigger]");
    const content = page.locator("#alert-dialog-content");
    const overlay = page.locator("[data-radix-alert-dialog-overlay]");

    await expect(content).toBeHidden();
    await trigger.click();

    await expect(content).toBeVisible();
    await expect(overlay).toBeVisible();
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("hidden");
    await expect(content).toHaveAttribute("role", "alertdialog");
    await expect(content).toContainText("Are you absolutely sure?");
    await expect(content).toContainText("This action cannot be undone");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("closes via cancel and action", async ({ page }) => {
    const root = page.locator("#alert-dialog-primitive");
    const trigger = root.locator("[data-radix-alert-dialog-trigger]");
    const content = page.locator("#alert-dialog-content");
    const cancel = content.locator("[data-radix-alert-dialog-cancel]");
    const action = content.locator("[data-radix-alert-dialog-action]");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("hidden");
    await cancel.click();
    await expect(content).toBeHidden();
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("");

    await trigger.click();
    await expect(content).toBeVisible();
    await action.click();
    await expect(content).toBeHidden();
  });

  test("focuses cancel and hides the rest of the page", async ({ page }) => {
    const root = page.locator("#alert-dialog-primitive");
    const trigger = root.locator("[data-radix-alert-dialog-trigger]");
    const content = page.locator("#alert-dialog-content");
    const cancel = content.locator("[data-radix-alert-dialog-cancel]");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(cancel).toBeFocused();
    await expect(content).toHaveAttribute(
      "aria-labelledby",
      "alert-dialog-content-title",
    );

    const inert = await page.evaluate(() => {
      const triggerEl = document.querySelector("#alert-dialog-trigger");
      const contentEl = document.querySelector("#alert-dialog-content");
      return {
        triggerHidden: triggerEl.closest("[aria-hidden='true']") !== null,
        contentExposed: contentEl.closest("[aria-hidden='true']") === null,
        pointerEvents: document.body.style.pointerEvents,
      };
    });
    expect(inert.triggerHidden).toBe(true);
    expect(inert.contentExposed).toBe(true);
    expect(inert.pointerEvents).toBe("none");

    await page.keyboard.press("Shift+Tab");
    await expect(content.locator("[data-radix-alert-dialog-action]")).toBeFocused();
  });

  test("closes on escape but not overlay click", async ({ page }) => {
    const root = page.locator("#alert-dialog-primitive");
    const trigger = root.locator("[data-radix-alert-dialog-trigger]");
    const content = page.locator("#alert-dialog-content");
    const overlay = page.locator("[data-radix-alert-dialog-overlay]");

    await trigger.click();
    await expect(content).toBeVisible();

    const overlayBox = await overlay.boundingBox();
    expect(overlayBox).not.toBeNull();
    await page.mouse.click(
      overlayBox.x + 12,
      overlayBox.y + overlayBox.height - 12,
    );
    await expect(content).toBeVisible();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#alert-dialog-primitive");
    const trigger = root.locator("[data-radix-alert-dialog-trigger]");
    await trigger.click();
    await expect(page.locator("#alert-dialog-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: [
        "#alert-dialog-content",
        "[data-radix-alert-dialog-overlay]",
      ],
    });
  });
});
