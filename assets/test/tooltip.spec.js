import { test, expect } from '@playwright/test';

test.describe('Tooltip Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/tooltip?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open on hover after delay and close on leave', async ({ page }) => {
    const trigger = page.locator('[data-essence-tooltip-trigger]');
    const content = page.locator('[data-essence-tooltip-content]');

    await expect(content).toBeHidden();

    await trigger.hover();
    await page.waitForTimeout(150);
    await expect(content).toBeVisible();
    await expect(content).toHaveAttribute('role', 'tooltip');
    await expect(content).toHaveAttribute('data-state', 'delayed-open');

    await page.mouse.move(0, 0);
    await page.waitForTimeout(100);
    await expect(content).toBeHidden();
  });

  test('should open on focus and close on escape', async ({ page }) => {
    const trigger = page.locator('[data-essence-tooltip-trigger]');
    const content = page.locator('[data-essence-tooltip-content]');

    await trigger.focus();
    await page.waitForTimeout(150);
    await expect(content).toBeVisible();

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();
  });
});
