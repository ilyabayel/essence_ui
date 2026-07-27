import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Dropdown Menu Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "dropdown_menu");
    await expect(
      page.locator("#dropdown-primitive[data-hydrated]"),
    ).toBeVisible();
  });

  test("opens and closes on trigger click", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
    await expect(trigger).toHaveAttribute("aria-label", "Customise options");

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute("aria-expanded", "true");
    await expect(content).toHaveAttribute("data-state", "open");

    const box = await content.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute("aria-expanded", "false");
  });

  test("navigates with arrows and closes on escape", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");
    const items = content.locator(
      "[data-essence-dropdown-menu-item]:not([data-disabled]), [data-essence-dropdown-menu-checkbox-item]",
    );

    await trigger.click();
    await expect(content).toBeVisible();
    // Opening via pointer focuses the first enabled item; wait before arrows.
    await expect(items.first()).toBeFocused();

    await page.keyboard.press("ArrowDown");
    await expect(items.nth(1)).toBeFocused();

    await page.keyboard.press("Escape");
    await expect(content).toBeHidden();
  });

  test("closes on outside click and item select", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");
    const item = content
      .locator("[data-essence-dropdown-menu-item]")
      .filter({ hasText: "Close" });

    await trigger.click();
    await expect(content).toBeVisible();

    await page.mouse.click(8, 120);
    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await item.click();
    await expect(content).toBeHidden();
  });

  test("opens submenu on sub-trigger click (touch path)", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    const content = page.locator("#dropdown-content");
    const subTrigger = content.locator(
      "[data-essence-dropdown-menu-sub-trigger]",
    );
    const subContent = page.locator(
      "[data-essence-dropdown-menu-sub-content]",
    );

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(subContent).toBeHidden();

    await subTrigger.click();
    await expect(subContent).toBeVisible();
    await expect(subTrigger).toHaveAttribute("aria-expanded", "true");
    await expect(subContent).toContainText("Save Page As");
  });

  test("has no accessibility violations when open", async ({ page }) => {
    const root = page.locator("#dropdown-primitive");
    const trigger = root.locator("[data-essence-dropdown-menu-trigger]");
    await trigger.click();
    await expect(page.locator("#dropdown-content")).toBeVisible();
    await expectNoA11yViolations(page, {
      include: '.essence-demo[data-component="dropdown-menu"]',
    });
  });
});

test.describe("Dropdown Menu Themes (legacy hook)", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(
      "/themes/components/dropdown_menu?variation_id=sibling_subs",
    );
    await page.waitForLoadState("domcontentloaded");
    await page.waitForFunction(() => {
      const el = document.getElementById("dropdown-sibling-subs");
      return el && el.hasAttribute("data-phx-id");
    });
    await expect(page.locator("#dropdown-sibling-subs")).toBeVisible();
  });

  test("closes sibling submenu when opening another via click", async ({
    page,
  }) => {
    const root = page.locator("#dropdown-sibling-subs");
    const trigger = root.locator("[data-dropdown-menu-trigger] button");
    const content = root.locator("[data-dropdown-menu-content]");
    const moreSub = content.locator("[data-dropdown-menu-sub]").nth(0);
    const shareSub = content.locator("[data-dropdown-menu-sub]").nth(1);
    const moreTrigger = moreSub.locator("[data-dropdown-menu-sub-trigger]");
    const shareTrigger = shareSub.locator("[data-dropdown-menu-sub-trigger]");
    const moreContent = moreSub.locator("[data-dropdown-menu-sub-content]");
    const shareContent = shareSub.locator("[data-dropdown-menu-sub-content]");

    await trigger.click();
    await expect(content).toBeVisible();

    await moreTrigger.click();
    await expect(moreContent).toBeVisible();
    await expect(shareContent).toBeHidden();

    await shareTrigger.click();
    await expect(shareContent).toBeVisible();
    await expect(moreContent).toBeHidden();
    await expect(moreTrigger).not.toHaveAttribute("data-state", "open");
  });
});

test.describe("Dropdown Menu Themes nested subs (legacy hook)", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(
      "/themes/components/dropdown_menu?variation_id=nested_subs",
    );
    await page.waitForLoadState("domcontentloaded");
    await page.waitForFunction(() => {
      const el = document.getElementById("dropdown-nested-subs");
      return el && el.hasAttribute("data-phx-id");
    });
    await expect(page.locator("#dropdown-nested-subs")).toBeVisible();
  });

  test("keeps parent open when opening nested sub; closes descendants with parent", async ({
    page,
  }) => {
    const root = page.locator("#dropdown-nested-subs");
    const trigger = root.locator("[data-dropdown-menu-trigger] button");
    const content = root.locator("[data-dropdown-menu-content]");
    const moreSub = content.locator(":scope > .est-BaseMenuViewport > [data-dropdown-menu-sub]").nth(0);
    const shareSub = content.locator(":scope > .est-BaseMenuViewport > [data-dropdown-menu-sub]").nth(1);
    const moreTrigger = moreSub.locator(":scope > [data-dropdown-menu-sub-trigger]");
    const moreContent = moreSub.locator(":scope > [data-dropdown-menu-sub-content]");
    const nestedSub = moreContent.locator("[data-dropdown-menu-sub]");
    const nestedTrigger = nestedSub.locator("[data-dropdown-menu-sub-trigger]");
    const nestedContent = nestedSub.locator("[data-dropdown-menu-sub-content]");
    const shareTrigger = shareSub.locator("[data-dropdown-menu-sub-trigger]");
    const shareContent = shareSub.locator("[data-dropdown-menu-sub-content]");

    await trigger.click();
    await expect(content).toBeVisible();

    await moreTrigger.click();
    await expect(moreContent).toBeVisible();

    await nestedTrigger.click();
    await expect(nestedContent).toBeVisible();
    // Opening nested must not close its ancestor.
    await expect(moreContent).toBeVisible();
    await expect(moreTrigger).toHaveAttribute("data-state", "open");

    // Closing parent via sibling opens Share and cascades nested closed.
    await shareTrigger.click();
    await expect(shareContent).toBeVisible();
    await expect(moreContent).toBeHidden();
    await expect(nestedContent).toBeHidden();
  });
});
