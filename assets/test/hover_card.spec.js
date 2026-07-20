import { test, expect } from '@playwright/test';

test.describe('Hover Card Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/hover_card?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open on hover after delay and close on leave', async ({ page }) => {
    const trigger = page.locator('[data-essence-hover-card-trigger]');
    const content = page.locator('[data-essence-hover-card-content]');

    await expect(content).toBeHidden();

    await trigger.hover();
    await page.waitForTimeout(150);
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('data-state', 'open');
    await expect(content).toHaveAttribute('data-state', 'open');

    await page.mouse.move(0, 0);
    await page.waitForTimeout(200);
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('data-state', 'closed');
  });

  test('should stay open when moving from trigger to content', async ({ page }) => {
    const trigger = page.locator('[data-essence-hover-card-trigger]');
    const content = page.locator('[data-essence-hover-card-content]');

    await trigger.hover();
    await page.waitForTimeout(150);
    await expect(content).toBeVisible();

    await content.hover();
    await page.waitForTimeout(200);
    await expect(content).toBeVisible();
  });
});
