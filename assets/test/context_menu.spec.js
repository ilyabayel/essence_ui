import { test, expect } from '@playwright/test';

test.describe('Context Menu Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/context_menu?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open on right click and close on escape', async ({ page }) => {
    const trigger = page.locator('[data-essence-context-menu-trigger]');
    const content = page.locator('[data-essence-context-menu-content]');

    await expect(content).toBeHidden();

    await trigger.click({ button: 'right' });
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');
    await expect(content).toHaveAttribute('data-state', 'open');

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
  });

  test('should navigate with keyboard and close on item click', async ({ page }) => {
    const trigger = page.locator('[data-essence-context-menu-trigger]');
    const content = page.locator('[data-essence-context-menu-content]');
    const items = page.locator('[data-essence-context-menu-item]');

    await trigger.click({ button: 'right' });
    await expect(content).toBeVisible();

    // First item is focused on open; ArrowDown moves to the next
    await page.keyboard.press('ArrowDown');
    await expect(items.nth(1)).toBeFocused();

    await items.filter({ hasText: 'Reload' }).click();
    await expect(content).toBeHidden();
  });

  test('should close on outside click', async ({ page }) => {
    const trigger = page.locator('[data-essence-context-menu-trigger]');
    const content = page.locator('[data-essence-context-menu-content]');

    await trigger.click({ button: 'right' });
    await expect(content).toBeVisible();

    await page.locator('body').click({ position: { x: 5, y: 5 } });
    await expect(content).toBeHidden();
  });
});
