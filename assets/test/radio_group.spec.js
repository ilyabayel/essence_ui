import { test, expect } from '@playwright/test';

test.describe('Radio Group', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/components/radio_group?variation_id=default');
    await page.waitForTimeout(500);
  });

  test('should select item on click via label', async ({ page }) => {
    const root = page.locator('#radio-default');
    const appleItem = root.locator('[data-essence-radio-group-item][data-value="apple"]');
    const orangeItem = root.locator('[data-essence-radio-group-item][data-value="orange"]');
    const orangeLabel = root.locator('label:has-text("Orange")');
    const hiddenInput = root.locator('input[type="hidden"][name="fruit"]');

    // Initial state
    await expect(root).toHaveAttribute('data-value', 'apple');
    await expect(appleItem).toHaveAttribute('aria-checked', 'true');
    await expect(hiddenInput).toHaveValue('apple');

    // Click orange label
    await orangeLabel.click();
    await page.waitForTimeout(200);

    await expect(root).toHaveAttribute('data-value', 'orange');
    await expect(orangeItem).toHaveAttribute('aria-checked', 'true');
    await expect(appleItem).toHaveAttribute('aria-checked', 'false');
    await expect(hiddenInput).toHaveValue('orange');
  });

  test('should navigate with keyboard', async ({ page }) => {
    const root = page.locator('#radio-default');
    const appleItem = root.locator('[data-essence-radio-group-item][data-value="apple"]');
    const orangeItem = root.locator('[data-essence-radio-group-item][data-value="orange"]');
    const bananaItem = root.locator('[data-essence-radio-group-item][data-value="banana"]');

    await appleItem.focus();
    
    // ArrowDown to Orange
    await page.keyboard.press('ArrowDown');
    await page.waitForTimeout(200);
    await expect(orangeItem).toBeFocused();
    await expect(orangeItem).toHaveAttribute('aria-checked', 'true');
    await expect(root).toHaveAttribute('data-value', 'orange');

    // ArrowDown to Banana
    await page.keyboard.press('ArrowDown');
    await page.waitForTimeout(200);
    await expect(bananaItem).toBeFocused();
    await expect(bananaItem).toHaveAttribute('aria-checked', 'true');

    // ArrowDown loops to Apple
    await page.keyboard.press('ArrowDown');
    await page.waitForTimeout(200);
    await expect(appleItem).toBeFocused();
    await expect(appleItem).toHaveAttribute('aria-checked', 'true');

    // ArrowUp loops to Banana
    await page.keyboard.press('ArrowUp');
    await page.waitForTimeout(200);
    await expect(bananaItem).toBeFocused();

    // End to Banana
    await page.keyboard.press('End');
    await page.waitForTimeout(200);
    await expect(bananaItem).toBeFocused();

    // Home to Apple
    await page.keyboard.press('Home');
    await page.waitForTimeout(200);
    await expect(appleItem).toBeFocused();
  });

  test('should support horizontal navigation', async ({ page }) => {
    await page.goto('/components/radio_group?variation_id=horizontal');
    const root = page.locator('#radio-horizontal');
    const item1 = root.locator('[data-essence-radio-group-item][data-value="1"]');
    const item2 = root.locator('[data-essence-radio-group-item][data-value="2"]');

    await item1.focus();
    await page.waitForTimeout(200);

    // ArrowRight to Item 2
    await page.keyboard.press('ArrowRight');
    await page.waitForTimeout(500);
    await expect(item2).toBeFocused();
    await expect(item2).toHaveAttribute('aria-checked', 'true');

    // ArrowLeft back to Item 1
    await page.keyboard.press('ArrowLeft');
    await page.waitForTimeout(500);
    await expect(item1).toBeFocused();
    await expect(item1).toHaveAttribute('aria-checked', 'true');

    // ArrowDown should be ignored in horizontal orientation
    await page.keyboard.press('ArrowDown');
    await page.waitForTimeout(200);
    await expect(item1).toBeFocused();
  });

  test('should skip disabled items during navigation', async ({ page }) => {
    await page.goto('/components/radio_group?variation_id=disabled');
    const root = page.locator('#radio-disabled-item');
    const item1 = root.locator('[data-essence-radio-group-item][data-value="1"]');
    const item3 = root.locator('[data-essence-radio-group-item][data-value="3"]');

    await item1.focus();
    await page.waitForTimeout(200);

    // ArrowDown should skip item2 and go to item3
    await page.keyboard.press('ArrowDown');
    await page.waitForTimeout(500);
    await expect(item3).toBeFocused();
    await expect(item3).toHaveAttribute('aria-checked', 'true');

    // ArrowUp should skip item2 and go back to item1
    await page.keyboard.press('ArrowUp');
    await page.waitForTimeout(500);
    await expect(item1).toBeFocused();
    await expect(item1).toHaveAttribute('aria-checked', 'true');
  });

  test('should not interact when root is disabled', async ({ page }) => {
    await page.goto('/components/radio_group?variation_id=disabled');
    const root = page.locator('#radio-disabled-root');
    const item1 = root.locator('[data-essence-radio-group-item][data-value="1"]');

    await expect(item1).toBeDisabled();
    
    // Check initial value
    await expect(root).toHaveAttribute('data-value', '1');
  });
});
