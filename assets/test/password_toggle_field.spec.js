import { test, expect } from '@playwright/test';

test.describe('Password Toggle Field Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/password_toggle_field?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('toggles input type and aria-pressed', async ({ page }) => {
    const root = page.locator('[data-essence-password-toggle-root]');
    const input = page.locator('[data-essence-password-toggle-input]');
    const toggle = page.locator('[data-essence-password-toggle-toggle]');

    await expect(input).toHaveAttribute('type', 'password');
    await expect(toggle).toHaveAttribute('aria-pressed', 'false');
    await expect(root).toHaveAttribute('data-visible', 'false');

    await toggle.click();

    await expect(input).toHaveAttribute('type', 'text');
    await expect(toggle).toHaveAttribute('aria-pressed', 'true');
    await expect(root).toHaveAttribute('data-visible', 'true');
    await expect(toggle).toHaveAttribute('aria-label', 'Hide password');

    await toggle.click();

    await expect(input).toHaveAttribute('type', 'password');
    await expect(toggle).toHaveAttribute('aria-pressed', 'false');
  });

  test('shows and hides icon slots', async ({ page }) => {
    const toggle = page.locator('[data-essence-password-toggle-toggle]');
    const visibleIcon = page.locator('[data-essence-password-toggle-icon][data-visible]');
    const hiddenIcon = page.locator('[data-essence-password-toggle-icon][data-hidden]');

    await expect(visibleIcon).toBeHidden();
    await expect(hiddenIcon).toBeVisible();

    await toggle.click();

    await expect(visibleIcon).toBeVisible();
    await expect(hiddenIcon).toBeHidden();
  });
});
