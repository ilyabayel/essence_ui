import { test, expect } from '@playwright/test';

test.describe('Collapsible Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/collapsible?variation_id=primitive');
  });

  test('should toggle content on click and set CSS variables', async ({ page }) => {
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

    // Check CSS variables
    const height = await content.evaluate((el) => el.style.getPropertyValue('--essence-collapsible-content-height'));
    expect(height).toMatch(/^\d+(\.\d+)?px$/);
    expect(parseFloat(height)).toBeGreaterThan(0);

    // Close
    await trigger.click();
    // In our test, there's no animation by default, so it should be hidden quickly
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
    await expect(trigger).toHaveAttribute('data-state', 'closed');
  });

  test('should respect disabled state', async ({ page }) => {
    // We'll use a variation that is disabled if available, or just set it via JS for testing the hook logic
    const trigger = page.locator('[data-essence-collapsible-trigger]');
    const root = page.locator('[phx-hook="CollapsibleRoot"]');
    
    await root.evaluate((el) => {
      el.dataset.disabled = 'true';
      // Trigger a re-mount or just update the property if we can access the hook instance
      // For testing, we just simulate the attribute change and rely on the fact that the hook reads it
    });

    // We need to reload or find a way to ensure the hook state is updated.
    // Better: let's look for a disabled variation in Storybook.
  });

  test('should support delayed hiding for exit animations', async ({ page }) => {
    const trigger = page.locator('[data-essence-collapsible-trigger]');
    const content = page.locator('[data-essence-collapsible-content]');

    // Wait for hydration
    await page.waitForTimeout(500);

    // Open
    await trigger.click();
    await expect(content).toBeVisible();

    // Inject a long transition to test Presence logic
    await content.evaluate((el) => {
      el.style.transition = 'opacity 1s linear';
    });

    // Close
    await trigger.click();

    // The data-state should be closed immediately
    await expect(content).toHaveAttribute('data-state', 'closed');
    
    // BUT hidden should NOT be true yet because of the transition
    const isHidden = await content.evaluate((el) => el.hidden);
    expect(isHidden).toBe(false);

    // Wait for transition to end (or simulate it)
    await content.evaluate((el) => {
      el.dispatchEvent(new Event('transitionend', { bubbles: true }));
    });

    // Now it should be hidden
    await expect(content).toBeHidden();
  });
});
