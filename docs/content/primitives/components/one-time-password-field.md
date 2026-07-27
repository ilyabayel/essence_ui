---
title: One-Time Password Field
description: A group of single-character text inputs to handle one-time password verification.
---

A group of single-character text inputs to handle one-time password verification.

<.demo theme="light" variant="primitive" component="one-time-password-field" css={primitive_css("one-time-password-field")}>
  <:heex>
    <OneTimePasswordField.root id="otp-primitive" class="DemoOTPRoot" length={6} name="otp">
      <OneTimePasswordField.input class="DemoOTPInput" index={0} />
      <OneTimePasswordField.input class="DemoOTPInput" index={1} />
      <OneTimePasswordField.input class="DemoOTPInput" index={2} />
      <OneTimePasswordField.input class="DemoOTPInput" index={3} />
      <OneTimePasswordField.input class="DemoOTPInput" index={4} />
      <OneTimePasswordField.input class="DemoOTPInput" index={5} />
    </OneTimePasswordField.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Keyboard navigation mimicking the behavior of a single input field.</:item>
  <:item>Overriding values on paste.</:item>
  <:item>Password manager autofill support.</:item>
  <:item>Input validation for numeric and alphanumeric values.</:item>
  <:item>Auto-submit on completion.</:item>
  <:item>Hidden input to provide a single value to form data.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<OneTimePasswordField.root id="…">
  <OneTimePasswordField.input index={0} />
  <OneTimePasswordField.input index={1} />
  …
</OneTimePasswordField.root>
```

The root always renders a hidden input for form submission. When no slot content is provided, the root auto-generates one input per character based on `length`.

<.anatomy>
  <:part name="Root">Contains all the parts of a one-time password field.</:part>
  <:part name="Input">Renders a text input representing a single character in the value.</:part>
  <:part name="Hidden Input">A visually hidden input that holds the combined value for form submission. Rendered automatically by `root`.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a one-time password field.

Use `value` with `on_value_change` for controlled state in LiveView:

```heex
<OneTimePasswordField.root
  id="otp"
  value={@otp}
  on_value_change="otp_change"
  length={6}
>
  …
