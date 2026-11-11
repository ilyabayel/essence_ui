import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
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
      '[data-radix-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-radix-tabs-trigger][data-value="tab2"]',
    );
    const accountContent = root.locator(
      '[data-radix-tabs-content][data-value="tab1"]',
    );
    const passwordContent = root.locator(
      '[data-radix-tabs-content][data-value="tab2"]',
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
      '[data-radix-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-radix-tabs-trigger][data-value="tab2"]',
    );
    const accountContent = root.locator(
      '[data-radix-tabs-content][data-value="tab1"]',
    );
    const list = root.locator("[data-radix-tabs-list]");

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
      '[data-radix-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-radix-tabs-trigger][data-value="tab2"]',
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

  test("reverses horizontal arrows in rtl and selects on Enter when manual", async ({
    page,
  }) => {
    const root = page.locator("#tabs-primitive");
    const account = root.locator(
      '[data-radix-tabs-trigger][data-value="tab1"]',
    );
    const password = root.locator(
      '[data-radix-tabs-trigger][data-value="tab2"]',
    );

    await root.evaluate((el) => {
      el.setAttribute("dir", "rtl");
      el.dataset.activationMode = "manual";
    });

    await account.focus();
    await page.keyboard.press("ArrowLeft");
    await expect(password).toBeFocused();
    await expect(account).toHaveAttribute("data-state", "active");

    await page.keyboard.press("Enter");
    await expect(password).toHaveAttribute("data-state", "active");
    await expect(account).toHaveAttribute("data-state", "inactive");
  });

  test("has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: "#tabs-primitive",
    });
  });

  test("slides the indicator to the active trigger", async ({ page }) => {
    const root = page.locator("#tabs-indicator");
    const indicator = root.locator("[data-radix-tabs-indicator]");
    const day = root.locator('[data-radix-tabs-trigger][data-value="daily"]');
    const month = root.locator('[data-radix-tabs-trigger][data-value="monthly"]');
    const transition =
      "transform 320ms cubic-bezier(0.45, 0.05, 0.2, 1), width 320ms cubic-bezier(0.45, 0.05, 0.2, 1)";

    await expect(indicator).toBeVisible();
    await expect(indicator).toHaveAttribute("data-state", "active");
    await expect(indicator).toHaveAttribute("data-transition", transition);
    await expect(indicatorBox(indicator)).resolves.toMatchObject(
      await triggerBox(day),
    );

    const from = px((await triggerBox(day)).x);
    const to = px((await triggerBox(month)).x);
    await indicator.evaluate((el) => {
      el.dataset.transition = "transform 2s linear";
    });
    await month.click();

    await expect
      .poll(() =>
        indicator.evaluate((el) =>
          el.style.getPropertyValue("--radix-tabs-indicator-transition"),
        ),
      )
      .toBe("transform 2s linear");
    await expect.poll(() => indicatorBox(indicator)).toMatchObject(
      await triggerBox(month),
    );
    // Target variables update immediately; the used transform is still in flight.
    await expect
      .poll(async () => {
        const x = await translateX(indicator);
        return x > from + 0.5 && x < to - 0.5;
      })
      .toBe(true);
    await expect(month).toHaveAttribute("data-state", "active");
  });

  test("does not transition the indicator when reduced motion is preferred", async ({
    page,
  }) => {
    await page.emulateMedia({ reducedMotion: "reduce" });
    await gotoPrimitive(page, "tabs");

    const root = page.locator("#tabs-indicator");
    const indicator = root.locator("[data-radix-tabs-indicator]");
    const month = root.locator('[data-radix-tabs-trigger][data-value="monthly"]');

    await month.click();
    await expect(indicatorBox(indicator)).resolves.toMatchObject(
      await triggerBox(month),
    );
    await expect
      .poll(() =>
        indicator.evaluate((el) =>
          el.style.getPropertyValue("--radix-tabs-indicator-transition"),
        ),
      )
      .toBe("none");
  });

  test("indicator demo has no accessibility violations", async ({ page }) => {
    await expectNoA11yViolations(page, {
      include: "#tabs-indicator",
    });
  });
});

function px(value) {
  return Number.parseFloat(value);
}

async function translateX(indicator) {
  return indicator.evaluate((el) => {
    const transform = getComputedStyle(el).transform;
    if (!transform || transform === "none") return null;
    const match = transform.match(/matrix(?:3d)?\(([^)]+)\)/);
    if (!match) return null;
    const parts = match[1].split(",").map((part) => Number.parseFloat(part));
    return parts.length === 16 ? parts[12] : parts[4];
  });
}

async function indicatorBox(indicator) {
  return indicator.evaluate((el) => ({
    x: el.style.getPropertyValue("--radix-tabs-indicator-x"),
    y: el.style.getPropertyValue("--radix-tabs-indicator-y"),
    width: el.style.getPropertyValue("--radix-tabs-indicator-width"),
    height: el.style.getPropertyValue("--radix-tabs-indicator-height"),
  }));
}

async function triggerBox(trigger) {
  return trigger.evaluate((el) => {
    const list = el.closest("[data-radix-tabs-list]");
    const listRect = list.getBoundingClientRect();
    const rect = el.getBoundingClientRect();
    return {
      x: `${rect.left - listRect.left + list.scrollLeft - list.clientLeft}px`,
      y: `${rect.top - listRect.top + list.scrollTop - list.clientTop}px`,
      width: `${rect.width}px`,
      height: `${rect.height}px`,
    };
  });
}
