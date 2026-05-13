# Checkbox Primitive Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a headless, accessible Checkbox primitive with 100% behavioral parity with Radix UI, supporting indeterminate states and native form integration.

**Architecture:** A multipart component (`root`, `trigger`, `indicator`, `bubble_input`) coordinated by a single Phoenix Hook (`CheckboxRoot`). It uses a hidden native input to bridge custom visual state with browser form standards.

**Tech Stack:** Elixir (Phoenix Components), JavaScript (Phoenix Hooks), Playwright (E2E Testing).

---

### Task 1: Scaffold Elixir Primitives and Storybook

**Files:**
- Create: `lib/essence_ui/primitives/checkbox.ex`
- Create: `storybook/primitives/checkbox.story.exs`

- [ ] **Step 1: Create the Checkbox primitive module**

```elixir
defmodule EssenceUI.Primitives.Checkbox do
  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :checked, :any, default: false # true | false | "indeterminate"
  attr :default_checked, :any, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :name, :string, default: nil
  attr :value, :string, default: "on"
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    state = case assigns.checked || assigns.default_checked do
      "indeterminate" -> "indeterminate"
      true -> "checked"
      _ -> "unchecked"
    end

    assigns = assign(assigns, :state, state)

    ~H"""
    <div
      id={@id}
      phx-hook="CheckboxRoot"
      data-state={@state}
      data-disabled={to_string(@disabled)}
      data-default-checked={to_string(@default_checked)}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def trigger(assigns) do
    ~H"""
    <button
      type="button"
      role="checkbox"
      data-essence-checkbox-trigger
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def indicator(assigns) do
    ~H"""
    <span
      data-essence-checkbox-indicator
      style="pointer-events: none;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :rest, :global
  def bubble_input(assigns) do
    ~H"""
    <input
      type="checkbox"
      data-essence-checkbox-input
      style="position: absolute; pointer-events: none; opacity: 0; margin: 0; transform: translateX(-100%);"
      tabindex="-1"
      aria-hidden="true"
      {@rest}
    />
    """
  end
end
```

- [ ] **Step 2: Create Storybook variations**

```elixir
defmodule Storybook.Primitives.CheckboxStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Checkbox

  def function, do: &Checkbox.root/1

  def variations do
    [
      %Variation{
        id: :primitive,
        template: """
        <Checkbox.root id="checkbox-1">
          <Checkbox.trigger class="w-5 h-5 border border-slate-300 rounded data-[state=checked]:bg-indigo-600">
            <Checkbox.indicator class="text-white block data-[state=unchecked]:hidden">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="4"><path d="M5 12l5 5L20 7"/></svg>
            </Checkbox.indicator>
          </Checkbox.trigger>
          <Checkbox.bubble_input />
        </Checkbox.root>
        """
      }
    ]
  end
end
```

- [ ] **Step 3: Commit**

```bash
git add lib/essence_ui/primitives/checkbox.ex storybook/primitives/checkbox.story.exs
git commit -m "feat(checkbox): scaffold primitive and story"
```

---

### Task 2: Implement CheckboxRoot JS Hook (State & Click)

**Files:**
- Create: `assets/js/hooks/checkbox_root.js`
- Modify: `assets/js/storybook.js` (to register the hook)

- [ ] **Step 1: Implement basic hook logic**

