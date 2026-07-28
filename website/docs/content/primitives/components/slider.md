---
title: Slider
description: An input where the user selects a value from within a given range.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/slider-multithumb
---

An input where the user selects a value from within a given range.

<.demo theme="light" variant="primitive" component="slider" css={primitive_css("slider")}>
  <:heex>
    <form>
      <Slider.root
        id="slider-primitive"
        class="DemoSliderRoot"
        default_value={[50]}
        max={100}
        step={1}
      >
        <Slider.track class="DemoSliderTrack">
          <Slider.range class="DemoSliderRange" />
        </Slider.track>
        <Slider.thumb class="DemoSliderThumb" index={0} aria-label="Volume" />
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

Import all parts and piece them together.

```heex
<Slider.root id="…">
  <Slider.track>
    <Slider.range />
  </Slider.track>
  <Slider.thumb index={0} />
</Slider.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a slider.</:part>
  <:part name="Track">The track that contains the range.</:part>
  <:part name="Range">The filled portion of the track.</:part>
  <:part name="Thumb">A draggable thumb. Render one per value; set `index` for each.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a slider.

Use `value` with `on_value_change` for controlled state in LiveView:

```heex
<Slider.root id="volume" value={@volume} on_value_change="volume_change" min={0} max={100}>
  …
</Slider.root>
```

```elixir
def handle_event("volume_change", %{"value" => values}, socket) do
  {:noreply, assign(socket, volume: values)}
end
```

<.props_table module={EssenceUI.Primitives.Slider} function={:root} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="">Present when disabled.</:row>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the slider.</:row>
</.data_attributes_table>

### Track

The track that contains the `Slider.range`.

<.props_table module={EssenceUI.Primitives.Slider} function={:track} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="">Present when disabled.</:row>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the slider.</:row>
</.data_attributes_table>

### Range

The range part. Must live inside `Slider.track`.

<.props_table module={EssenceUI.Primitives.Slider} function={:range} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="">Present when disabled.</:row>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the slider.</:row>
</.data_attributes_table>

### Thumb

A draggable thumb. You can render multiple thumbs—pass a distinct `index` for each (0-based).

<.props_table module={EssenceUI.Primitives.Slider} function={:thumb} />

<.data_attributes_table>
  <:row name="[data-disabled]" values="">Present when disabled.</:row>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the slider.</:row>
</.data_attributes_table>

## Examples

### Vertical orientation

Use the `orientation` attribute to create a vertical slider.

```heex
<Slider.root id="slider-vertical" class="DemoSliderRoot" default_value={[50]} orientation="vertical">
  <Slider.track class="DemoSliderTrack">
    <Slider.range class="DemoSliderRange" />
  </Slider.track>
  <Slider.thumb class="DemoSliderThumb" index={0} aria-label="Volume" />
</Slider.root>
```

Style vertical layout with `[data-orientation="vertical"]` on the root, track, and range—see `assets/css/primitives/slider.css`.

### Create a range

Add multiple thumbs and values to create a range slider.

```heex
<Slider.root id="slider-range" default_value={[25, 75]}>
  <Slider.track>
    <Slider.range />
  </Slider.track>
  <Slider.thumb index={0} aria-label="Minimum" />
  <Slider.thumb index={1} aria-label="Maximum" />
</Slider.root>
```

### Define step size

Use the `step` attribute to increase the stepping interval.

```heex
<Slider.root id="slider-step" default_value={[50]} step={10}>
  <Slider.track>
    <Slider.range />
  </Slider.track>
  <Slider.thumb index={0} />
</Slider.root>
```

### Prevent thumb overlap

Use `min_steps_between_thumbs` to avoid thumbs with equal values.

```heex
<Slider.root id="slider-min-steps" default_value={[25, 75]} step={10} min_steps_between_thumbs={1}>
  <Slider.track>
    <Slider.range />
  </Slider.track>
  <Slider.thumb index={0} />
  <Slider.thumb index={1} />
</Slider.root>
```

## Accessibility

Adheres to the [Slider WAI-ARIA design pattern](https://www.w3.org/WAI/ARIA/apg/patterns/slider-multithumb).

### Keyboard Interactions

<.keyboard_table>
  <:row keys="ArrowRight">Increments/decrements by the `step` value depending on `orientation`.</:row>
  <:row keys="ArrowLeft">Increments/decrements by the `step` value depending on `orientation`.</:row>
  <:row keys="ArrowUp">Increases the value by the `step` amount.</:row>
  <:row keys="ArrowDown">Decreases the value by the `step` amount.</:row>
  <:row keys="PageUp">Increases the value by a larger `step`.</:row>
  <:row keys="PageDown">Decreases the value by a larger `step`.</:row>
  <:row keys="Shift + ArrowUp">Increases the value by a larger `step`.</:row>
  <:row keys="Shift + ArrowDown">Decreases the value by a larger `step`.</:row>
  <:row keys="Home">Sets the value to its minimum.</:row>
  <:row keys="End">Sets the value to its maximum.</:row>
</.keyboard_table>

## Custom APIs

Create your own API by abstracting the primitive parts into your own component.

### Abstract all parts

This example abstracts all of the `Slider` parts so it can be used as a self-closing element.

#### Usage

```heex
<.slider id="volume" default_value={[25]} />
```

#### Implementation

```elixir
def slider(assigns) do
  values = assigns[:value] || assigns[:default_value] || [0]
  assigns = assign(assigns, :values, List.wrap(values))

  ~H"""
  <Slider.root id={@id} value={@value} default_value={@default_value} {@rest}>
    <Slider.track>
      <Slider.range />
    </Slider.track>
    <%= for {_, index} <- Enum.with_index(@values) do %>
      <Slider.thumb index={index} />
    <% end %>
  </Slider.root>
  """
end
```

## Caveats

### Mouse events are not fired

Because of a known limitation in pointer event handling, `onMouseDown` and `onMouseUp` on the root may not fire as expected:

```heex
<Slider.root id="slider-mouse" phx-hook="MySliderHook">
  …
</Slider.root>
```

We recommend using pointer events instead (for example `phx-hook` handlers for `pointerdown` / `pointerup`). Regardless of the above limitation, pointer events are better suited for cross-platform handling because they cover mouse, touch, and pen input.
