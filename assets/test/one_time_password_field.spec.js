import { test, expect } from '@playwright/test';

test.describe('One-Time Password Field Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/one_time_password_field?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('moves focus forward while typing and updates hidden value', async ({ page }) => {
    const root = page.locator('[data-essence-otp-root]');
    const inputs = root.locator('[data-essence-otp-input]');
    const hidden = root.locator('[data-essence-otp-hidden]');

    await expect(inputs).toHaveCount(6);

    await inputs.nth(0).focus();
    await page.keyboard.type('123456');

    await expect(hidden).toHaveValue('123456');
    await expect(root).toHaveAttribute('data-value', '123456');
    await expect(inputs.nth(5)).toBeFocused();
  });

  test('supports paste to fill all inputs', async ({ page }) => {
    const root = page.locator('[data-essence-otp-root]');
    const inputs = root.locator('[data-essence-otp-input]');
    const hidden = root.locator('[data-essence-otp-hidden]');

    await inputs.nth(0).focus();
    await page.evaluate(() => {
      const input = document.querySelector('[data-essence-otp-input]');
      const event = new ClipboardEvent('paste', {
        bubbles: true,
        cancelable: true,
        clipboardData: new DataTransfer(),
      });
      event.clipboardData.setData('text', '987654');
      input.dispatchEvent(event);
    });

    await expect(hidden).toHaveValue('987654');
    for (let i = 0; i < 6; i++) {
      await expect(inputs.nth(i)).toHaveValue(String(i === 0 ? 9 : i === 1 ? 8 : i === 2 ? 7 : i === 3 ? 6 : i === 4 ? 5 : 4));
    }
  });

  test('arrow keys and backspace navigate between inputs', async ({ page }) => {
    const root = page.locator('[data-essence-otp-root]');
    const inputs = root.locator('[data-essence-otp-input]');

    await inputs.nth(0).focus();
    await page.keyboard.type('12');
    await expect(inputs.nth(2)).toBeFocused();

    await page.keyboard.press('ArrowLeft');
    await expect(inputs.nth(1)).toBeFocused();

    await page.keyboard.press('Backspace');
    await expect(inputs.nth(1)).toHaveValue('');
    await expect(root.locator('[data-essence-otp-hidden]')).toHaveValue('1');

    await page.keyboard.press('Backspace');
    await expect(inputs.nth(0)).toBeFocused();
  });
});