```javascript
export const CheckboxRoot = {
  mounted() {
    this.trigger = this.el.querySelector('[data-essence-checkbox-trigger]');
    this.input = this.el.querySelector('[data-essence-checkbox-input]');
    this.indicator = this.el.querySelector('[data-essence-checkbox-indicator]');
    this.disabled = this.el.dataset.disabled === 'true';

    if (this.trigger) {
      this.trigger.addEventListener('click', () => {
        if (this.disabled) return;
        const currentState = this.el.dataset.state;
        const newState = currentState === 'checked' || currentState === 'indeterminate' ? 'unchecked' : 'checked';
        this.updateState(newState);
      });
      
      this.trigger.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') e.preventDefault();
      });
    }

    this.syncAria();
  },

  updateState(state) {
    this.el.dataset.state = state;
    if (this.trigger) this.trigger.dataset.state = state;
    if (this.indicator) this.indicator.dataset.state = state;
    
    if (this.input) {
      this.input.checked = state === 'checked';
      this.input.indeterminate = state === 'indeterminate';
      // Dispatch click on hidden input to bubble events to forms
      this.input.dispatchEvent(new Event('click', { bubbles: true }));
    }
    
    this.syncAria();
  },

  syncAria() {
    if (this.trigger) {
      const state = this.el.dataset.state;
      this.trigger.setAttribute('aria-checked', state === 'indeterminate' ? 'mixed' : (state === 'checked' ? 'true' : 'false'));
    }
  }
};
```

- [ ] **Step 2: Register hook in storybook.js**

```javascript
// ... existing imports
import { CheckboxRoot } from "./hooks/checkbox_root";

let Hooks = {
  // ...
  CheckboxRoot
};
// ...
```

- [ ] **Step 3: Verify manually in Storybook**

- [ ] **Step 4: Commit**

```bash
git add assets/js/hooks/checkbox_root.js assets/js/storybook.js
git commit -m "feat(checkbox): implement JS hook for state and click"
```

---

### Task 3: Implement Form Integration and Reset

**Files:**
- Modify: `assets/js/hooks/checkbox_root.js`

- [ ] **Step 1: Add form reset listener**

```javascript
// In CheckboxRoot.mounted
const form = this.el.closest('form');
if (form) {
  this._onReset = () => {
    const defaultChecked = this.el.dataset.defaultChecked === 'true';
    this.updateState(defaultChecked ? 'checked' : 'unchecked');
  };
  form.addEventListener('reset', this._onReset);
}

// In destroyed()
if (this._onReset) {
  this.el.closest('form')?.removeEventListener('reset', this._onReset);
}
```

- [ ] **Step 2: Implement Presence logic for Indicator**
Use the same pattern as `CollapsibleRoot` to handle entrance/exit animations if defined.

- [ ] **Step 3: Commit**

```bash
git add assets/js/hooks/checkbox_root.js
git commit -m "feat(checkbox): add form reset and presence logic"
```

---

### Task 4: Complete Playwright Test Suite

**Files:**
- Create: `assets/test/checkbox.spec.js`

- [ ] **Step 1: Write comprehensive tests**

```javascript
import { test, expect } from '@playwright/test';

test.describe('Checkbox Primitive', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/primitives/checkbox?variation_id=primitive');
  });

  test('should toggle state on click', async ({ page }) => {
    const trigger = page.locator('[data-essence-checkbox-trigger]');
    const root = page.locator('#checkbox-1');

    await expect(root).toHaveAttribute('data-state', 'unchecked');
    await trigger.click();
    await expect(root).toHaveAttribute('data-state', 'checked');
    await trigger.click();
    await expect(root).toHaveAttribute('data-state', 'unchecked');
  });

  test('should prevent Enter key default', async ({ page }) => {
    const trigger = page.locator('[data-essence-checkbox-trigger]');
    await trigger.focus();
    await page.keyboard.press('Enter');
    await expect(page.locator('#checkbox-1')).toHaveAttribute('data-state', 'unchecked');
  });

  test('should sync with hidden input', async ({ page }) => {
    const trigger = page.locator('[data-essence-checkbox-trigger]');
    const input = page.locator('[data-essence-checkbox-input]');

    await trigger.click();
    const isChecked = await input.evaluate(el => el.checked);
    expect(isChecked).toBe(true);
  });
});
```

- [ ] **Step 2: Run tests**

Run: `npx playwright test test/checkbox.spec.js`

- [ ] **Step 3: Commit**

```bash
git add assets/test/checkbox.spec.js
git commit -m "test(checkbox): add E2E tests"
```
