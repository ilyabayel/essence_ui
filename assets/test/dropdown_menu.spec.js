import { test, expect } from '@playwright/test';

test.describe('Dropdown Menu Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/dropdown_menu?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open and close on trigger click', async ({ page }) => {
    const trigger = page.locator('[data-essence-dropdown-menu-trigger]');
    const content = page.locator('[data-essence-dropdown-menu-content]');

    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');

    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');
    await expect(content).toHaveAttribute('data-state', 'open');

    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
  });

  test('should close on escape and navigate with arrows', async ({ page }) => {
    const trigger = page.locator('[data-essence-dropdown-menu-trigger]');
    const content = page.locator('[data-essence-dropdown-menu-content]');
    const items = page.locator('[data-essence-dropdown-menu-item]:not([data-disabled]), [data-essence-dropdown-menu-checkbox-item]');

    await trigger.click();
    await expect(content).toBeVisible();

    // First item is focused on open; ArrowDown moves to the next
    await page.keyboard.press('ArrowDown');
    await expect(items.nth(1)).toBeFocused();

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();
  });

  test('should close on outside click and item select', async ({ page }) => {
    const trigger = page.locator('[data-essence-dropdown-menu-trigger]');
    const content = page.locator('[data-essence-dropdown-menu-content]');
    const item = page.locator('[data-essence-dropdown-menu-item]').filter({ hasText: 'Close' });

    await trigger.click();
    await expect(content).toBeVisible();

    await page.locator('body').click({ position: { x: 5, y: 5 } });
    await expect(content).toBeHidden();

    await trigger.click();
    await expect(content).toBeVisible();
    await item.click();
    await expect(content).toBeHidden();
  });
});
