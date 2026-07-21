import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Menubar Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "menubar");
    await expect(page.locator("#menubar-primitive[data-hydrated]")).toBeVisible();
  });

  test("opens on trigger click and closes on escape", async ({ page }) => {
    const fileTrigger = page.locator("#file-trigger");
    const fileContent = page.locator("#file-content");

    await expect(fileContent).toBeHidden();
    await fileTrigger.click();
    await expect(fileContent).toBeVisible();
    await expect(fileTrigger).toHaveAttribute("aria-expanded", "true");

    const box = await fileContent.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(fileContent).toBeHidden();
  });

  test("switches menus on hover when one is open", async ({ page }) => {
    const fileTrigger = page.locator("#file-trigger");
    const editTrigger = page.locator("#edit-trigger");
    const fileContent = page.locator("#file-content");
    const editContent = page.locator("#edit-content");

    await fileTrigger.click();
    await expect(fileContent).toBeVisible();

    await editTrigger.hover();
    await expect(editContent).toBeVisible();
    await expect(fileContent).toBeHidden();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expect(page.locator("#menubar-primitive")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#menubar-primitive",
    });
  });
});
