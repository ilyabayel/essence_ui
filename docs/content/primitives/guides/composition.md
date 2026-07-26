---
title: Composition
description: Compose primitive behavior with your own markup and Themes as_child—without Radix asChild cloning.
---

Radix React uses an `asChild` prop to clone props onto an alternate child element. Essence UI Primitives take a different approach that fits HEEx and LiveView.

## What Essence does instead

Primitive parts render a concrete element (`button`, `div`, …). You compose by:

1. **Wrapping parts** in your own function components (most common)
2. **Passing attributes** (`class`, `aria-*`, `phx-*`) through `rest` / explicit attrs
3. Using **`Slot`** when you need a polymorphic tag helper
4. Using Themes **`as_child`** on Themes components (not on Primitives parts)

Do not expect a Radix-style `asChild` on primitive parts—it is not implemented.

## Wrapping a part

Encode your design-system button once, then use it as the dialog trigger content (or wrap `Dialog.trigger` in a styled function component):

```heex
<Dialog.trigger id="edit-trigger" class="Button violet">
  Edit profile
</Dialog.trigger>
```

Or wrap the primitive:

```elixir
def my_dialog_trigger(assigns) do
  ~H"""
  <Dialog.trigger id={@id} class={["Button", @class]} {@rest}>
    {render_slot(@inner_block)}
  </Dialog.trigger>
  """
end
```

## Changing the element type with Slot

[`Slot`](/primitives/docs/utilities/slot) renders a chosen HTML tag with merged attributes. Use it for polymorphic leaves—not as a drop-in for Radix `asChild` on compound triggers.

```heex
<Slot.slot as="a" href="/docs" class="link">
  Docs
</Slot.slot>
```

If you change the underlying element of a trigger-like control, you are responsible for keeping it focusable and operable with pointer and keyboard.

## Themes `as_child`

Themes components (for example Button, Card) support `as_child` to merge Themes styles onto a child element. That API lives in Themes, not Primitives. Prefer Themes when you want that composition model with styled defaults.
