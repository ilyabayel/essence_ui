---
title: Password Toggle Field
description: A password input field with an integrated button to toggle the value's visibility.
---

A password input field with an integrated button to toggle the value's visibility.

<.demo variant="primitive" component="password-toggle-field" css={primitive_css("password-toggle-field")}>

  <:heex>
    <PasswordToggleField.root id="password-toggle-primitive">
              <div class="Root">
                <PasswordToggleField.input
                  class="Input"
                  name="password"
                  aria-label="Password"
                />
                <PasswordToggleField.toggle class="Toggle">
                  <PasswordToggleField.icon visible><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M7.5 11C4.80285 11 2.52952 9.62184 1.09622 7.50001C2.52952 5.37816 4.80285 4 7.5 4C10.1971 4 12.4705 5.37816 13.9038 7.50001C12.4705 9.62185 10.1971 11 7.5 11ZM7.5 3C4.30786 3 1.65639 4.70638 0.0760002 7.23501C-0.0253338 7.39715 -0.0253334 7.60288 0.0760011 7.76501C1.65639 10.2936 4.30786 12 7.5 12C10.6921 12 13.3436 10.2936 14.924 7.76501C15.0253 7.60288 15.0253 7.39715 14.924 7.23501C13.3436 4.70638 10.6921 3 7.5 3ZM7.5 9.5C8.60457 9.5 9.5 8.60457 9.5 7.5C9.5 6.39543 8.60457 5.5 7.5 5.5C6.39543 5.5 5.5 6.39543 5.5 7.5C5.5 8.60457 6.39543 9.5 7.5 9.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></PasswordToggleField.icon>
                  <PasswordToggleField.icon hidden><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M13.3536 2.35355C13.5488 2.15829 13.5488 1.84171 13.3536 1.64645C13.1583 1.45118 12.8417 1.45118 12.6464 1.64645L10.6828 3.61012C9.70652 3.21671 8.63759 3 7.5 3C4.30786 3 1.65639 4.70638 0.0760002 7.23501C-0.0253338 7.39715 -0.0253334 7.60288 0.0760011 7.76501C0.902945 9.08812 2.08314 10.1861 3.47644 10.9184L1.64645 12.7484C1.45118 12.9437 1.45118 13.2603 1.64645 13.4555C1.84171 13.6508 2.15829 13.6508 2.35355 13.4555L13.3536 2.35355ZM5.00003 9.49479L5.91794 8.57688C5.66676 8.30155 5.5 7.92714 5.5 7.5C5.5 6.39543 6.39543 5.5 7.5 5.5C7.92714 5.5 8.30155 5.66676 8.57688 5.91794L9.49479 5.00003C9.05457 4.66453 8.49271 4.5 7.9 4.5C6.23858 4.5 4.9 5.83858 4.9 7.5C4.9 8.09271 5.06453 8.65457 5.40003 9.09479L5.00003 9.49479ZM11.2921 4.99999L10.3963 5.89581C10.9261 6.3165 11.3 6.9375 11.3 7.65C11.3 9.03587 10.1859 10.15 8.8 10.15C8.0875 10.15 7.4665 9.77612 7.04581 9.24625L6.15 10.1421C6.78571 10.7321 7.65238 11.1 8.6 11.1C10.7051 11.1 12.4 9.40508 12.4 7.3C12.4 6.35238 12.0321 5.48571 11.4421 4.85L11.2921 4.99999ZM13.9038 7.50001C13.4491 8.17501 12.8951 8.77751 12.2551 9.29251L13.0746 10.112C13.8311 9.47063 14.4751 8.67251 14.924 7.76501C15.0253 7.60288 15.0253 7.39715 14.924 7.23501C13.3436 4.70638 10.6921 3 7.5 3C7.11871 3 6.74371 3.02813 6.37646 3.08271L7.23271 3.93896C7.42021 3.91971 7.60971 3.91 7.8 3.91C10.1971 3.91 12.2705 5.10816 13.6038 6.91L13.9038 7.50001Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></PasswordToggleField.icon>
                </PasswordToggleField.toggle>
              </div>
            </PasswordToggleField.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Returns focus to the input when toggling with a pointer.</:item>
  <:item>Maintains button focus when toggling with keyboard or virtual navigation.</:item>
  <:item>Resets visibility to hidden after form submission to prevent accidental storage.</:item>
  <:item>Implicit accessible labeling for icon-based toggle buttons.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<PasswordToggleField.root>
  <PasswordToggleField.input />
  <PasswordToggleField.toggle>
    <PasswordToggleField.icon visible />
    <PasswordToggleField.icon hidden />
  </PasswordToggleField.toggle>
</PasswordToggleField.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a password toggle field.</:part>
  <:part name="Input">Renders the input containing the password value.</:part>
  <:part name="Toggle">The button that toggles password visibility.</:part>
  <:part name="Icon">Renders icon content for the visible or hidden state. Use one `icon` with the `visible` flag and one with the `hidden` flag inside `toggle`.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a password toggle field.

Use `visible` with `on_visibility_change` for controlled visibility in LiveView:

```heex
<PasswordToggleField.root
  id="password-field"
  visible={@visible}
  on_visibility_change="password_visibility_change"
>
  …
</PasswordToggleField.root>
```

```elixir
def handle_event("password_visibility_change", %{"visible" => visible}, socket) do
  {:noreply, assign(socket, :visible, visible)}
end
```

<.props_table module={EssenceUI.Primitives.PasswordToggleField} function={:root} />

<.data_attributes_table>
  <:row name="[data-visible]" values={"true | false"}>Reflects whether the password is visible.</:row>
</.data_attributes_table>

### Input

Renders the input containing the password value.

<.props_table module={EssenceUI.Primitives.PasswordToggleField} function={:input} />

### Toggle

The button that toggles password visibility.

<.props_table module={EssenceUI.Primitives.PasswordToggleField} function={:toggle} />

### Icon

Renders icon content for the visible or hidden state. Mark one icon with `visible` and one with `hidden`; the hook shows the matching icon based on visibility.

<.props_table module={EssenceUI.Primitives.PasswordToggleField} function={:icon} />

## Examples

### Basic usage

```heex
<PasswordToggleField.root id="password-field">
  <PasswordToggleField.input name="password" aria-label="Password" />
  <PasswordToggleField.toggle>
    <PasswordToggleField.icon visible>
      <svg aria-hidden="true" …>…</svg>
    </PasswordToggleField.icon>
    <PasswordToggleField.icon hidden>
      <svg aria-hidden="true" …>…</svg>
    </PasswordToggleField.icon>
  </PasswordToggleField.toggle>
</PasswordToggleField.root>
```
