import { test, expect } from '@playwright/test';

test.describe('Accordion Primitive', () => {
  test.beforeEach(async ({ page }) => {
    // Navigate to the storybook variation for the accordion primitive
    await page.goto('/primitives/accordion?variation_id=primitive');
  });

  test('should open and close items on click', async ({ page }) => {
    const trigger1 = page.locator('[data-essence-accordion-trigger]').nth(0);
    const content1 = page.locator('[data-essence-accordion-content]').nth(0);
    const trigger2 = page.locator('[data-essence-accordion-trigger]').nth(1);
    const content2 = page.locator('[data-essence-accordion-content]').nth(1);

    // Initial state: both closed
    await expect(content1).toBeHidden();
    await expect(content2).toBeHidden();

    // Wait for hydration
    await page.waitForTimeout(500);

    // Click trigger 1
    await trigger1.click();
    await expect(content1).toBeVisible();
    await expect(trigger1).toHaveAttribute('aria-expanded', 'true');
    await expect(trigger1).toHaveAttribute('data-state', 'open');

    // Click trigger 2 (should close 1 because type is single)
    await trigger2.click();
    await expect(content2).toBeVisible();
    await expect(content1).toBeHidden();
    await expect(trigger2).toHaveAttribute('aria-expanded', 'true');
    await expect(trigger1).toHaveAttribute('aria-expanded', 'false');
  });

  test('should support keyboard navigation', async ({ page }) => {
    const trigger1 = page.locator('[data-essence-accordion-trigger]').nth(0);
    const trigger2 = page.locator('[data-essence-accordion-trigger]').nth(1);

    // Wait for hydration
    await page.waitForTimeout(500);

    await trigger1.focus();
    await expect(trigger1).toBeFocused();

    await page.keyboard.press('ArrowDown');
    await expect(trigger2).toBeFocused();

    await page.keyboard.press('ArrowUp');
    await expect(trigger1).toBeFocused();

    await page.keyboard.press('Enter');
    const content1 = page.locator('[data-essence-accordion-content]').nth(0);
    await expect(content1).toBeVisible();
  });
});
