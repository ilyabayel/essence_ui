# Recruiting CRM Example Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a feature-rich Recruiting CRM Storybook example to showcase EssenceUI components in a realistic application context.

**Architecture:** A single Storybook example file (`.story.exs`) containing a complex functional prototype with a sidebar, header, Kanban board, and interactive dialog modal.

**Tech Stack:** Elixir, Phoenix, PhoenixStorybook, EssenceUI.

---

### Task 1: Scaffolding and Application Shell

**Files:**
- Create: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Create the story file with basic shell and mock data**

```elixir
defmodule Storybook.Examples.RecruitingCRMStory do
  @moduledoc false
  use PhoenixStorybook.Story, :example
  use Phoenix.Component

  import EssenceUI.Components, except: [quote: 1]

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      data-gray-color="slate"
      data-accent-color="blue"
      class="essence-ui"
      style="display: flex; height: 100vh; width: 100vw; overflow: hidden; background-color: var(--gray-1);"
    >
      <%!-- Left Sidebar --%>
      <.flex
        direction="column"
        align="center"
        justify="between"
        p="4"
        style="width: 64px; border-right: 1px solid var(--gray-4); background-color: var(--gray-2);"
      >
        <.flex direction="column" gap="4" align="center">
          <.icon_button variant="ghost" size="3" color="gray">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="9" y1="3" x2="9" y2="21"></line></svg>
          </.icon_button>
          <.icon_button variant="soft" size="3">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg>
          </.icon_button>
          <.icon_button variant="ghost" size="3" color="gray">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
          </.icon_button>
        </.flex>
        
        <.avatar src="https://images.unsplash.com/photo-1502602724662-781c8963e6cc?auto=format&fit=crop&w=128&q=80" fallback="JD" size="2" />
      </.flex>

      <%!-- Main Content Area --%>
      <.flex direction="column" style="flex: 1; overflow: hidden;">
        <%!-- Content will be added in subsequent tasks --%>
        <div id="main-header"></div>
        <div id="kanban-board" style="flex: 1; overflow: auto;"></div>
      </.flex>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
```

- [ ] **Step 2: Commit scaffolding**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: scaffold recruiting cm story example"
```

---

### Task 2: Implement Top Header and Controls

**Files:**
- Modify: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Add the Header section with Title, Search, and Action buttons**

```elixir
<%!-- Update render/1 inside the Main Content Area flex --%>
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

- [ ] **Step 2: Commit Header**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: add header and controls to recruiting crm example"
```

---

### Task 3: Implement Kanban Board and Columns

**Files:**
- Modify: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Add the Kanban Board with columns**

```elixir
<%!-- Update render/1 inside the kanban-board div --%>
        <.scroll_area style="flex: 1; padding: 24px;">
          <.flex gap="6" style="min-height: 100%;">
            <%= for {stage, count} <- [{"Sourced", 4}, {"Screening", 3}, {"Interview", 3}, {"Offer", 2}] do %>
              <.flex direction="column" gap="4" style="width: 280px; flex-shrink: 0;">
                <.flex align="center" justify="between">
                  <.flex align="center" gap="2">
                    <.heading size="3" weight="bold"><%= stage %></.heading>
                    <.badge variant="soft" color="gray" size="1"><%= count %></.badge>
                  </.flex>
                  <.icon_button variant="ghost" size="1" color="gray">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                  </.icon_button>
                </.flex>
                
                <%!-- Card list area --%>
                <.flex direction="column" gap="3" style="flex: 1; min-height: 200px; background-color: var(--gray-3); padding: 8px; border-radius: var(--radius-4);">
                  <%!-- Cards will be added in the next task --%>
                </.flex>
              </.flex>
            <% end %>
          </.flex>
        </.scroll_area>
```

- [ ] **Step 2: Commit Kanban Board**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: add kanban board columns to recruiting crm example"
```

---

### Task 4: Implement Candidate Cards

**Files:**
- Modify: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Define a private `candidate_card` component and use it in the board**

```elixir
  <%!-- Add this inside RecruitingCRMStory module after render/1 --%>
  defp candidate_card(assigns) do
    ~H"""
    <.context_menu>
      <:trigger>
        <.card p="3" style="cursor: pointer; transition: transform 0.1s;" class="hover-lift">
          <.flex direction="column" gap="3">
            <.flex justify="between" align="start">
              <.flex gap="3" align="center">
                <.avatar size="1" src={@src} fallback={@fallback} />
                <.flex direction="column">
                  <.strong size="2"><%= @name %></.strong>
                  <.text size="1" color="gray"><%= @role %></.text>
                </.flex>
              </.flex>
              <.hover_card>
                <:trigger>
                  <.icon_button variant="ghost" size="1" color="gray">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                  </.icon_button>
                </:trigger>
                <.flex direction="column" gap="2" p="3">
                  <.strong size="2">Last Activity</.strong>
                  <.text size="1">Updated status to Screening 2 days ago.</.text>
                </.flex>
              </.hover_card>
            </.flex>
            
            <.flex gap="2" wrap="wrap">
              <%= for tag <- @tags do %>
                <.badge variant="surface" size="1" color="blue"><%= tag %></.badge>
              <% end %>
            </.flex>
          </.flex>
        </.card>
      </:trigger>
      <.context_menu_item>View Profile</.context_menu_item>
      <.context_menu_item>Move Stage</.context_menu_item>
      <.context_menu_separator />
      <.context_menu_item color="red">Archive</.context_menu_item>
    </.context_menu>
    """
  end

  <%!-- Then update the "Card list area" in Task 3 to call candidate_card --%>
  <%!-- Example for 'Sourced' column: --%>
  <.candidate_card name="Alice Johnson" role="Fullstack Engineer" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=64&q=80" fallback="AJ" tags={["React", "Elixir"]} />
  <.candidate_card name="Bob Smith" role="Backend Lead" src={nil} fallback="BS" tags={["Go", "Kubernetes"]} />
```

