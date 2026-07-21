import { test, expect } from '@playwright/test';

test.describe('Menubar Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/menubar?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open on trigger click and close on escape', async ({ page }) => {
    const fileTrigger = page.locator('#file-trigger');
    const fileContent = page.locator('#file-content');

    await expect(fileContent).toBeHidden();
    await fileTrigger.click();
    await expect(fileContent).toBeVisible();
    await expect(fileTrigger).toHaveAttribute('aria-expanded', 'true');

    await page.keyboard.press('Escape');
    await expect(fileContent).toBeHidden();
  });

  test('should switch menus on hover when one is open', async ({ page }) => {
    const fileTrigger = page.locator('#file-trigger');
    const editTrigger = page.locator('#edit-trigger');
    const fileContent = page.locator('#file-content');
    const editContent = page.locator('#edit-content');

    await fileTrigger.click();
    await expect(fileContent).toBeVisible();

    await editTrigger.hover();
    await expect(editContent).toBeVisible();
    await expect(fileContent).toBeHidden();
  });
});
