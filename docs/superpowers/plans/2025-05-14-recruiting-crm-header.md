# Recruiting CRM Header Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement the top header and controls for the Recruiting CRM example in Storybook.

**Architecture:** Replace the placeholder `div` with a functional header using `EssenceUI` components like `flex`, `heading`, `badge`, `text_field`, `dropdown_menu`, and `button`.

**Tech Stack:** Elixir, Phoenix Components, EssenceUI.

---

### Task 1: Implement Header and Controls

**Files:**
- Modify: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Replace the header placeholder**

```elixir
        <%!-- Top Header --%>
        <.flex align="center" justify="between" px="6" py="4" style="border-bottom: 1px solid var(--gray-4); background-color: var(--gray-1);">
          <.flex align="center" gap="4">
            <.heading size="5" weight="bold">Pipeline: Software Engineering</.heading>
            <.badge variant="surface" color="gray">12 Candidates</.badge>
          </.flex>
          
          <.flex align="center" gap="3">
            <.text_field placeholder="Search candidates..." size="2" style="width: 250px;">
              <:slot_left>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
              </:slot_left>
            </.text_field>
            
            <.dropdown_menu>
              <:trigger>
                <.button variant="soft" color="gray">
                  All Stages
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg>
                </.button>
              </:trigger>
              <.dropdown_menu_item>Sourced</.dropdown_menu_item>
              <.dropdown_menu_item>Screening</.dropdown_menu_item>
              <.dropdown_menu_item>Interview</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item color="red">Reset Filters</.dropdown_menu_item>
            </.dropdown_menu>
            
            <.button variant="solid">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              Add Candidate
            </.button>
          </.flex>
        </.flex>
```

- [ ] **Step 2: Verify compilation**

Run: `mix compile`
Expected: Success

- [ ] **Step 3: Commit changes**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: add header and controls to recruiting crm example"
```
