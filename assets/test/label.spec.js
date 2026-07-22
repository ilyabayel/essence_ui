import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Label Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "label");
  });

  test("associates with control and focuses on click", async ({ page }) => {
    const demo = page.locator('.radix-demo[data-component="label"]');
    const label = demo.locator("label.LabelRoot");
    const input = demo.locator("#firstName");

    await expect(label).toHaveText("First Name");
    await expect(label).toHaveAttribute("for", "firstName");
    await expect(label).toHaveAttribute("phx-hook", "LabelRoot");

    await label.click();
    await expect(input).toBeFocused();
  });

  test("prevents text selection on double-click (Radix LabelRoot)", async ({
    page,
  }) => {
    const demo = page.locator('.radix-demo[data-component="label"]');
    const label = demo.locator("label.LabelRoot");

    await label.dblclick();
    const selected = await page.evaluate(
      () => window.getSelection()?.toString() ?? "",
    );
    expect(selected).not.toMatch(/First Name/);
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: '.radix-demo[data-component="label"]',
    });
  });
});
