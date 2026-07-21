import { test, expect } from '@playwright/test';

test.describe('Toolbar Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/toolbar?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should navigate focusable items with arrow keys', async ({ page }) => {
    const root = page.locator('#toolbar-primitive');
    const cut = root.locator('[data-essence-toolbar-button]', { hasText: 'Cut' });
    const copy = root.locator('[data-essence-toolbar-button]', { hasText: 'Copy' });
    const paste = root.locator('[data-essence-toolbar-button]', { hasText: 'Paste' });

    await cut.focus();
    await expect(cut).toBeFocused();

    await page.keyboard.press('ArrowRight');
    await expect(copy).toBeFocused();

    await page.keyboard.press('ArrowRight');
    await expect(paste).toBeFocused();

    await page.keyboard.press('Home');
    await expect(cut).toBeFocused();

    await page.keyboard.press('End');
    const last = root.locator('[data-essence-toolbar-link]');
    await expect(last).toBeFocused();
  });

  test('should toggle items in toggle group', async ({ page }) => {
    const root = page.locator('#toolbar-primitive');
    const left = root.locator('[data-essence-toolbar-toggle-item][data-value="left"]');
    const center = root.locator('[data-essence-toolbar-toggle-item][data-value="center"]');

    await expect(center).toHaveAttribute('data-state', 'on');
    await expect(center).toHaveAttribute('aria-pressed', 'true');

    await left.click();
    await expect(left).toHaveAttribute('data-state', 'on');
    await expect(center).toHaveAttribute('data-state', 'off');
  });
});
