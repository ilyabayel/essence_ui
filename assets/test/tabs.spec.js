import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Tabs Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "tabs");
  });

  test("should activate tab on click and show matching content", async ({
    page,
  }) => {
    const root = page.locator("#tabs-primitive");
    const account = root.locator(
      '[data-essence-tabs-trigger][data-value="account"]',
    );
    const documents = root.locator(
      '[data-essence-tabs-trigger][data-value="documents"]',
    );
    const accountContent = root.locator(
      '[data-essence-tabs-content][data-value="account"]',
    );
    const documentsContent = root.locator(
      '[data-essence-tabs-content][data-value="documents"]',
    );

    await expect(account).toHaveAttribute("data-state", "active");
    await expect(accountContent).toBeVisible();
    await expect(documentsContent).toBeHidden();

    await documents.click();
    await expect(documents).toHaveAttribute("data-state", "active");
    await expect(account).toHaveAttribute("data-state", "inactive");
    await expect(documentsContent).toBeVisible();
    await expect(accountContent).toBeHidden();
    await expect(root).toHaveAttribute("data-value", "documents");
  });

  test("should navigate with arrow keys", async ({ page }) => {
    const root = page.locator("#tabs-primitive");
    const account = root.locator(
      '[data-essence-tabs-trigger][data-value="account"]',
    );
    const documents = root.locator(
      '[data-essence-tabs-trigger][data-value="documents"]',
    );
    const settings = root.locator(
      '[data-essence-tabs-trigger][data-value="settings"]',
    );

    await account.focus();
    await page.keyboard.press("ArrowRight");
    await expect(documents).toBeFocused();
    await expect(documents).toHaveAttribute("data-state", "active");

    await page.keyboard.press("ArrowRight");
    await expect(settings).toBeFocused();
    await expect(settings).toHaveAttribute("data-state", "active");

    await page.keyboard.press("Home");
    await expect(account).toBeFocused();
    await expect(account).toHaveAttribute("data-state", "active");

    await page.keyboard.press("End");
    await expect(settings).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: "#tabs-primitive",
    });
  });
});
