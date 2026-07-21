import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function openToast(page) {
  await expect(page.locator("#toast-primitive[data-hydrated]")).toBeAttached();
  await page.locator("#toast-show-btn").click();
  const root = page.locator("#toast-primitive");
  await expect(root).toBeVisible();
  await expect(root).toHaveAttribute("data-state", "open");
  return root;
}

test.describe("Toast Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "toast");
  });

  test("opens from button with title and description", async ({ page }) => {
    const root = await openToast(page);
    const title = root.locator("[data-essence-toast-title]");
    const description = root.locator("[data-essence-toast-description]");

    await expect(title).toContainText("Scheduled: Catch up");
    await expect(description).toContainText("Friday at 5:30 PM");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("closes when close button is clicked", async ({ page }) => {
    const root = await openToast(page);
    const close = root.locator("[data-essence-toast-close]");

    await close.click();
    await expect(root).toHaveAttribute("data-state", "closed");
    await expect(root).toBeHidden();
  });

  test("closes on Escape when toast is focused", async ({ page }) => {
    const root = await openToast(page);

    await root.focus();
    await page.keyboard.press("Escape");
    await expect(root).toHaveAttribute("data-state", "closed");
    await expect(root).toBeHidden();
  });

  test("auto-dismisses after duration", async ({ page }) => {
    const root = await openToast(page);
    await expect(root).toBeHidden({ timeout: 4500 });
    await expect(root).toHaveAttribute("data-state", "closed");
  });

  test("focuses viewport on F8 hotkey", async ({ page }) => {
    await expect(page.locator("#toast-primitive[data-hydrated]")).toBeAttached();
    const viewport = page.locator("[data-essence-toast-viewport]");
    await page.keyboard.press("F8");
    await expect(viewport).toBeFocused();
  });

  test("exposes swipe direction from provider on root", async ({ page }) => {
    const root = await openToast(page);
    await expect(root).toHaveAttribute("data-swipe-direction", "right");
  });

  test("has no accessibility violations when open", async ({ page }) => {
    await openToast(page);
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="toast"]',
    });
  });
});
