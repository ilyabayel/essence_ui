---
title: Popover
description: Displays rich content in a portal, triggered by a button.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal
---

Displays rich content in a portal, triggered by a button.

<.demo theme="light" variant="primitive" component="popover" css={primitive_css("popover")}>

  <:heex>
    <Popover.root id="popover-primitive">
              <Popover.trigger
                id="popover-trigger"
                content_id="popover-content"
                class="IconButton"
                aria-label="Update dimensions"
              >
                <svg
                  width="15"
                  height="15"
                  viewBox="0 0 15 15"
                  fill="none"
                  aria-hidden="true"
                >
                  <path
                    d="M5.5 3v9M9.5 3v9M3 5.5h9M3 9.5h9"
                    stroke="currentColor"
                    stroke-width="1.5"
                    stroke-linecap="round"
                  />
                </svg>
              </Popover.trigger>
              <Popover.content
                id="popover-content"
                class="PopoverContent"
                side_offset={5}
              >
                <div style="display: flex; flex-direction: column; gap: 10px;">
                  <p
                    class="Text"
                    style="margin-bottom: 10px;"
                  >
                    Dimensions
                  </p>
                  <fieldset class="Fieldset">
                    <label
                      class="Label"
                      for="popover-width"
                    >
                      Width
                    </label>
                    <input
                      class="Input"
                      id="popover-width"
                      value="100%"
                    />
                  </fieldset>
                  <fieldset class="Fieldset">
                    <label
                      class="Label"
                      for="popover-maxWidth"
                    >
                      Max. width
                    </label>
                    <input
                      class="Input"
                      id="popover-maxWidth"
                      value="300px"
                    />
                  </fieldset>
                  <fieldset class="Fieldset">
                    <label
                      class="Label"
                      for="popover-height"
                    >
                      Height
                    </label>
                    <input
                      class="Input"
                      id="popover-height"
                      value="25px"
                    />
                  </fieldset>
                  <fieldset class="Fieldset">
                    <label
                      class="Label"
                      for="popover-maxHeight"
                    >
                      Max. height
                    </label>
                    <input
                      class="Input"
                      id="popover-maxHeight"
                      value="none"
                    />
                  </fieldset>
                </div>
                <Popover.close
                  class="PopoverClose"
                  aria-label="Close"
                >
                  ×
                </Popover.close>
                <Popover.arrow class="PopoverArrow" />
              </Popover.content>
            </Popover.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Customize side, alignment, offsets, collision handling.</:item>
  <:item>Optionally render a pointing arrow.</:item>
  <:item>Focus is fully managed and customizable.</:item>
  <:item>Supports modal and non-modal modes.</:item>
  <:item>Dismissing and layering behavior is highly customizable.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Popover.root id="…">
  <Popover.trigger content_id="…" />
  <Popover.anchor />
  <Popover.portal id="…">
    <Popover.content id="…">
      <Popover.close />
      <Popover.arrow />
    </Popover.content>
  </Popover.portal>
</Popover.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a popover.</:part>
  <:part name="Trigger">The button that toggles the popover. Set `content_id` to the content element's `id`. By default, content positions against the trigger.</:part>
  <:part name="Anchor">An optional element to position content against instead of the trigger.</:part>
  <:part name="Portal">When used, portals the content part into the target (default `body`).</:part>
  <:part name="Content">The component that pops out when the popover is open.</:part>
  <:part name="Arrow">An optional arrow rendered inside `Popover.content`.</:part>
  <:part name="Close">The button that closes an open popover.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a popover.

Use `open` with `on_open_change` for controlled open state in LiveView:

```heex
<Popover.root id="dims-popover" open={@open} on_open_change="popover_open_change">
  …
</Popover.root>
```

```elixir
def handle_event("popover_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open)}
end
```

<.props_table module={EssenceUI.Primitives.Popover} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the popover is open.</:row>
  <:row name="[data-modal]" values="Present when modal">Present when `modal` is true.</:row>
</.data_attributes_table>

### Trigger

The button that toggles the popover. By default, `Popover.content` positions itself against the trigger.

