---
title: One-Time Password Field
description: A group of single-character text inputs to handle one-time password verification.
---

A group of single-character text inputs to handle one-time password verification.

<.demo variant="primitive" component="one-time-password-field" css={primitive_css("one-time-password-field")}>

  <:heex>
    <OneTimePasswordField.root
              id="otp-primitive"
              class="OTPRoot"
              length={6}
              name="otp"
            >
              <OneTimePasswordField.input
                class="OTPInput"
                index={0}
              />
              <OneTimePasswordField.input
                class="OTPInput"
                index={1}
              />
              <OneTimePasswordField.input
                class="OTPInput"
                index={2}
              />
              <OneTimePasswordField.input
                class="OTPInput"
                index={3}
              />
              <OneTimePasswordField.input
                class="OTPInput"
                index={4}
              />
              <OneTimePasswordField.input
                class="OTPInput"
                index={5}
              />
            </OneTimePasswordField.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Keyboard navigation mimicking the behavior of a single input field</:item>
  <:item>Overriding values on paste</:item>
  <:item>Password manager autofill support</:item>
  <:item>Input validation for numeric and alphanumeric values</:item>
  <:item>Auto-submit on completion</:item>
  <:item>Hidden input to provide a single value to form data</:item>
</.highlights>

## Anatomy

```heex
<OneTimePasswordField.root>
  <OneTimePasswordField.input />
  <OneTimePasswordField.hidden_input />
</OneTimePasswordField.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Input">The `input` part.</:part>
  <:part name="Hidden Input">The `hidden_input` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:root} />

### Input

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:input} />

### Hidden Input

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:hidden_input} />

## Examples

See the live demo above and `storybook/primitives/one_time_password_field.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
