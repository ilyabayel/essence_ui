---
title: Popover
description: Displays rich content in a portal, triggered by a button.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal
---

Displays rich content in a portal, triggered by a button.

<.demo variant="primitive" component="popover" css={primitive_css("popover")}>

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

```heex
<Popover.root>
  <Popover.trigger />
  <Popover.anchor />
  <Popover.portal />
  <Popover.content />
  <Popover.arrow />
  <Popover.close />
</Popover.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Anchor">The `anchor` part.</:part>
  <:part name="Portal">The `portal` part.</:part>
  <:part name="Content">The `content` part.</:part>
  <:part name="Arrow">The `arrow` part.</:part>
  <:part name="Close">The `close` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Popover} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.Popover} function={:trigger} />

### Anchor

<.props_table module={EssenceUI.Primitives.Popover} function={:anchor} />

### Portal

<.props_table module={EssenceUI.Primitives.Popover} function={:portal} />

### Content

<.props_table module={EssenceUI.Primitives.Popover} function={:content} />

### Arrow

<.props_table module={EssenceUI.Primitives.Popover} function={:arrow} />

### Close

<.props_table module={EssenceUI.Primitives.Popover} function={:close} />

## Examples

### Close from content

```heex
<Popover.close class="PopoverClose" aria-label="Close">×</Popover.close>
```

### With custom anchor

Prefer an explicit `Popover.anchor` when the trigger is not the positioning reference.

### Constrain size

```css
.PopoverContent {
  width: 260px;
  max-width: 100vw;
}
```

### Animations

Animate with CSS against `data-state` — see the [animation](/primitives/docs/guides/animation) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>

## Custom APIs

Wrap the primitive parts into a friendlier abstraction for your design system.

### Usage

```heex
<.my_popover … />
```

### Implementation

Compose `Popover` parts inside your own function component, encoding classes and defaults once.