<.props_table module={EssenceUI.Primitives.Popover} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the popover is open.</:row>
</.data_attributes_table>

### Anchor

An optional element to position `Popover.content` against. If omitted, content positions alongside `Popover.trigger`.

<.props_table module={EssenceUI.Primitives.Popover} function={:anchor} />

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.Popover} function={:portal} />

### Content

The component that pops out when the popover is open.

<.props_table module={EssenceUI.Primitives.Popover} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the popover is open.</:row>
  <:row name="[data-side]" values={"top | right | bottom | left"}>Preferred side relative to the anchor.</:row>
  <:row name="[data-align]" values={"start | center | end"}>Alignment along the side.</:row>
</.data_attributes_table>

### Arrow

An optional arrow element to render alongside the popover. Must be rendered inside `Popover.content`.

<.props_table module={EssenceUI.Primitives.Popover} function={:arrow} />

### Close

The button that closes an open popover.

<.props_table module={EssenceUI.Primitives.Popover} function={:close} />

## Examples

### Constrain the content size

You may want to constrain the width or height of the content so it does not exceed the viewport:

```heex
<Popover.content id="popover-content" class="PopoverContent" side_offset={5}>
  …
</Popover.content>
```

```css
.PopoverContent {
  width: 260px;
  max-width: calc(100vw - 16px);
  max-height: calc(100vh - 16px);
  overflow-y: auto;
}
```

### Origin-aware animations

Animate with CSS against `data-state` — see the [animation](/primitives/docs/guides/animation) guide:

```css
.PopoverContent {
  animation-duration: 0.5s;
  animation-timing-function: ease-out;
}
.PopoverContent[data-state="open"] {
  animation-name: scaleIn;
}

@keyframes scaleIn {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}
```

### Collision-aware animations

`Popover.content` exposes `data-side` and `data-align` for direction-aware animations based on the configured placement:

```heex
<Popover.content id="popover-content" class="PopoverContent" side="bottom" align="center">
  …
</Popover.content>
```

```css
.PopoverContent {
  animation-duration: 0.6s;
  animation-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}
.PopoverContent[data-side="top"] {
  animation-name: slideUp;
}
.PopoverContent[data-side="bottom"] {
  animation-name: slideDown;
}

@keyframes slideDown {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
```

### With custom anchor

Anchor content to another element when the trigger should not be the positioning reference:

```heex
<Popover.root id="anchor-popover">
  <Popover.anchor class="PopoverRow">
    Row as anchor
    <Popover.trigger id="anchor-popover-trigger" content_id="anchor-popover-content" class="Button">
      Trigger
    </Popover.trigger>
  </Popover.anchor>
  <Popover.content id="anchor-popover-content" class="PopoverContent">
    …
  </Popover.content>
</Popover.root>
```

```css
.PopoverRow {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 20px;
  background: var(--mauve-3);
  border-radius: 6px;
}
```

## Accessibility

Adheres to the [Dialog WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Space">Opens/closes the popover.</:row>
  <:row keys="Enter">Opens/closes the popover.</:row>
  <:row keys="Tab">Moves focus to the next focusable element.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element.</:row>
  <:row keys="Escape">Closes the popover and moves focus to `Popover.trigger`.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by abstracting the primitive parts into your own component.

### Abstract the arrow and set default configuration

This example abstracts `Popover.arrow` and sets a default `side_offset`.

#### Usage

```heex
<.popover id="settings-popover">
  <:trigger>Popover trigger</:trigger>
  <:content>Popover content</:content>
</.popover>
```

#### Implementation

```elixir
slot :trigger, required: true
slot :content, required: true
attr :id, :string, required: true

def popover(assigns) do
  ~H"""
  <Popover.root id={@id}>
    <Popover.trigger id={"#{@id}-trigger"} content_id={"#{@id}-content"} class="Button">
      {render_slot(@trigger)}
    </Popover.trigger>
    <Popover.content id={"#{@id}-content"} class="PopoverContent" side_offset={5}>
      {render_slot(@content)}
      <Popover.arrow class="PopoverArrow" />
    </Popover.content>
  </Popover.root>
  """
end
```
