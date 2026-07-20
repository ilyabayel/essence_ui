import { test, expect } from '@playwright/test';

test.describe('Navigation Menu Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/navigation_menu?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open content on trigger click and close on escape', async ({ page }) => {
    const trigger = page.locator('[data-essence-navigation-menu-trigger]');
    const content = page.locator('[data-essence-navigation-menu-content]');

    await expect(content).toBeHidden();
    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');

    await page.keyboard.press('Escape');
    await expect(content).toBeHidden();
  });
});
