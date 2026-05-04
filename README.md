# EssenceUI

EssenceUI is a set of Phoenix components compatible with Radix UI Themes API.

## Usage

Add to your Phoenix templates or LiveView:

```elixir
import EssenceUI.Components
```

## Components

### Em

Emphasizes text, matching the Radix UI Themes Em API.

#### Example

```elixir
<.em>
  Emphasized text
</.em>

<.em truncate>
  This is a long emphasized text that will be truncated.
</.em>
```

#### Props

- `as_child` - If true, renders the component as its child element.
- `truncate` - If true, truncates text with ellipsis when it overflows.
- `wrap` - Controls text wrapping. One of: `"wrap"`, `"nowrap"`, `"pretty"`, `"balance"`. Responsive supported.
- `class` - Additional CSS classes.
- `style` - Additional inline styles.
- `rest` - Additional HTML attributes.

---

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Implementation plan and TODO

This library aims for API and UX parity with Radix Themes. See the Radix Themes overview for reference: [Getting started with Radix Themes](https://www.radix-ui.com/themes/docs/overview/getting-started).

### ✅ Completed Components (25/52)

#### Layout (5/5) ✅
- [x] `Box`
- [x] `Flex`
- [x] `Grid`
- [x] `Container`
- [x] `Section`

#### Typography (9/9) ✅
- [x] `Text`
- [x] `Heading`
- [x] `Blockquote`
- [x] `Code`
- [x] `Em`
- [x] `Kbd`
- [x] `Link`
- [x] `Quote`
- [x] `Strong`

#### Components (11/38)
- [x] `AlertDialog` ✅
- [x] `AspectRatio` ✅
- [x] `Avatar` ✅
- [x] `Badge` ✅
- [x] `Button` ✅
- [x] `Callout` ✅
- [x] `Card` ✅
- [x] `Checkbox` ✅
- [x] `CheckboxCards` ✅
- [x] `Dialog` ✅
- [x] `IconButton` ✅
- [x] `Progress` ✅
- [x] `Radio` ✅
- [x] `RadioGroup` ✅
- [x] `SegmentedControl` ✅
- [x] `Select` ✅
- [x] `Separator` ✅
- [x] `Skeleton` ✅
- [x] `Slider` ✅
- [x] `Spinner` ✅
- [x] `Switch` ✅
- [x] `Table` ✅
- [x] `Tabs` ✅
- [x] `TextArea` ✅
- [x] `TextField` ✅
- [x] `Tooltip` ✅
- [x] `CheckboxGroup` ✅
- [x] `RadioCards` ✅

### 🚧 Remaining Components (26/52)

#### Overlay & Menu Components (4)
- [ ] `ContextMenu` - Right-click context menu
- [ ] `DropdownMenu` - Dropdown menu with items
- [ ] `HoverCard` - Popover that opens on hover
- [ ] `Popover` - Floating content container

#### Navigation Components (1)
- [ ] `TabNav` - Tab navigation (different from Tabs)

#### Data Display Components (2)
- [ ] `DataList` - Key-value pair list
- [ ] `ScrollArea` - Custom scrollable area

#### Utility Components (5)
- [ ] `AccessibleIcon` - Accessible icon wrapper
- [ ] `Inset` - Negative margin utility
- [ ] `Portal` - Render content in different DOM location
- [ ] `Reset` - CSS reset component
- [ ] `Slot` - Slot composition primitive
- [ ] `VisuallyHidden` - Visually hidden but screen-reader accessible

#### Theme Component (1)
- [ ] `Theme` - Root theme configuration component

### Phase 1: Complete Form Components

- [ ] `CheckboxGroup` - Verify and complete if needed
- [ ] `CheckboxCards` - Card-style checkbox group
- [ ] `RadioCards` - Card-style radio group
- [ ] Add stories for all form components
- [ ] Add a11y coverage tests

### Phase 2: Overlay & Menu Components

- [ ] `Popover` with positioning
- [ ] `HoverCard` with hover trigger
- [ ] `DropdownMenu` with nested items
- [ ] `ContextMenu` with right-click trigger
- [ ] Implement overlay primitives (portal, focus trap, dismiss)
- [ ] Add keyboard navigation coverage

### Phase 3: Navigation & Data Display

- [ ] `TabNav` component
- [ ] `DataList` component
- [ ] `ScrollArea` with custom scrollbars
- [ ] Add dense data display examples

### Phase 4: Utility Components

- [ ] `AccessibleIcon` wrapper
- [ ] `Inset` utility
- [ ] `Portal` primitive
- [ ] `Slot` composition
- [ ] `VisuallyHidden` utility
- [ ] `Reset` component

### Phase 5: Theme & Polish

- [ ] `Theme` root component (appearance, accent, gray, radius, scaling)
- [ ] `ThemePanel` dev-only component
- [ ] Normalize props across all components using `shared_props`
- [ ] Dark mode documentation and examples
- [ ] Add prop tables in storybook
- [ ] Establish a11y checks in CI

### Docs and examples

- [ ] Storybook category parity with Radix Themes
- [ ] Usage patterns guide (controlled vs uncontrolled, `as_child`, composition)
- [ ] Migration guide from plain HTML to components

### Nice-to-have later

- [ ] Composables for state machines
- [ ] Visual regression tests

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
