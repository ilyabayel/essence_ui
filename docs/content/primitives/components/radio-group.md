---
title: Radio Group
description: A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/radio
---

A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.

<.demo variant="primitive" component="radio-group" css={primitive_css("radio-group")}>

  <:heex>
    <form>
              <RadioGroup.root
                id="radio-group-primitive"
                class="RadioGroupRoot"
                default_value="default"
                aria-label="View density"
              >
                <div style="display: flex; align-items: center;">
                  <RadioGroup.item class="RadioGroupItem" value="default" id="r1">
                    <RadioGroup.indicator class="RadioGroupIndicator" />
                  </RadioGroup.item>
                  <label class="Label" for="r1">Default</label>
                </div>
                <div style="display: flex; align-items: center;">
                  <RadioGroup.item class="RadioGroupItem" value="comfortable" id="r2">
                    <RadioGroup.indicator class="RadioGroupIndicator" />
                  </RadioGroup.item>
                  <label class="Label" for="r2">Comfortable</label>
                </div>
                <div style="display: flex; align-items: center;">
                  <RadioGroup.item class="RadioGroupItem" value="compact" id="r3">
                    <RadioGroup.indicator class="RadioGroupIndicator" />
                  </RadioGroup.item>
                  <label class="Label" for="r3">Compact</label>
                </div>
              </RadioGroup.root>
            </form>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Supports horizontal/vertical orientation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

```heex
<RadioGroup.root>
  <RadioGroup.item />
  <RadioGroup.indicator />
  <RadioGroup.bubble_input />
</RadioGroup.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Item">The `item` part.</:part>
  <:part name="Indicator">The `indicator` part.</:part>
  <:part name="Bubble Input">The `bubble_input` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:root} />

### Item

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:item} />

### Indicator

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:indicator} />

### Bubble Input

<.props_table module={EssenceUI.Primitives.RadioGroup} function={:bubble_input} />

## Examples

See the live demo above and `storybook/primitives/radio_group.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/radio).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
