import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/story.js";
import { expectNoA11yViolations } from "./helpers/a11y.js";

test.describe("Form Primitive", () => {
  test.beforeEach(async ({ page }) => {
    await gotoPrimitive(page, "form");
    await expect(
      page.locator("#form-primitive [data-essence-form-label][for]").first(),
    ).toBeVisible();
  });

  test("renders fields, labels, and submit control", async ({ page }) => {
    const root = page.locator("#form-primitive");
    const emailField = root.locator(
      '[data-essence-form-field][data-name="email"]',
    );
    const questionField = root.locator(
      '[data-essence-form-field][data-name="question"]',
    );
    const submit = root.locator("[data-essence-form-submit]");

    await expect(root).toHaveAttribute("data-essence-form-root", "");
    await expect(emailField.locator("[data-essence-form-label]")).toHaveText(
      "Email",
    );
    await expect(questionField.locator("[data-essence-form-label]")).toHaveText(
      "Question",
    );
    await expect(emailField.locator('input[name="email"]')).toBeVisible();
    await expect(questionField.locator('textarea[name="question"]')).toBeVisible();
    await expect(submit).toBeVisible();

    const box = await root.boundingBox();
    expect(box).not.toBeNull();
    expect(box.height).toBeGreaterThan(0);
  });

  test("shows validation messages on invalid submit", async ({ page }) => {
    const root = page.locator("#form-primitive");
    const emailField = root.locator(
      '[data-essence-form-field][data-name="email"]',
    );
    const valueMissing = emailField.locator(
      '[data-essence-form-message][data-match="valueMissing"]',
    );
    const submit = root.locator("[data-essence-form-submit]");

    await submit.click();

    await expect(emailField).toHaveAttribute("data-invalid", "");
    await expect(valueMissing).toBeVisible();
    await expect(valueMissing).toHaveText("Please enter your email");
    await expect(emailField.locator('input[name="email"]')).toBeFocused();
  });

  test("shows typeMismatch for invalid email", async ({ page }) => {
    const root = page.locator("#form-primitive");
    const emailField = root.locator(
      '[data-essence-form-field][data-name="email"]',
    );
    const emailInput = emailField.locator('input[name="email"]');
    const typeMismatch = emailField.locator(
      '[data-essence-form-message][data-match="typeMismatch"]',
    );
    const submit = root.locator("[data-essence-form-submit]");

    await emailInput.fill("not-an-email");
    await root.locator('textarea[name="question"]').fill("Hello?");
    await submit.click();

    await expect(emailField).toHaveAttribute("data-invalid", "");
    await expect(typeMismatch).toBeVisible();
    await expect(typeMismatch).toHaveText("Please provide a valid email");
  });

  test("clears invalid state when fields become valid", async ({ page }) => {
    const root = page.locator("#form-primitive");
    const emailField = root.locator(
      '[data-essence-form-field][data-name="email"]',
    );
    const questionField = root.locator(
      '[data-essence-form-field][data-name="question"]',
    );
    const submit = root.locator("[data-essence-form-submit]");

    await submit.click();
    await expect(emailField).toHaveAttribute("data-invalid", "");

    await emailField.locator('input[name="email"]').fill("user@example.com");
    await questionField.locator('textarea[name="question"]').fill("A question");

    await expect(emailField).not.toHaveAttribute("data-invalid", "");
    await expect(questionField).not.toHaveAttribute("data-invalid", "");
  });

  test("has no accessibility violations", async ({ page }) => {
    const root = page.locator("#form-primitive");
    await expect(root.locator('input[name="email"]')).toBeVisible();
    await expect(
      root.locator('[data-essence-form-label][for]').first(),
    ).toBeVisible();
    await expectNoA11yViolations(page, {
      include: "#form-primitive",
    });
  });
});
