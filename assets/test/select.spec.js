import { test, expect } from '@playwright/test';

test.describe('Select Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/select?variation_id=primitive');
    await page.waitForTimeout(500);
  });

  test('should open and close on trigger click', async ({ page }) => {
    const trigger = page.locator('#select-primitive [data-essence-select-trigger]');
    const content = page.locator('#select-primitive [data-essence-select-content]');

    await expect(content).toBeHidden();
    
    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    await expect(content).toBeVisible();
    await expect(trigger).toHaveAttribute('aria-expanded', 'true');

    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    await expect(content).toBeHidden();
    await expect(trigger).toHaveAttribute('aria-expanded', 'false');
  });

  test('should select item on click', async ({ page }) => {
    const root = page.locator('#select-primitive');
    const trigger = page.locator('#select-primitive [data-essence-select-trigger]');
    const value = page.locator('#select-primitive [data-essence-select-value]');
    const content = page.locator('#select-primitive [data-essence-select-content]');
    const orangeItem = content.locator('[data-essence-select-item][data-value="orange"]');

    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    await orangeItem.click({ force: true });
    await page.waitForTimeout(200);

    await expect(content).toBeHidden();
    await expect(root).toHaveAttribute('data-value', 'orange');
    await expect(value).toHaveText('Orange');
  });

  test('should close on escape key', async ({ page }) => {
    const trigger = page.locator('#select-primitive [data-essence-select-trigger]');
    const content = page.locator('#select-primitive [data-essence-select-content]');

    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    await expect(content).toBeVisible();

    await page.keyboard.press('Escape');
    await page.waitForTimeout(200);
    await expect(content).toBeHidden();
    await expect(trigger).toBeFocused();
  });

  test('should navigate with keyboard', async ({ page }) => {
    const trigger = page.locator('#select-primitive [data-essence-select-trigger]');
    const content = page.locator('#select-primitive [data-essence-select-content]');
    const appleItem = content.locator('[data-essence-select-item][data-value="apple"]');
    const orangeItem = content.locator('[data-essence-select-item][data-value="orange"]');

    await trigger.focus();
    await page.keyboard.press('Enter');
    await page.waitForTimeout(200);
    await expect(content).toBeVisible();

    // ArrowDown
    await page.keyboard.press('ArrowDown');
    await expect(orangeItem).toBeFocused();

    // ArrowUp
    await page.keyboard.press('ArrowUp');
    await expect(appleItem).toBeFocused();

    // Select with Enter
    await page.keyboard.press('ArrowDown');
    await page.keyboard.press('Enter');
    await page.waitForTimeout(200);
    
    await expect(content).toBeHidden();
    const root = page.locator('#select-primitive');
    await expect(root).toHaveAttribute('data-value', 'orange');
  });

  test('should support type-to-select', async ({ page }) => {
    const trigger = page.locator('#select-primitive [data-essence-select-trigger]');
    const content = page.locator('#select-primitive [data-essence-select-content]');
    const carrotItem = content.locator('[data-essence-select-item][data-value="carrot"]');

    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    await page.keyboard.type('ca');
    
    await expect(carrotItem).toBeFocused();
  });
});

test.describe('Select Component', () => {
  test('should render themed select correctly', async ({ page }) => {
    await page.goto('/components/select?variation_id=default');
    await page.waitForTimeout(500);
    
    const trigger = page.locator('#select-default [data-essence-select-trigger]');
    await expect(trigger).toHaveClass(/rt-SelectTrigger/);
    await expect(trigger).toHaveClass(/rt-r-size-2/);
    await expect(trigger).toHaveClass(/rt-variant-surface/);

    await trigger.click({ force: true });
    await page.waitForTimeout(200);
    const content = page.locator('#select-default [data-essence-select-content]');
    await expect(content).toBeVisible();
    await expect(content).toHaveClass(/rt-SelectContent/);
    await expect(content).toHaveClass(/rt-variant-solid/);
    
    const label = content.locator('.rt-SelectLabel').first();
    await expect(label).toHaveText('Fruits');
  });
});
