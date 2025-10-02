# CheckboxCards Component

The `CheckboxCards` component provides a card-based layout for checkbox selections, matching the Radix UI Themes CheckboxCards API.

## Basic Usage

```elixir
<.checkbox_cards_root default_value={["1"]} columns="3">
  <.checkbox_cards_item value="1">
    <.flex direction="column" width="100%">
      <.text weight="bold">A1 Keyboard</.text>
      <.text>US Layout</.text>
    </.flex>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="2">
    <.flex direction="column" width="100%">
      <.text weight="bold">Pro Mouse</.text>
      <.text>Zero-lag wireless</.text>
    </.flex>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="3">
    <.flex direction="column" width="100%">
      <.text weight="bold">Lightning Mat</.text>
      <.text>Wireless charging</.text>
    </.flex>
  </.checkbox_cards_item>
</.checkbox_cards_root>
```

## Component Structure

The CheckboxCards component consists of two parts:

### 1. Root Container (`checkbox_cards_root`)

The root container that wraps all checkbox card items. It's rendered as a grid layout.

**Props:**
- `size` - Cards size: "1", "2", "3" (default: "2")
- `variant` - Visual variant: "surface", "classic" (default: "surface")
- `color` - Color theme from accent color palette
- `high_contrast` - Increase color contrast
- `columns` - Number of columns: "1"-"9" or CSS value (responsive supported)
- `gap` - Gap between cards (responsive supported)
- `default_value` - Initial checked values as list of strings
- Margin props: `m`, `mx`, `my`, `mt`, `mr`, `mb`, `ml`

### 2. Card Items (`checkbox_cards_item`)

Individual checkbox card items that go inside the root container.

**Props:**
- `value` - Value for this checkbox item (required)
- `disabled` - Whether this item is disabled
- `class` - Additional CSS classes
- `style` - Additional inline styles

## Examples

### With Responsive Columns

```elixir
<.checkbox_cards_root default_value={["1"]} columns=%{initial: "1", sm: "3"}>
  <.checkbox_cards_item value="1">
    <.text>Option 1</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="2">
    <.text>Option 2</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="3">
    <.text>Option 3</.text>
  </.checkbox_cards_item>
</.checkbox_cards_root>
```

### Single Column Layout

```elixir
<.checkbox_cards_root default_value={["1", "3"]} columns="1">
  <.checkbox_cards_item value="1">
    <.flex direction="column" width="100%">
      <.text weight="bold">Email notifications</.text>
      <.text size="1" color="gray">Receive updates via email</.text>
    </.flex>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="2">
    <.flex direction="column" width="100%">
      <.text weight="bold">SMS notifications</.text>
      <.text size="1" color="gray">Receive updates via SMS</.text>
    </.flex>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="3">
    <.flex direction="column" width="100%">
      <.text weight="bold">Push notifications</.text>
      <.text size="1" color="gray">Receive updates via push</.text>
    </.flex>
  </.checkbox_cards_item>
</.checkbox_cards_root>
```

### Different Sizes

```elixir
<!-- Size 1 - Compact -->
<.checkbox_cards_root size="1" columns="3">
  <.checkbox_cards_item value="1">
    <.text>Small</.text>
  </.checkbox_cards_item>
  ...
</.checkbox_cards_root>

<!-- Size 2 - Default -->
<.checkbox_cards_root size="2" columns="3">
  <.checkbox_cards_item value="1">
    <.text>Medium</.text>
  </.checkbox_cards_item>
  ...
</.checkbox_cards_root>

<!-- Size 3 - Large -->
<.checkbox_cards_root size="3" columns="3">
  <.checkbox_cards_item value="1">
    <.text>Large</.text>
  </.checkbox_cards_item>
  ...
</.checkbox_cards_root>
```

### Variants

```elixir
<!-- Surface variant (default) -->
<.checkbox_cards_root variant="surface" columns="3">
  ...
</.checkbox_cards_root>

<!-- Classic variant -->
<.checkbox_cards_root variant="classic" columns="3">
  ...
</.checkbox_cards_root>
```

### With Custom Color

```elixir
<.checkbox_cards_root color="blue" columns="3" default_value={["2"]}>
  <.checkbox_cards_item value="1">
    <.text>Option 1</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="2">
    <.text>Option 2</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="3">
    <.text>Option 3</.text>
  </.checkbox_cards_item>
</.checkbox_cards_root>
```

### With Disabled Item

```elixir
<.checkbox_cards_root columns="3" default_value={["1"]}>
  <.checkbox_cards_item value="1">
    <.text>Enabled</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="2" disabled>
    <.text color="gray">Disabled</.text>
  </.checkbox_cards_item>
  <.checkbox_cards_item value="3">
    <.text>Enabled</.text>
  </.checkbox_cards_item>
</.checkbox_cards_root>
```

## Generated HTML

The component generates HTML similar to Radix UI Themes:

```html
<div role="group" dir="ltr" class="rt-Grid rt-CheckboxCardsRoot rt-r-size-2 rt-variant-surface rt-r-gtc-3" tabindex="0" id="checkbox-cards-123" phx-hook="CheckboxCards">
  <label class="rt-BaseCard rt-CheckboxCardsItem">
    <div class="rt-Flex rt-r-fd-column rt-r-w" style="--width:100%">
      <span class="rt-Text rt-r-weight-bold">A1 Keyboard</span>
      <span class="rt-Text">US Layout</span>
    </div>
    <button type="button" role="checkbox" aria-checked="true" data-state="checked" value="1" class="rt-reset rt-BaseCheckboxRoot rt-CheckboxCardCheckbox rt-r-size-2 rt-variant-surface" tabindex="-1">
      <svg width="9" height="9" viewBox="0 0 9 9" fill="currentcolor" xmlns="http://www.w3.org/2000/svg" data-state="checked" class="rt-BaseCheckboxIndicator" style="pointer-events: none;">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"></path>
      </svg>
    </button>
  </label>
  ...
</div>
```

## Client-Side Interactions

The component uses a Phoenix LiveView hook (`CheckboxCards`) to handle client-side toggle interactions, ensuring smooth UX without server round-trips for checkbox state changes.

The hook is automatically integrated when you add the component to your application.

## Accessibility

- Uses proper ARIA roles and attributes (`role="group"`, `role="checkbox"`, `aria-checked`)
- Keyboard accessible with proper focus management
- Disabled states are properly indicated
- Supports screen readers with semantic HTML

## Notes

- The component requires the CSS from `assets/css/components/checkbox-cards.css` which is already included
- The JavaScript hook is in `assets/js/hooks/checkbox_cards.js` and registered in `storybook.js`
- Checkbox state is managed client-side for immediate feedback
- Default checked values are set via the `default_value` prop on the root component
