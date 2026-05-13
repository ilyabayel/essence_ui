import { test, expect } from '@playwright/test';

test.describe('Radio', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/components/radio?variation_id=default');
    await page.waitForTimeout(500);
  });

  test('should render as input type radio', async ({ page }) => {
    const radio = page.locator('#radio-single-default');
    await expect(radio).toBeVisible();
    await expect(radio).toHaveAttribute('name', 'default_example');
    await expect(radio).toHaveValue('option1');
  });

  test('should be checkable', async ({ page }) => {
    const radio = page.locator('#radio-single-default');
    await expect(radio).not.toBeChecked();
    
    await radio.click();
    await expect(radio).toBeChecked();
  });

  test('should support disabled state', async ({ page }) => {
    const radio = page.locator('#radio-single-disabled');
    await expect(radio).toBeDisabled();
  });

  test('should support high contrast', async ({ page }) => {
    await page.goto('/components/radio?variation_id=high_contrast');
    const radio = page.locator('input[name="contrast_example"]');
    await expect(radio).toHaveAttribute('data-accent-color', 'blue');
  });

  test('should work within a manual label', async ({ page }) => {
    await page.goto('/components/radio?variation_id=form_example');
    const mediumLabel = page.locator('label:has-text("Medium")');
    const mediumRadio = mediumLabel.locator('input[type="radio"]');
    const largeLabel = page.locator('label:has-text("Large")');
    const largeRadio = largeLabel.locator('input[type="radio"]');

    await expect(mediumRadio).toBeChecked();
    await expect(largeRadio).not.toBeChecked();

    await largeLabel.click();
    await expect(largeRadio).toBeChecked();
    await expect(mediumRadio).not.toBeChecked();
  });
});
