---
title: Slider
description: An input where the user selects a value from within a given range.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/slider-multithumb
---

An input where the user selects a value from within a given range.

<.demo variant="primitive" component="slider" css={primitive_css("slider")}>

  <:heex>
    <form>
              <Slider.root
                id="slider-primitive"
                class="SliderRoot"
                default_value={[50]}
                max={100}
                step={1}
              >
                <Slider.track class="SliderTrack">
                  <Slider.range class="SliderRange" />
                </Slider.track>
                <Slider.thumb
                  class="SliderThumb"
                  index={0}
                  aria-label="Volume"
                />
              </Slider.root>
            </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Supports multiple thumbs.</:item>
  <:item>Supports a minimum value between thumbs.</:item>
  <:item>Supports touch or click on track to update value.</:item>
  <:item>Supports Right to Left direction.</:item>
  <:item>Full keyboard navigation.</:item>
</.highlights>

## Anatomy

```heex
<Slider.root>
  <Slider.track />
  <Slider.range />
  <Slider.thumb />
</Slider.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Track">The `track` part.</:part>
  <:part name="Range">The `range` part.</:part>
  <:part name="Thumb">The `thumb` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Slider} function={:root} />

### Track

<.props_table module={EssenceUI.Primitives.Slider} function={:track} />

### Range

<.props_table module={EssenceUI.Primitives.Slider} function={:range} />

### Thumb

<.props_table module={EssenceUI.Primitives.Slider} function={:thumb} />

## Examples

See the live demo above and `storybook/primitives/slider.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/slider-multithumb).

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
<.my_slider … />
```

### Implementation

Compose `Slider` parts inside your own function component, encoding classes and defaults once.
