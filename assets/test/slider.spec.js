import { test, expect } from '@playwright/test';

test.describe('Slider Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/slider?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should update value with keyboard arrows', async ({ page }) => {
    const root = page.locator('#slider-primitive');
    const thumb = root.locator('[data-essence-slider-thumb]');

    await expect(thumb).toHaveAttribute('aria-valuenow', '50');

    await thumb.focus();
    await page.keyboard.press('ArrowRight');
    await expect(thumb).toHaveAttribute('aria-valuenow', '51');

    await page.keyboard.press('ArrowLeft');
    await expect(thumb).toHaveAttribute('aria-valuenow', '50');

    await page.keyboard.press('Home');
    await expect(thumb).toHaveAttribute('aria-valuenow', '0');

    await page.keyboard.press('End');
    await expect(thumb).toHaveAttribute('aria-valuenow', '100');

    const start = await root.evaluate((el) =>
      el.style.getPropertyValue('--essence-slider-range-start')
    );
    const end = await root.evaluate((el) =>
      el.style.getPropertyValue('--essence-slider-range-end')
    );
    expect(start).toBe('0%');
    expect(end).toBe('100%');
  });

  test('should support range thumbs', async ({ page }) => {
    await page.goto('/primitives/slider?variation_id=range');
    await page.waitForTimeout(500);

    const root = page.locator('#slider-range');
    const thumbs = root.locator('[data-essence-slider-thumb]');

    await expect(thumbs).toHaveCount(2);
    await expect(thumbs.nth(0)).toHaveAttribute('aria-valuenow', '25');
    await expect(thumbs.nth(1)).toHaveAttribute('aria-valuenow', '75');

    await thumbs.nth(0).focus();
    await page.keyboard.press('ArrowRight');
    await expect(thumbs.nth(0)).toHaveAttribute('aria-valuenow', '26');
  });
});
