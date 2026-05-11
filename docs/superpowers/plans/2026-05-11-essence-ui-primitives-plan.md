# Implementation Plan: EssenceUI Primitives

## 🏗️ Phase 1: Foundation & Proof of Concept
- [ ] Create `lib/essence_ui/primitives.ex` (Shared helpers)
- [ ] Setup Playwright test infrastructure
- [ ] **Accordion**
  - [ ] Implement `EssenceUI.Primitives.Accordion` (Root, Item, Header, Trigger, Content)
  - [ ] Refactor `assets/js/hooks/accordion.js` into a generic primitive hook
  - [ ] Add Playwright tests for Accordion
  - [ ] Migrate `EssenceUI.Components.Accordion` to use the primitive

## 🏗️ Phase 2: Overlays (Layering & Focus)
- [ ] **Dialog**
  - [ ] Primitive implementation
  - [ ] Hook refactor (Focus trap, scroll lock)
  - [ ] Playwright tests
  - [ ] Component migration
- [ ] **Popover**
- [ ] **Tooltip**
- [ ] **Hover Card**

## 🏗️ Phase 3: Selection & Forms
- [ ] **Checkbox & Checkbox Group**
- [ ] **Radio Group**
- [ ] **Switch**
- [ ] **Select**
- [ ] **Slider**

## 🏗️ Phase 4: Navigation & Menus
- [ ] **Tabs**
- [ ] **Dropdown Menu**
- [ ] **Context Menu**
- [ ] **Segmented Control**

## 🏗️ Phase 5: Utilities & Polish
- [ ] **Scroll Area**
- [ ] **Aspect Ratio**
- [ ] **Progress & Spinner**
- [ ] **Skeleton**

## ✅ Completed
*None yet.*
