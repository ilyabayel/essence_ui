import { test, expect } from '@playwright/test';

test.describe('Utility Primitives', () => {
  test('Label should render', async ({ page }) => {
    await page.goto('/primitives/label');
    await expect(page.locator('label')).toContainText('First Name');
  });

  test('Separator should render', async ({ page }) => {
    await page.goto('/primitives/separator');
    await expect(page.locator('[role="separator"]').first()).toBeAttached();
  });

  test('AspectRatio should render', async ({ page }) => {
    await page.goto('/primitives/aspect_ratio');
    await expect(page.locator('#square-component').getByText('1:1')).toBeVisible();
  });
});