- [ ] **Step 2: Commit Candidate Cards**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: add candidate cards to recruiting crm example"
```

---

### Task 5: Implement Candidate Detail Dialog Modal

**Files:**
- Modify: `storybook/examples/recruiting_crm.story.exs`

- [ ] **Step 1: Add a Dialog component that showcases forms and tabs**

```elixir
<%!-- Add this to the bottom of the main render/1 div --%>
        <.dialog id="candidate-detail" target="body" default_state="closed">
          <.flex direction="column" gap="4" p="6" style="max-width: 600px;">
            <.flex justify="between" align="center">
              <.flex gap="4" align="center">
                <.avatar size="4" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=128&q=80" fallback="AJ" />
                <.flex direction="column">
                  <.heading size="6">Alice Johnson</.heading>
                  <.text color="gray">Senior Fullstack Engineer</.text>
                </.flex>
              </.flex>
              <.badge size="3" variant="soft">Sourced</.badge>
            </.flex>
            
            <.tabs default_value="overview">
              <:list>
                <.tabs_trigger value="overview">Overview</.tabs_trigger>
                <.tabs_trigger value="evaluation">Evaluation</.tabs_trigger>
                <.tabs_trigger value="notes">Notes</.tabs_trigger>
                <.tabs_trigger value="settings">Settings</.tabs_trigger>
              </:list>
              
              <.tabs_content value="overview">
                <.flex direction="column" gap="4" mt="4">
                  <.grid columns="2" gap="4">
                    <.flex direction="column" gap="1">
                      <.text size="2" weight="bold">Email</.text>
                      <.text_field value="alice.j@example.com" />
                    </.flex>
                    <.flex direction="column" gap="1">
                      <.text size="2" weight="bold">Phone</.text>
                      <.text_field value="+1 (555) 000-0000" />
                    </.flex>
                  </.grid>
                  <.flex direction="column" gap="1">
                    <.text size="2" weight="bold">Source</.text>
                    <.select options={[{"LinkedIn", "linkedin"}, {"Referral", "referral"}]} value="linkedin" />
                  </.flex>
                </.flex>
              </.tabs_content>
              
              <.tabs_content value="evaluation">
                <.flex direction="column" gap="5" mt="4">
                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Technical Skill Score</.text>
                    <.slider default_value={[80]} />
                  </.flex>
                  
                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Recommendation</.text>
                    <.radio_group name="recommendation" default_value="hire">
                      <.flex gap="4">
                        <.radio value="hire" label="Strong Hire" />
                        <.radio value="hold" label="Hold" />
                        <.radio value="no" label="No Hire" />
                      </.flex>
                    </.radio_group>
                  </.flex>
                  
                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Verified Skills</.text>
                    <.checkbox_group name="skills" default_value={["elixir", "react"]}>
                      <.flex gap="4">
                        <.checkbox value="elixir" label="Elixir" />
                        <.checkbox value="react" label="React" />
                        <.checkbox value="db" label="PostgreSQL" />
                      </.flex>
                    </.checkbox_group>
                  </.flex>
                </.flex>
              </.tabs_content>
              
              <.tabs_content value="notes">
                <.flex direction="column" gap="3" mt="4">
                  <.text_area placeholder="Add private feedback notes..." style="height: 150px;" />
                  <.button variant="solid">Save Note</.button>
                </.flex>
              </.tabs_content>
              
              <.tabs_content value="settings">
                <.flex direction="column" gap="4" mt="4">
                  <.flex justify="between" align="center">
                    <.flex direction="column">
                      <.strong size="2">Email Notifications</.strong>
                      <.text size="1" color="gray">Receive updates on candidate progress</.text>
                    </.flex>
                    <.switch default_checked />
                  </.flex>
                  <.separator size="4" />
                  <.button variant="soft" color="red" style="width: 100%;">Archive Candidate</.button>
                </.flex>
              </.tabs_content>
            </.tabs>
          </.flex>
        </.dialog>
```

- [ ] **Step 2: Commit Modal**

```bash
git add storybook/examples/recruiting_crm.story.exs
git commit -m "feat: add detailed candidate modal to recruiting crm example"
```

---

### Task 6: Final Verification

- [ ] **Step 1: Check Elixir compilation**

Run: `mix compile`
Expected: Successfully compiled.

- [ ] **Step 2: Verify in Storybook**

(Manual check by user: Open Storybook and navigate to Examples > Recruiting CRM)

- [ ] **Step 3: Final Commit and Cleanup**

```bash
git status
```
