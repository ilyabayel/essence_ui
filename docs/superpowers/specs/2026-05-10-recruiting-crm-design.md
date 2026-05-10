# Recruiting CRM Example Design Specification

## Overview
A comprehensive Storybook example showcasing the EssenceUI component library through a feature-rich Recruiting CRM interface. This example demonstrates complex layouts, form handling, and interactive components working together in a realistic application context.

## Target Audience & Focus
- **Primary User:** Recruiter
- **Primary Workflow:** Managing candidate pipelines and rapidly reviewing candidate profiles.
- **Main View:** Kanban Board

## Architecture & Layout
The example will use a full-viewport layout (`min-height: 100vh`) to simulate a real web application.

### 1. Global Layout
- **Container:** `box` and `flex` elements to structure the main application shell.
- **Left Sidebar:** A slim vertical navigation bar containing:
  - `icon_button`s for primary routes (Dashboard, Pipeline, Analytics).
  - An `avatar` at the bottom for the active user's profile.
- **Main Content Area:** A large area to the right containing the header and the Kanban board.

### 2. Top Header
- A horizontal `flex` container.
- **Title:** "Pipeline: Software Engineering" (`heading`).
- **Controls:**
  - Search input (`text_field`).
  - View switcher (`dropdown_menu`).
  - Primary action: "Add Candidate" (`button`).

### 3. Kanban Board (Main View)
- A horizontally scrolling area (`scroll_area`).
- **Columns:** Representing stages (e.g., Sourced, Screening, Interview, Offer).
  - Each column has a header with a stage title (`heading`) and candidate count (`badge`).
- **Candidate Cards:** Using the `card` component.
  - Contains candidate `avatar`, name (`strong`), role applied for (`text`).
  - Tags for skills or status (`badge`).
  - Quick summary on hover (`hover_card`).
  - Actions menu (`context_menu`).

### 4. Interactive Candidate Modal
- Triggered by clicking a candidate card. Uses the `dialog` component.
- Content is organized using `tabs`:
  - **Overview Tab:** Basic information using `grid`, `text_field`, and `select` components.
  - **Evaluation Tab:** A structured scoring form utilizing `slider`s for skill ratings, `radio_group` for final recommendation, and `checkbox_group` for verified criteria.
  - **Notes Tab:** A `text_area` for interview feedback.
  - **Settings Tab:** Notification toggles using the `switch` component.

## Component Checklist
The following EssenceUI components are guaranteed to be featured:
- **Layout:** `box`, `flex`, `grid`, `scroll_area`
- **Typography:** `heading`, `text`, `strong`
- **Data Display:** `card`, `avatar`, `badge`
- **Forms:** `text_field`, `text_area`, `select`, `checkbox_group`, `radio_group`, `switch`, `slider`, `button`, `icon_button`
- **Overlays/Navigation:** `dialog`, `tabs`, `dropdown_menu`, `context_menu`, `hover_card`

## Implementation Strategy
1. The example will be implemented in `storybook/examples/recruiting_crm.story.exs`.
2. It will follow the existing pattern used in `dashboard.story.exs`, utilizing a single LiveView/Component render function with mock data.
3. No new components will be created; this strictly consumes existing `lib/essence_ui/components/` components.
4. CSS/styling will primarily rely on inline styles or utility classes as per the EssenceUI standard, avoiding custom stylesheets unless necessary for the Kanban drag-and-drop simulation (which will be visual only, no actual JS drag-and-drop library required for the static example).