</OneTimePasswordField.root>
```

```elixir
def handle_event("otp_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, otp: value)}
end
```

When all inputs are filled, the hook fires `on_complete` (if set) and optionally submits the associated form when `auto_submit` is true.

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:root} />

<.data_attributes_table>
  <:row name="[data-orientation]" values={"horizontal | vertical"}>The orientation of the input elements.</:row>
</.data_attributes_table>

### Input

Renders a text input representing a single character in the value. Each input must have a unique `index` (0-based).

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:input} />

<.data_attributes_table>
  <:row name="[data-index]" values="The index of this character in the combined value">Present on each input.</:row>
</.data_attributes_table>

### Hidden Input

A hidden input that stores the combined OTP value for form submission. The `root` part renders this automatically—you do not need to add it manually unless you are building a fully custom layout outside `root`.

<.props_table module={EssenceUI.Primitives.OneTimePasswordField} function={:hidden_input} />

## Examples

### Basic usage

Render one `input` per character, or omit slot content and let the root auto-generate inputs from `length`:

```heex
<OneTimePasswordField.root id="otp-basic" length={6} name="otp" />
```

For explicit control over each input:

```heex
<OneTimePasswordField.root id="otp-explicit" length={6} name="otp">
  <OneTimePasswordField.input index={0} />
  <OneTimePasswordField.input index={1} />
  <OneTimePasswordField.input index={2} />
  <OneTimePasswordField.input index={3} />
  <OneTimePasswordField.input index={4} />
  <OneTimePasswordField.input index={5} />
</OneTimePasswordField.root>
```

### Segmented controls

The `root` part accepts arbitrary children, so rendering a visually segmented list is as simple as placing separators between inputs. Hide decorative elements from assistive tech with `aria-hidden` and avoid rendering other meaningful content within `root` since each child element is expected to belong to the parent with the `group` role.

```heex
<OneTimePasswordField.root id="otp-segmented" length={4} name="otp" class="DemoOTPRoot">
  <OneTimePasswordField.input class="DemoOTPInput" index={0} />
  <Separator.separator class="DemoOTPSeparator" decorative aria-hidden="true" />
  <OneTimePasswordField.input class="DemoOTPInput" index={1} />
  <Separator.separator class="DemoOTPSeparator" decorative aria-hidden="true" />
  <OneTimePasswordField.input class="DemoOTPInput" index={2} />
  <Separator.separator class="DemoOTPSeparator" decorative aria-hidden="true" />
  <OneTimePasswordField.input class="DemoOTPInput" index={3} />
</OneTimePasswordField.root>
```

### Auto-submit form when password is entered

Use the `auto_submit` attribute to submit an associated form when all inputs are filled:

```heex
<form id="verify-form" phx-submit="verify">
  <OneTimePasswordField.root id="otp-auto" name="otp" length={6} auto_submit={true}>
    <OneTimePasswordField.input index={0} />
    <OneTimePasswordField.input index={1} />
    <OneTimePasswordField.input index={2} />
    <OneTimePasswordField.input index={3} />
    <OneTimePasswordField.input index={4} />
    <OneTimePasswordField.input index={5} />
  </OneTimePasswordField.root>
  <button type="submit">Submit</button>
</form>
```

```elixir
def handle_event("verify", %{"otp" => code}, socket) do
  if code == socket.assigns.valid_code do
    {:noreply, push_navigate(socket, to: "/authenticated")}
  else
    {:noreply, put_flash(socket, :error, "Invalid code")}
  end
end
```

### Controlled value

Use `value` and `on_complete` together for controlled verification:

```heex
<OneTimePasswordField.root
  id="otp-controlled"
  value={@otp}
  on_value_change="otp_change"
  on_complete="otp_complete"
  auto_submit={true}
  length={6}
>
  <OneTimePasswordField.input index={0} />
  <OneTimePasswordField.input index={1} />
  <OneTimePasswordField.input index={2} />
  <OneTimePasswordField.input index={3} />
  <OneTimePasswordField.input index={4} />
  <OneTimePasswordField.input index={5} />
</OneTimePasswordField.root>
```

```elixir
def handle_event("otp_change", %{"value" => value}, socket) do
  {:noreply, assign(socket, otp: value)}
end

def handle_event("otp_complete", %{"value" => value}, socket) do
  if value == socket.assigns.valid_code do
    {:noreply, push_navigate(socket, to: "/authenticated")}
  else
    {:noreply, put_flash(socket, :error, "Invalid code")}
  end
end
```

## Accessibility

At the time of writing, there is no singular established pattern in WCAG guidelines for implementing one-time password fields as separate inputs. The behavior aims to get as close as possible to having the field act as a single input, with a few exceptions to match user expectations based on initial research, testing, and feedback.

This component is implemented as `input` elements within a container with a role of `group` to indicate that child inputs are related. Inputs can be navigated and focused using direction keys, and typing input will move focus to the next input until the last input is reached.

Pasting a value into the field will replace the contents of all inputs, regardless of the currently focused input. Based on research this seems to align with most user expectations, where values are often pasted from password managers or an email.

### Keyboard Interactions

<.keyboard_table>
  <:row keys="Enter">Attempts to submit an associated form if one is found.</:row>
  <:row keys="Tab">Moves focus to the next focusable element outside of the root.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element outside of the root.</:row>
  <:row keys="ArrowDown">Moves focus to the next input when `orientation` is `vertical`.</:row>
  <:row keys="ArrowUp">Moves focus to the previous input when `orientation` is `vertical`.</:row>
  <:row keys="ArrowRight">Moves focus to the next input when `orientation` is `horizontal`.</:row>
  <:row keys="ArrowLeft">Moves focus to the previous input when `orientation` is `horizontal`.</:row>
  <:row keys="Home">Moves focus to the first input.</:row>
  <:row keys="End">Moves focus to the last input.</:row>
  <:row keys="Delete">Removes the character in the currently focused input and shifts later values back.</:row>
  <:row keys="Backspace">Removes the character in the currently focused input and moves focus to the previous input.</:row>
  <:row keys="Command + Backspace">Clears the value of all inputs.</:row>
</.keyboard_table>
