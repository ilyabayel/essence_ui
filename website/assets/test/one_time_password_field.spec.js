import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("One-Time Password Field Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "one_time_password_field");
    await expect(page.locator("#otp-primitive[data-hydrated]")).toBeVisible();
  });

  test("renders six inputs and hidden value field", async ({ page }) => {
    const root = page.locator("#otp-primitive");
    const inputs = root.locator("[data-radix-otp-input]");
    const hidden = root.locator("[data-radix-otp-hidden]");

    await expect(root).toHaveAttribute("role", "group");
    await expect(inputs).toHaveCount(6);
    await expect(hidden).toHaveAttribute("name", "otp");

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.width).toBeGreaterThan(0);
  });

  test("moves focus forward while typing and updates hidden value", async ({
    page,
  }) => {
    const root = page.locator("#otp-primitive");
    const inputs = root.locator("[data-radix-otp-input]");
    const hidden = root.locator("[data-radix-otp-hidden]");

    await inputs.nth(0).focus();
    await page.keyboard.type("123456");

    await expect(hidden).toHaveValue("123456");
    await expect(root).toHaveAttribute("data-value", "123456");
    await expect(inputs.nth(5)).toBeFocused();
  });

  test("accepts a password-manager dump on the active slot only", async ({
    page,
  }) => {
    const root = page.locator("#otp-primitive");
    const inputs = root.locator("[data-radix-otp-input]");
    const hidden = root.locator("[data-radix-otp-hidden]");

    await expect(inputs.nth(0)).toHaveAttribute("maxlength", "6");
    await expect(inputs.nth(0)).toHaveAttribute("autocomplete", "one-time-code");
    await expect(inputs.nth(1)).toHaveAttribute("maxlength", "1");
    await expect(inputs.nth(1)).toHaveAttribute("autocomplete", "off");
    await expect(inputs.nth(1)).toHaveAttribute("data-1p-ignore", "true");
    await expect(inputs.nth(2)).toHaveAttribute("tabindex", "-1");

    await inputs.nth(0).focus();
    await inputs.nth(0).evaluate((input) => {
      input.value = "12a456";
      input.dispatchEvent(new InputEvent("input", { bubbles: true }));
    });

    await expect(hidden).toHaveValue("12456");
    await expect(inputs.nth(0)).toHaveAttribute("maxlength", "1");
    await expect(inputs.nth(5)).toHaveAttribute("maxlength", "6");
    await expect(inputs.nth(5)).toHaveAttribute("autocomplete", "one-time-code");
  });

  test("supports paste to fill all inputs", async ({ page }) => {
    const root = page.locator("#otp-primitive");
    const inputs = root.locator("[data-radix-otp-input]");
    const hidden = root.locator("[data-radix-otp-hidden]");

    await inputs.nth(0).focus();
    await page.evaluate(() => {
      const input = document.querySelector(
        "#otp-primitive [data-radix-otp-input]",
      );
      const event = new ClipboardEvent("paste", {
        bubbles: true,
        cancelable: true,
        clipboardData: new DataTransfer(),
      });
      event.clipboardData.setData("text", "987654");
      input.dispatchEvent(event);
    });

    await expect(hidden).toHaveValue("987654");
    for (let i = 0; i < 6; i++) {
      await expect(inputs.nth(i)).toHaveValue("987654"[i]);
    }
  });

  test("arrow keys and backspace navigate between inputs", async ({ page }) => {
    const root = page.locator("#otp-primitive");
    const inputs = root.locator("[data-radix-otp-input]");

    await inputs.nth(0).focus();
    await page.keyboard.type("12");
    await expect(inputs.nth(2)).toBeFocused();

    await page.keyboard.press("ArrowLeft");
    await expect(inputs.nth(1)).toBeFocused();

    await page.keyboard.press("Backspace");
    await expect(inputs.nth(1)).toHaveValue("");
    await expect(root.locator("[data-radix-otp-hidden]")).toHaveValue("1");

    await page.keyboard.press("Backspace");
    await expect(inputs.nth(0)).toBeFocused();
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#otp-primitive");
    await expect(root.locator("[data-radix-otp-input]").first()).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#otp-primitive",
    });
  });
});
