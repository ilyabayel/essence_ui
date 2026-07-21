import { test, expect } from '@playwright/test';

test.describe('Dialog Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/dialog?variation_id=primitive');
  });

  test('should open and close via trigger, escape, and close button', async ({ page }) => {
    const trigger = page.locator('[data-essence-dialog-trigger]');
    const content = page.locator('[data-essence-dialog-content]');
    const overlay = page.locator('[data-essence-dialog-overlay]');
    const close = page.locator('[data-essence-dialog-close]');

    await page.waitForTimeout(500);

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('data-state', 'closed');

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(overlay).toBeVisible();
    await expect(trigger).toHaveAttribute('data-state', 'open');
    await expect(content).toHaveAttribute('data-state', 'open');

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('data-state', 'closed');

    await trigger.click();
    await expect(content).toBeVisible();

    await close.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('data-state', 'closed');
  });

  test('should close on overlay click', async ({ page }) => {
    const trigger = page.locator('[data-essence-dialog-trigger]');
    const content = page.locator('[data-essence-dialog-content]');
    const overlay = page.locator('[data-essence-dialog-overlay]');

    await page.waitForTimeout(500);

    await trigger.click();
    await expect(content).toBeVisible();

    await overlay.click({ position: { x: 2, y: 2 } });
    await expect(content).toBeHidden();
  });
});
