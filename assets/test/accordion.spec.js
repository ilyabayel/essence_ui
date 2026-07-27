import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Accordion Primitive", () => {
  test("single mode enforces exclusivity and allows collapse", async ({
    page,
  }) => {
    await gotoPrimitive(page, "accordion");
    const root = page.locator("#accordion-primitive");
    const trigger1 = root.locator("[data-radix-accordion-trigger]").nth(0);
    const content1 = root.locator("[data-radix-accordion-content]").nth(0);
    const trigger2 = root.locator("[data-radix-accordion-trigger]").nth(1);
    const content2 = root.locator("[data-radix-accordion-content]").nth(1);

    await expect(trigger1).toHaveAttribute("data-orientation", "vertical");

    // Story uses collapsible={true} with default_value item-1
    await expect(content1).toBeVisible();

    await trigger1.click();
    await expect(content1).toBeHidden();

    await trigger1.click();
    await expect(content1).toBeVisible();

    await trigger2.click();
    await expect(content2).toBeVisible();
    await expect(content1).toBeHidden();

    const height = await content2.evaluate((el) =>
      getComputedStyle(el).getPropertyValue(
        "--radix-accordion-content-height",
      ),
    );
    expect(height).toMatch(/^\d+(\.\d+)?px$/);
  });

  test("multiple mode should allow multiple items open", async ({ page }) => {
    await gotoPrimitive(page, "accordion", "multiple");
    const root = page.locator("#accordion-multiple");
    const trigger1 = root.locator("[data-radix-accordion-trigger]").nth(0);
    const content1 = root.locator("[data-radix-accordion-content]").nth(0);
    const trigger2 = root.locator("[data-radix-accordion-trigger]").nth(1);
    const content2 = root.locator("[data-radix-accordion-content]").nth(1);

    await expect(trigger1).toHaveAttribute("data-orientation", "vertical");

    await trigger1.click();
    await trigger2.click();

    await expect(content1).toBeVisible();
    await expect(content2).toBeVisible();

    await trigger1.click();
    await expect(content1).toBeHidden();
    await expect(content2).toBeVisible();
  });

  test("should support full keyboard navigation", async ({ page }) => {
    await gotoPrimitive(page, "accordion");
    const root = page.locator("#accordion-primitive");
    const trigger1 = root.locator("[data-radix-accordion-trigger]").nth(0);
    const trigger2 = root.locator("[data-radix-accordion-trigger]").nth(1);
    const trigger3 = root.locator("[data-radix-accordion-trigger]").nth(2);

    await expect(root.locator("[data-radix-accordion-trigger]")).toHaveCount(
      3,
    );
    // AccordionRoot.sync stamps orientation once the hook is live
    await expect(trigger1).toHaveAttribute("data-orientation", "vertical");

    await trigger1.focus();
    await expect(trigger1).toBeFocused();

    await page.keyboard.press("ArrowDown");
    await expect(trigger2).toBeFocused();

    await page.keyboard.press("ArrowUp");
    await expect(trigger1).toBeFocused();

    await page.keyboard.press("End");
    await expect(trigger3).toBeFocused();

    await page.keyboard.press("Home");
    await expect(trigger1).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoPrimitive(page, "accordion");
    await expectNoA11yViolations(page, {
      include: "#accordion-primitive",
    });
  });
});
