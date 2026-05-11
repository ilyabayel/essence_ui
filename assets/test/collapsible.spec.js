import { test, expect } from '@playwright/test';

test.describe('Collapsible Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/collapsible?variation_id=primitive');
  });

  test('should toggle content on click', async ({ page }) => {
    const trigger = page.locator('[data-essence-collapsible-trigger]');
    const content = page.locator('[data-essence-collapsible-content]');

    // Wait for hydration
    await page.waitForTimeout(500);

    // Initial state: closed
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');

    // Open
    await trigger.click();
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');
    await expect(trigger).toHaveAttribute('data-state', 'open');

    // Close
    await trigger.click();
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
    await expect(trigger).toHaveAttribute('data-state', 'closed');
  });
});
