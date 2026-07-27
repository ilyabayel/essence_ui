import { test, expect } from "@playwright/test";
import { expectNoA11yViolations } from "./helpers/a11y.js";

async function gotoThemesSegmentedControl(page, variation = "default") {
  await page.goto(
    `/storybook/themes/components/segmented_control?variation_id=${variation}`,
  );
  await page.waitForLoadState("domcontentloaded");
  await page.waitForFunction(() => {
    const hooks = Array.from(document.querySelectorAll("[phx-hook]")).filter(
      (el) => !el.id?.startsWith("psb-"),
    );
    if (hooks.length === 0) return true;
    return hooks.every((el) => el.hasAttribute("data-phx-id"));
  });
}

test.describe("Segmented Control Themes", () => {
  test("selects exclusively and does not deselect on re-click", async ({
    page,
  }) => {
    await gotoThemesSegmentedControl(page);
    const root = page.locator("#sc-default[data-radix-toggle-group-root]");
    const option1 = root.locator(
      '[data-radix-toggle-group-item][data-value="option1"]',
    );
    const option2 = root.locator(
      '[data-radix-toggle-group-item][data-value="option2"]',
    );

    await expect(root).toHaveAttribute("data-deselectable", "false");
    await expect(option1).toHaveAttribute("data-state", "on");
    await expect(option2).toHaveAttribute("data-state", "off");

    await option2.click();
    await expect(option2).toHaveAttribute("data-state", "on");
    await expect(option1).toHaveAttribute("data-state", "off");
    await expect(root).toHaveAttribute("data-value", "option2");

    await option2.click();
    await expect(option2).toHaveAttribute("data-state", "on");
    await expect(root).toHaveAttribute("data-value", "option2");
  });

  test("disabled root blocks interaction", async ({ page }) => {
    await gotoThemesSegmentedControl(page, "disabled");
    const root = page.locator("#sc-disabled[data-radix-toggle-group-root]");
    const enabled = root.locator(
      '[data-radix-toggle-group-item][data-value="enabled"]',
    );
    const disabled = root.locator(
      '[data-radix-toggle-group-item][data-value="disabled"]',
    );

    await expect(root).toBeVisible();
    await expect(root).toHaveAttribute("data-disabled", "");
    await expect(enabled).toBeDisabled();
    await expect(disabled).toBeDisabled();
    await expect(enabled).toHaveAttribute("data-state", "on");

    await disabled.click({ force: true });
    await expect(enabled).toHaveAttribute("data-state", "on");
    await expect(disabled).toHaveAttribute("data-state", "off");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoThemesSegmentedControl(page);
    const root = page.locator("#sc-default[data-radix-toggle-group-root]");
    await expect(root).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#sc-default",
    });
  });
});
