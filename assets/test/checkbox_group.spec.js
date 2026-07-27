import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function waitForCheckboxGroupHook(root) {
  await expect(
    root.locator("[data-radix-checkbox-group-item][data-has-click]").first(),
  ).toBeVisible();
}

test.describe("Checkbox Group Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "checkbox_group");
  });

  test("exposes group semantics with default selection", async ({ page }) => {
    const root = page.locator("#checkbox-group-primitive");
    await waitForCheckboxGroupHook(root);

    const fun = root.locator(
      '[data-radix-checkbox-group-item][data-value="fun"]',
    );
    const serious = root.locator(
      '[data-radix-checkbox-group-item][data-value="serious"]',
    );

    await expect(root).toHaveAttribute("role", "group");
    await expect(root).toHaveAttribute("aria-label", "Personality traits");
    await expect(fun).toHaveAttribute("role", "checkbox");
    await expect(fun).toHaveAttribute("aria-checked", "true");
    await expect(fun).toHaveAttribute("data-state", "checked");
    await expect(serious).toHaveAttribute("aria-checked", "false");
  });

  test("toggles multiple items on click", async ({ page }) => {
    const root = page.locator("#checkbox-group-primitive");
    await waitForCheckboxGroupHook(root);

    const fun = root.locator(
      '[data-radix-checkbox-group-item][data-value="fun"]',
    );
    const serious = root.locator(
      '[data-radix-checkbox-group-item][data-value="serious"]',
    );

    await page.locator('label[for="cg2"]').click();
    await expect(serious).toHaveAttribute("aria-checked", "true");
    await expect(fun).toHaveAttribute("aria-checked", "true");

    await page.locator('label[for="cg1"]').click();
    await expect(fun).toHaveAttribute("aria-checked", "false");
    await expect(serious).toHaveAttribute("aria-checked", "true");
  });

  test("navigates with arrow keys and toggles with Space", async ({
    page,
  }) => {
    const root = page.locator("#checkbox-group-primitive");
    await waitForCheckboxGroupHook(root);

    const fun = root.locator(
      '[data-radix-checkbox-group-item][data-value="fun"]',
    );
    const serious = root.locator(
      '[data-radix-checkbox-group-item][data-value="serious"]',
    );

    await fun.focus();
    await page.keyboard.press("ArrowDown");
    await expect(serious).toBeFocused();

    await page.keyboard.press("Space");
    await expect(serious).toHaveAttribute("aria-checked", "true");
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#checkbox-group-primitive");
    await waitForCheckboxGroupHook(root);
    await expectNoA11yViolations(page, {
      include: "#checkbox-group-primitive",
    });
  });
});
