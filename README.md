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

### Implemented components

#### Layout

- [x] `Box`
- [x] `Flex`
- [x] `Grid`
- [x] `Container`
- [x] `Section`

#### Typography

- [x] `Text`
- [x] `Heading`
- [x] `Blockquote`
- [x] `Code`
- [x] `Em`
- [x] `Kbd`
- [x] `Link`
- [x] `Quote`
- [x] `Strong`

#### Components

- [x] `AspectRatio`
- [x] `Avatar`
- [x] `Badge`
- [x] `Button`
- [x] `Callout`
- [x] `Card`
- [x] `Checkbox`
- [x] `CheckboxGroup`
- [x] `TextField`
- [x] `TextArea`


### Phase 1: Foundations and consistency

- [ ] `EssenceUI.Theme` root component (appearance, accent, gray, radius, scaling)
- [ ] Normalize props across existing components using `shared_props` modules
- [ ] Tests: `checkbox`, `checkbox_group`, `extract_props` edge cases

### Phase 2: Form inputs and selections

- [ ] `Select` (assets/css/components/select.css)
- [ ] `SegmentedControl` (assets/css/components/segmented-control.css)
- [ ] `Switch` (assets/css/components/switch.css)
- [ ] `Slider` (assets/css/components/slider.css)
- [ ] `Radio`, `RadioGroup`, `RadioCards` (assets/css/components/radio*.css)
- [ ] `Progress` (assets/css/components/progress.css)
- [ ] Stories + a11y coverage for the above

### Phase 3: Overlays and menus

- [ ] `Dialog` (assets/css/components/dialog.css)
- [ ] `AlertDialog` (assets/css/components/alert-dialog.css)
- [ ] `Popover` (assets/css/components/popover.css)
- [ ] `HoverCard` (assets/css/components/hover-card.css)
- [ ] `Tooltip` (assets/css/components/tooltip.css)
- [ ] `DropdownMenu` (assets/css/components/dropdown-menu.css)
- [ ] `ContextMenu` (assets/css/components/context-menu.css)
- [ ] Overlay primitives (portal mount, focus trap, dismiss logic, ARIA)
- [ ] Stories + keyboard navigation coverage

### Phase 4: Navigation and data display

- [ ] `Tabs` (assets/css/components/tabs.css) with panels
- [ ] `TabNav` (assets/css/components/tab-nav.css)
- [ ] `Table` (assets/css/components/table.css)
- [ ] `DataList` (assets/css/components/data-list.css)
- [ ] `ScrollArea` (assets/css/components/scroll-area.css)
- [ ] `Separator` (assets/css/components/separator.css)
- [ ] `Skeleton` (assets/css/components/skeleton.css)
- [ ] `Spinner` (assets/css/components/spinner.css)
- [ ] `IconButton` (assets/css/components/icon-button.css)
- [ ] `Inset` (assets/css/components/inset.css)
- [ ] Stories with dense examples

### Phase 5: Theming, polish, and DX

- [ ] `ThemePanel` (assets/css/components/theme-panel.css), dev-only toggle in Storybook
- [ ] Dark mode/appearance docs and examples
- [ ] Add prop tables in stories; unify variants/sizes across components
- [ ] Establish a11y checks in CI (roles/labels snapshot tests)

### Docs and examples

- [ ] Storybook category parity with Radix Themes sections (Layout, Typography, Components, Utilities)
- [ ] Usage patterns guide (controlled vs uncontrolled, `as_child`, composition patterns)
- [ ] Migration notes from plain HTML classes to components

### Nice-to-have later

- [ ] Composables for state machines used by menus/overlays
- [ ] Visual regression tests for core components

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
