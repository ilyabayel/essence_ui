---
title: Composition
description: Compose primitive behavior with your own markup.
---

Essence UI Primitives compose through concrete HEEx parts rather than cloning props onto alternate child elements. This approach fits LiveView and keeps markup explicit.

## What Essence does instead

Primitive parts render a concrete element (`button`, `div`, …). You compose by:

1. **Wrapping parts** in your own function components (most common)
2. **Passing attributes** (`class`, `aria-*`, `phx-*`) through `rest` / explicit attrs
3. Using **`Slot`** when you need a polymorphic tag helper
4. Using a Themes `as` prop where that component offers one (`Button`, `Text`, `Flex`)

Essence does not merge props onto a child element. Nest the link or button inside the component, or pick the rendered tag with `as`.

## Wrapping a part

Encode your design-system button once, then use it as the dialog trigger content (or wrap `Dialog.trigger` in a styled function component):

```heex
<Dialog.trigger id="edit-trigger" class="DemoButton violet">
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

[`Slot`](/primitives/docs/utilities/slot) renders a chosen HTML tag with merged attributes. Use it for polymorphic leaves—not as a drop-in for `asChild` on compound triggers.

```heex
<Slot.slot as="a" href="/docs" class="link">
  Docs
</Slot.slot>
```

If you change the underlying element of a trigger-like control, you are responsible for keeping it focusable and operable with pointer and keyboard.

## Themes elements

Themes components render their own element. Card is a `div`. Section is a `section`. Flex, Box, Button, and Text expose `as` when the tag can change. Nest a link or button inside when the surface should be interactive.
