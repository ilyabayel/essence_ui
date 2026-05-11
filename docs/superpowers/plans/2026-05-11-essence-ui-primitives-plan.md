# Implementation Plan: EssenceUI Primitives (Phase 1)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement the foundation and first 5 headless primitives (Accordion, Collapsible, Label, Separator, Aspect Ratio) with full ARIA compliance and Playwright tests.

**Architecture:** Approach 1 (Functional Wrappers) using Phoenix Hooks for client-side state. Every component is split into composable "Parts".

**Tech Stack:** Elixir, Phoenix LiveView, Phoenix Hooks, Playwright.

---

### Task 0: Foundation & Playwright Setup

**Files:**
- Create: `lib/essence_ui/primitives.ex`
- Modify: `assets/package.json`
- Create: `assets/playwright.config.js`

- [ ] **Step 1: Create shared primitive helpers**
Create `lib/essence_ui/primitives.ex` with common attributes and utility functions for generating data-attributes and ARIA tags.
```elixir
defmodule EssenceUI.Primitives do
  use Phoenix.Component

  defmacro __using__(_) do
    quote do
      import EssenceUI.Primitives
      use Phoenix.Component
    end
  end

  # Shared logic for generating data-attributes from boolean assigns
  def data_attributes(assigns, keys) do
    for key <- keys, into: %{} do
      {"data-#{key |> Atom.to_string() |> String.replace("_", "-")}", to_string(Map.get(assigns, key))}
    end
  end
end
```

- [ ] **Step 2: Install Playwright in assets/**
Run: `cd assets && npm install -D @playwright/test`

- [ ] **Step 3: Create Playwright config**
Create `assets/playwright.config.js`:
```javascript
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './test',
  use: {
    baseURL: 'http://localhost:4001',
  },
  webServer: {
    command: 'mix phx.server',
    url: 'http://localhost:4001',
    reuseExistingServer: !process.env.CI,
  },
});
```

- [ ] **Step 4: Commit**
```bash
git add lib/essence_ui/primitives.ex assets/package.json assets/playwright.config.js
git commit -m "chore: setup primitives foundation and playwright"
```

---

### Task 1: Accordion Primitive

**Files:**
- Create: `lib/essence_ui/primitives/accordion.ex`
- Modify: `assets/js/hooks/accordion.js`
- Create: `assets/test/accordion.spec.js`

- [ ] **Step 1: Implement Accordion Primitives**
```elixir
defmodule EssenceUI.Primitives.Accordion do
  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :collapsible, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def root(assigns) do
    ~H"""
    <div id={@id} phx-hook="AccordionRoot" data-type={@type} data-collapsible={to_string(@collapsible)} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def item(assigns) do
    ~H"""
    <div data-state="closed" data-disabled={to_string(@disabled)} data-value={@value} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def header(assigns) do
    ~H"""
    <h3 data-orientation="vertical" {@rest}>
      {render_slot(@inner_block)}
    </h3>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def trigger(assigns) do
    ~H"""
    <button type="button" aria-expanded="false" {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def content(assigns) do
    ~H"""
    <div role="region" hidden {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
```

- [ ] **Step 2: Refactor Accordion Hook**
Update `assets/js/hooks/accordion.js` to handle the new composable structure (finding items/triggers via data attributes rather than specific classes).

- [ ] **Step 3: Write Playwright Test**
Create `assets/test/accordion.spec.js` to verify keyboard navigation (Arrows) and ARIA states.

- [ ] **Step 4: Commit**
```bash
git add lib/essence_ui/primitives/accordion.ex assets/js/hooks/accordion.js assets/test/accordion.spec.js
git commit -m "feat: implement accordion primitive"
```

---

### Task 2: Collapsible Primitive

**Files:**
- Create: `lib/essence_ui/primitives/collapsible.ex`
- Create: `assets/js/hooks/collapsible.js`

- [ ] **Step 1: Implement Collapsible Primitives**
```elixir
defmodule EssenceUI.Primitives.Collapsible do
  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true
  def root(assigns) do
    ~H"""
    <div id={@id} phx-hook="CollapsibleRoot" data-state={if @open, do: "open", else: "closed"} data-disabled={to_string(@disabled)} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def trigger(assigns) do
    ~H"""
    <button type="button" aria-controls={@id} aria-expanded="false" {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :rest, :global
  slot :inner_block, required: true
  def content(assigns) do
    ~H"""
    <div id={@id} hidden {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
```

- [ ] **Step 2: Implement Collapsible Hook**
Create `assets/js/hooks/collapsible.js` to handle click events and ARIA attribute toggling.

- [ ] **Step 3: Commit**
```bash
git add lib/essence_ui/primitives/collapsible.ex assets/js/hooks/collapsible.js
git commit -m "feat: implement collapsible primitive"
```

---

### Task 3: Label, Separator, Aspect Ratio

**Files:**
- Create: `lib/essence_ui/primitives/label.ex`
- Create: `lib/essence_ui/primitives/separator.ex`
- Create: `lib/essence_ui/primitives/aspect_ratio.ex`

- [ ] **Step 1: Implement Label**
```elixir
defmodule EssenceUI.Primitives.Label do
  use EssenceUI.Primitives

  attr :for, :string
  attr :rest, :global
  slot :inner_block, required: true
  def label(assigns) do
    ~H"""
    <label for={@for} {@rest}>
      {render_slot(@inner_block)}
    </label>
    """
  end
end
```

- [ ] **Step 2: Implement Separator**
```elixir
defmodule EssenceUI.Primitives.Separator do
  use EssenceUI.Primitives

  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :decorative, :boolean, default: false
  attr :rest, :global
  def separator(assigns) do
    ~H"""
    <div
      role={if @decorative, do: "none", else: "separator"}
      aria-orientation={if @decorative, do: nil, else: @orientation}
      data-orientation={@orientation}
      {@rest}
    />
    """
  end
end
```

- [ ] **Step 3: Implement Aspect Ratio**
```elixir
defmodule EssenceUI.Primitives.AspectRatio do
  use EssenceUI.Primitives

  attr :ratio, :float, default: 1.0
  attr :rest, :global
  slot :inner_block, required: true
  def aspect_ratio(assigns) do
    ~H"""
    <div style={"position: relative; width: 100%; padding-bottom: #{100 / @ratio}%;"} {@rest}>
      <div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
```

- [ ] **Step 4: Commit**
```bash
git add lib/essence_ui/primitives/label.ex lib/essence_ui/primitives/separator.ex lib/essence_ui/primitives/aspect_ratio.ex
git commit -m "feat: implement label, separator, and aspect ratio primitives"
```

