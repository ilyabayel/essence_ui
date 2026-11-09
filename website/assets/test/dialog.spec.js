import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
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
    const trigger = root.locator("[data-radix-dialog-trigger]");
    const content = page.locator("#dialog-content");
    const overlay = page.locator("[data-radix-dialog-overlay]");
    const close = content.locator(
      '[data-radix-dialog-close][aria-label="Close"]',
    );

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(overlay).toBeVisible();
    await expect(trigger).toHaveAttribute("data-state", "open");
    await expect(content).toHaveAttribute("data-state", "open");
    await expect(content).toContainText("Edit profile");
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("hidden");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("");

    await trigger.click();
    await expect(content).toBeVisible();
    await close.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("data-state", "closed");
  });

  test("makes the rest of the page inert while open", async ({ page }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-radix-dialog-trigger]");
    const content = page.locator("#dialog-content");
    const name = content.locator("#dialog-name");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(name).toBeFocused();
    await expect(content).toHaveAttribute("aria-labelledby", "dialog-content-title");
    await expect(page.locator("#dialog-content-title")).toHaveText("Edit profile");
    await expect(content).toHaveAttribute(
      "aria-describedby",
      "dialog-content-description",
    );

    await expect
      .poll(() => page.evaluate(() => document.body.style.pointerEvents))
      .toBe("none");
    await expect
      .poll(() =>
        page.evaluate(() => document.querySelector("#dialog-content").style.pointerEvents),
      )
      .toBe("auto");

    const hidden = await page.evaluate(() => {
      const triggerEl = document.querySelector("#dialog-trigger");
      const contentEl = document.querySelector("#dialog-content");
      const described = document.getElementById(contentEl.getAttribute("aria-describedby"));
      return {
        triggerHidden: triggerEl.closest("[aria-hidden='true']") !== null,
        contentExposed: contentEl.closest("[aria-hidden='true']") === null,
        description: described?.textContent ?? "",
      };
    });
    expect(hidden.triggerHidden).toBe(true);
    expect(hidden.contentExposed).toBe(true);
    expect(hidden.description).toContain("Make changes to your profile");

    const hit = await page.evaluate(() => {
      const overlay = document.querySelector("[data-radix-dialog-overlay]");
      overlay.style.setProperty("display", "none", "important");
      const backgroundHit = document.elementFromPoint(8, 8);
      const contentEl = document.querySelector("#dialog-content");
      const contentRect = contentEl.getBoundingClientRect();
      const contentHit = document.elementFromPoint(
        contentRect.left + contentRect.width / 2,
        contentRect.top + 48,
      );
      return {
        backgroundBlocked:
          backgroundHit === document.documentElement ||
          backgroundHit === document.body,
        contentReachable:
          contentHit === contentEl || contentEl.contains(contentHit),
      };
    });
    expect(hit.backgroundBlocked).toBe(true);
    expect(hit.contentReachable).toBe(true);

    await page.keyboard.press("Shift+Tab");
    await expect(content.locator('[aria-label="Close"]')).toBeFocused();
    await page.keyboard.press("Tab");
    await expect(name).toBeFocused();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toBeFocused();
    await expect
      .poll(() => page.evaluate(() => document.body.style.pointerEvents))
      .toBe("");
    await expect
      .poll(() => page.evaluate(() => document.querySelector("[data-aria-hidden]") === null))
      .toBe(true);
    await expect
      .poll(() => page.evaluate(() => document.body.style.overflow))
      .toBe("");
  });

  test("closes on overlay click", async ({ page }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-radix-dialog-trigger]");
    const content = page.locator("#dialog-content");
    const overlay = page.locator("[data-radix-dialog-overlay]");

    await trigger.click();
    await expect(content).toBeVisible();

    const contentBox = await content.boundingBox();
    const overlayBox = await overlay.boundingBox();
    expect(contentBox).not.toBeNull();
    expect(overlayBox).not.toBeNull();

    // Click overlay corner away from dialog content.
    await page.mouse.click(overlayBox.x + 12, overlayBox.y + overlayBox.height - 12);
    await expect(content).toBeHidden();
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#dialog-primitive");
    const trigger = root.locator("[data-radix-dialog-trigger]");
    await trigger.click();
    await expect(page.locator("#dialog-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: ["#dialog-content", "[data-radix-dialog-overlay]"],
    });
  });
});
