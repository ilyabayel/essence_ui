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
      '[data-essence-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-essence-tabs-trigger][data-value="tab2"]',
    );
    const accountContent = root.locator(
      '[data-essence-tabs-content][data-value="tab1"]',
    );
    const passwordContent = root.locator(
      '[data-essence-tabs-content][data-value="tab2"]',
    );

    await expect(account).toHaveAttribute("data-state", "active");
    await expect(accountContent).toBeVisible();
    await expect(passwordContent).toBeHidden();

    await password.click();
    await expect(password).toHaveAttribute("data-state", "active");
    await expect(account).toHaveAttribute("data-state", "inactive");
    await expect(passwordContent).toBeVisible();
    await expect(accountContent).toBeHidden();
    await expect(root).toHaveAttribute("data-value", "tab2");
  });

  test("should expose ids and aria wiring", async ({ page }) => {
    const root = page.locator("#tabs-primitive");
    const account = root.locator(
      '[data-essence-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-essence-tabs-trigger][data-value="tab2"]',
    );
    const accountContent = root.locator(
      '[data-essence-tabs-content][data-value="tab1"]',
    );
    const list = root.locator("[data-essence-tabs-list]");

    await expect(list).toHaveAttribute("aria-orientation", "horizontal");
    await expect(list).toHaveAttribute("data-orientation", "horizontal");
    await expect(account).toHaveAttribute("id", "tabs-primitive-trigger-tab1");
    await expect(account).toHaveAttribute(
      "aria-controls",
      "tabs-primitive-content-tab1",
    );
    await expect(account).toHaveAttribute("data-orientation", "horizontal");
    await expect(password).toHaveAttribute("id", "tabs-primitive-trigger-tab2");
    await expect(password).toHaveAttribute(
      "aria-controls",
      "tabs-primitive-content-tab2",
    );
    await expect(accountContent).toHaveAttribute(
      "id",
      "tabs-primitive-content-tab1",
    );
    await expect(accountContent).toHaveAttribute(
      "aria-labelledby",
      "tabs-primitive-trigger-tab1",
    );
    await expect(accountContent).toHaveAttribute(
      "data-orientation",
      "horizontal",
    );
  });

  test("should navigate with arrow keys", async ({ page }) => {
    const root = page.locator("#tabs-primitive");
    const account = root.locator(
      '[data-essence-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-essence-tabs-trigger][data-value="tab2"]',
    );

    await expect(account).toHaveAttribute("data-state", "active");
    await account.focus();
    await page.keyboard.press("ArrowRight");
    await expect(password).toBeFocused();
    await expect(password).toHaveAttribute("data-state", "active");

    await page.keyboard.press("Home");
    await expect(account).toBeFocused();
    await expect(account).toHaveAttribute("data-state", "active");

    await page.keyboard.press("End");
    await expect(password).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: "#tabs-primitive",
    });
  });
});
