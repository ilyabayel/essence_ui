import { test, expect } from "@playwright/test";
import { gotoTheme } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Segmented Control Themes", () => {
  test("selects exclusively and does not deselect on re-click", async ({
    page,
  }) => {
    await gotoTheme(page, "segmented_control");
    const root = page.locator(
      "#segmented-control-hero[data-radix-toggle-group-root]",
    );
    const inbox = root.locator(
      '[data-radix-toggle-group-item][data-value="inbox"]',
    );
    const drafts = root.locator(
      '[data-radix-toggle-group-item][data-value="drafts"]',
    );

    await expect(root).toHaveAttribute("data-deselectable", "false");
    await expect(inbox).toHaveAttribute("data-state", "on");
    await expect(drafts).toHaveAttribute("data-state", "off");

    await drafts.click();
    await expect(drafts).toHaveAttribute("data-state", "on");
    await expect(inbox).toHaveAttribute("data-state", "off");
    await expect(root).toHaveAttribute("data-value", "drafts");

    await drafts.click();
    await expect(drafts).toHaveAttribute("data-state", "on");
    await expect(root).toHaveAttribute("data-value", "drafts");
  });

  test("has no accessibility violations", async ({ page }) => {
    await gotoTheme(page, "segmented_control");
    const root = page.locator(
      "#segmented-control-hero[data-radix-toggle-group-root]",
    );
    await expect(root).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#segmented-control-hero",
    });
  });
});
