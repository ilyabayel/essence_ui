import { test, expect } from '@playwright/test';

test.describe('Accordion Primitive', () => {
  test('single mode should enforce exclusivity and handle collapsible=false', async ({ page }) => {
    await page.goto('/primitives/accordion?variation_id=primitive');
    const root = page.locator('#accordion-primitive');
    const trigger1 = root.locator('[data-essence-accordion-trigger]').nth(0);
    const content1 = root.locator('[data-essence-accordion-content]').nth(0);
    const trigger2 = root.locator('[data-essence-accordion-trigger]').nth(1);
    const content2 = root.locator('[data-essence-accordion-content]').nth(1);

    await page.waitForTimeout(500);

    // Click trigger 1 -> Open
    await trigger1.click();
    await expect(content1).toBeVisible();

    // Click trigger 1 again -> Should NOT close (collapsible=false by default)
    await trigger1.click();
    await expect(content1).toBeVisible();

    // Click trigger 2 -> Open 2, Close 1
    await trigger2.click();
    await expect(content2).toBeVisible();
    await expect(content1).toBeHidden();

    // Check CSS variables on content
    const height = await content2.evaluate((el) => getComputedStyle(el).getPropertyValue('--essence-accordion-content-height'));
    expect(height).toMatch(/^\d+(\.\d+)?px$/);
  });

  test('multiple mode should allow multiple items open', async ({ page }) => {
    await page.goto('/primitives/accordion?variation_id=multiple');
    const root = page.locator('#accordion-multiple');
    const trigger1 = root.locator('[data-essence-accordion-trigger]').nth(0);
    const content1 = root.locator('[data-essence-accordion-content]').nth(0);
    const trigger2 = root.locator('[data-essence-accordion-trigger]').nth(1);
    const content2 = root.locator('[data-essence-accordion-content]').nth(1);

    await page.waitForTimeout(500);

    await trigger1.click();
    await trigger2.click();

    await expect(content1).toBeVisible();
    await expect(content2).toBeVisible();

    await trigger1.click();
    await expect(content1).toBeHidden();
    await expect(content2).toBeVisible();
  });

  test('should support full keyboard navigation', async ({ page }) => {
    await page.goto('/primitives/accordion?variation_id=primitive');
    const root = page.locator('#accordion-primitive');
    const trigger1 = root.locator('[data-essence-accordion-trigger]').nth(0);
    const trigger2 = root.locator('[data-essence-accordion-trigger]').nth(1);

    await page.waitForTimeout(500);

    await trigger1.focus();
    await expect(trigger1).toBeFocused();

    // ArrowDown
    await page.keyboard.press('ArrowDown');
    await expect(trigger2).toBeFocused();

    // ArrowUp
    await page.keyboard.press('ArrowUp');
    await expect(trigger1).toBeFocused();

    // End
    await page.keyboard.press('End');
    await expect(trigger2).toBeFocused();

    // Home
    await page.keyboard.press('Home');
    await expect(trigger1).toBeFocused();
  });
});

test.describe('Accordion Component', () => {
  test('default single mode should work', async ({ page }) => {
    await page.goto('/components/accordion?variation_id=default');
    
    // Scope to the specific variation
    const accordion = page.locator('#accordion-default');
    
    const trigger1 = accordion.getByRole('button', { name: 'Is it accessible?' });
    const content1 = accordion.locator('[data-essence-accordion-content]').filter({ hasText: 'Yes. It adheres to the WAI-ARIA design pattern.' });
    const trigger2 = accordion.getByRole('button', { name: 'Is it unstyled?' });
    const content2 = accordion.locator('[data-essence-accordion-content]').filter({ hasText: "Yes. It's unstyled by default, giving you freedom over the look and feel." });

    await page.waitForTimeout(1000);

    // Initial state: item-1 is open by default_value
    await expect(content1).toBeVisible();
    await expect(content2).toBeHidden();

    // Click item 2
    await trigger2.click();
    await expect(content2).toBeVisible();
    await expect(content1).toBeHidden();
  });

  test('multiple mode should work', async ({ page }) => {
    await page.goto('/components/accordion?variation_id=multiple');
    
    // Scope to the specific variation
    const accordion = page.locator('#accordion-multiple');
    
    const trigger1 = accordion.getByRole('button', { name: 'Item 1' });
    const trigger2 = accordion.getByRole('button', { name: 'Item 2' });
    const content1 = accordion.locator('[data-essence-accordion-content]').filter({ hasText: 'Content for item 1' });
    const content2 = accordion.locator('[data-essence-accordion-content]').filter({ hasText: 'Content for item 2' });

    await page.waitForTimeout(1000);

    await trigger1.click();
    await expect(content1).toBeVisible();
    
    await trigger2.click();
    await expect(content1).toBeVisible();
    await expect(content2).toBeVisible();
    
    await trigger1.click();
    await expect(content1).toBeHidden();
  });
});
