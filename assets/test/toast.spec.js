import { test, expect } from '@playwright/test';

test.describe('Toast Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/toast?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should render open toast with title and description', async ({ page }) => {
    const root = page.locator('[data-essence-toast-root]');
    const title = page.locator('[data-essence-toast-title]');
    const description = page.locator('[data-essence-toast-description]');

    await expect(root).toHaveAttribute('data-state', 'open');
    await expect(root).toBeVisible();
    await expect(title).toContainText('Scheduled: Catch up');
    await expect(description).toContainText('Friday at 5:30 PM');
  });

  test('should close when close button is clicked', async ({ page }) => {
    const root = page.locator('[data-essence-toast-root]');
    const close = page.locator('[data-essence-toast-close]');

    await expect(root).toBeVisible();
    await close.click();
    await expect(root).toHaveAttribute('data-state', 'closed');
    await expect(root).toBeHidden();
  });

  test('should close on Escape when toast is focused', async ({ page }) => {
    const root = page.locator('[data-essence-toast-root]');

    await root.focus();
    await page.keyboard.press('Escape');
    await expect(root).toHaveAttribute('data-state', 'closed');
    await expect(root).toBeHidden();
  });

  test('should auto-dismiss after duration', async ({ page }) => {
    const root = page.locator('[data-essence-toast-root]');

    await expect(root).toBeVisible();
    // Story sets duration={3000} on the root
    await expect(root).toBeHidden({ timeout: 4500 });
    await expect(root).toHaveAttribute('data-state', 'closed');
  });

  test('should focus viewport on F8 hotkey', async ({ page }) => {
    const viewport = page.locator('[data-essence-toast-viewport]');

    await page.keyboard.press('F8');
    await expect(viewport).toBeFocused();
  });

  test('should expose swipe direction from provider on root', async ({ page }) => {
    const root = page.locator('[data-essence-toast-root]');
    await expect(root).toHaveAttribute('data-swipe-direction', 'right');
  });
});
