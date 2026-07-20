import { test, expect } from '@playwright/test';

test.describe('Popover Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/popover?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open and close on trigger click', async ({ page }) => {
    const trigger = page.locator('[data-essence-popover-trigger]');
    const content = page.locator('[data-essence-popover-content]');

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');
    await expect(trigger).toHaveAttribute('data-state', 'open');
    await expect(content).toHaveAttribute('data-state', 'open');

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
  });

  test('should close on escape and close button', async ({ page }) => {
    const trigger = page.locator('[data-essence-popover-trigger]');
    const content = page.locator('[data-essence-popover-content]');
    const close = page.locator('[data-essence-popover-close]');

    await trigger.click();
    await expect(content).toBeVisible();

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await close.click();
    await expect(content).toBeHidden();
  });

  test('should close on outside click', async ({ page }) => {
    const trigger = page.locator('[data-essence-popover-trigger]');
    const content = page.locator('[data-essence-popover-content]');

    await trigger.click();
    await expect(content).toBeVisible();

    await page.locator('body').click({ position: { x: 5, y: 5 } });
    await expect(content).toBeHidden();
  });
});
