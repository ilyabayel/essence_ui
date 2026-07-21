import { test, expect } from '@playwright/test';

test.describe('Scroll Area Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/scroll_area?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should render viewport and update scrollbar on scroll', async ({ page }) => {
    const root = page.locator('#scroll-area-primitive');
    const viewport = root.locator('[data-essence-scroll-area-viewport]');
    const scrollbar = root.locator('[data-essence-scroll-area-scrollbar][data-orientation="vertical"]');
    const thumb = scrollbar.locator('[data-essence-scroll-area-thumb]');

    await expect(viewport).toBeVisible();
    await expect(scrollbar).toBeVisible();
    await expect(scrollbar).toHaveAttribute('data-state', 'visible');

    const thumbHeight = await thumb.evaluate((el) => el.style.height);
    expect(thumbHeight).toMatch(/^\d+(\.\d+)?px$/);

    await viewport.evaluate((el) => {
      el.scrollTop = 80;
    });
    await page.waitForTimeout(100);

    const transform = await thumb.evaluate((el) => el.style.transform);
    expect(transform).toMatch(/translateY\(/);
  });
});
