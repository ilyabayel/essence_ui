---
title: Form
description: Collect information from your users using validation rules.
---

Collect information from your users using validation rules.

<.demo theme="light" variant="primitive" component="form" css={primitive_css("form")}>

  <:heex>
    <Form.root id="form-primitive" class="DemoFormRoot">
              <Form.field class="DemoFormField" name="email">
                <div style="display: flex; align-items: baseline; justify-content: space-between;">
                  <Form.label class="DemoFormLabel">Email</Form.label>
                  <Form.message class="DemoFormMessage" match="valueMissing">
                    Please enter your email
                  </Form.message>
                  <Form.message class="DemoFormMessage" match="typeMismatch">
                    Please provide a valid email
                  </Form.message>
                </div>
                <Form.control>
                  <input class="DemoInput" type="email" name="email" required />
                </Form.control>
              </Form.field>
              <Form.field class="DemoFormField" name="question">
                <div style="display: flex; align-items: baseline; justify-content: space-between;">
                  <Form.label class="DemoFormLabel">Question</Form.label>
                  <Form.message class="DemoFormMessage" match="valueMissing">
                    Please enter a question
                  </Form.message>
                </div>
                <Form.control>
                  <textarea class="DemoTextarea" name="question" required></textarea>
                </Form.control>
              </Form.field>
              <Form.submit class="DemoButton" style="margin-top: 10px;">
                Post question
              </Form.submit>
            </Form.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Built on top of the native browser [constraint validation API](https://developer.mozilla.org/en-US/docs/Web/HTML/Constraint_validation).</:item>
  <:item>Supports built-in validation.</:item>
  <:item>Supports custom validation.</:item>
  <:item>Full customization of validation messages.</:item>
  <:item>Accessible validation messages.</:item>
  <:item>Supports client-side and server-side scenarios.</:item>
  <:item>Focus is fully managed.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Form.root>
  <Form.field>
    <Form.label />
    <Form.control />
    <Form.message />
    <Form.validity_state />
  </Form.field>

  <Form.message />
  <Form.validity_state />

  <Form.submit />
</Form.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a form.</:part>
  <:part name="Field">The wrapper for a field. It handles id/name and label accessibility automatically.</:part>
  <:part name="Label">A label element which is automatically wired when nested inside a `field` part.</:part>
  <:part name="Control">A wrapper around the native control (`input`, `select`, or `textarea`) nested inside a `field` part.</:part>
  <:part name="Message">A validation message wired to a control when nested inside a `field`, or targeted by `name` when used outside.</:part>
  <:part name="Validity State">A slot wrapper that mirrors the field's validity state onto `data-*` attributes for styling or conditional markup.</:part>
  <:part name="Submit">The submit button.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a form. Renders a native `<form>` with `novalidate` and a `FormRoot` hook that manages validation, message visibility, and focus on submit.

<.props_table module={EssenceUI.Primitives.Form} function={:root} />

### Field

The wrapper for a field. It handles id/name and label accessibility automatically.

<.props_table module={EssenceUI.Primitives.Form} function={:field} />

<.data_attributes_table>
  <:row name="[data-invalid]" values="">Present when the field is invalid (client- or server-side).</:row>
  <:row name="[data-server-invalid]" values="">Present when `server_invalid` is true.</:row>
</.data_attributes_table>

### Label

A label element which is automatically wired when nested inside a `field` part. The `FormRoot` hook sets `for` to match the control's generated or explicit `id`.

<.props_table module={EssenceUI.Primitives.Form} function={:label} />

### Control

A wrapper around the native control element nested inside a `field` part. Place an `input`, `select`, or `textarea` with a `name` matching the field inside this part.

<.props_table module={EssenceUI.Primitives.Form} function={:control} />

<.data_attributes_table>
  <:row name="[data-invalid]" values="">Present on the native control when the field is invalid.</:row>
</.data_attributes_table>

### Message

A validation message which is automatically wired (functionality and accessibility) to a given control when nested inside a `field` part. It can be used for built-in and custom client-side validation, as well as server-side validation. When used outside a `field` you must pass a `name` matching a field.

`Form.message` accepts a `match` attribute which determines when the message should show. For built-in validation it matches the native HTML [ValidityState](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState) keys (`required`, `min`, `max`, and so on). Supported values:

`valueMissing`, `typeMismatch`, `patternMismatch`, `tooLong`, `tooShort`, `rangeUnderflow`, `rangeOverflow`, `stepMismatch`, `badInput`, `customError`, `valid`

When `match` is omitted, the message shows whenever the field is invalid. Use `force_match` to show a message regardless of client-side matching (useful for server-side errors).

<.props_table module={EssenceUI.Primitives.Form} function={:message} />

### Validity State

A slot wrapper—not a render prop—that mirrors a field's validity state onto `data-*` attributes on the wrapper element. When nested inside a `field`, the field is inferred automatically; otherwise pass `name` to target a field.

The `FormRoot` hook keeps these attributes in sync with the control's native `validity`:

- `data-valid` — `"true"` or `"false"`
- `data-valueMissing`, `data-typeMismatch`, and the other ValidityState keys — `"true"` or `"false"`
- `data-invalid` — present when the field is invalid

Style against the wrapper or use descendant selectors; children are ordinary HEEx markup.

<.props_table module={EssenceUI.Primitives.Form} function={:validity_state} />

<.data_attributes_table>
  <:row name="[data-valid]" values={"true | false"}>Whether the control's validity is valid.</:row>
  <:row name="[data-invalid]" values="">Present when the field is invalid.</:row>
  <:row name="[data-valueMissing]" values={"true | false"}>Mirrors ValidityState.valueMissing.</:row>
  <:row name="[data-typeMismatch]" values={"true | false"}>Mirrors ValidityState.typeMismatch.</:row>
  <:row name="[data-customError]" values={"true | false"}>Mirrors ValidityState.customError.</:row>
</.data_attributes_table>

### Submit

The submit button.

<.props_table module={EssenceUI.Primitives.Form} function={:submit} />

## Examples

### Providing your own validation messages

When no slot content is provided, `Form.message` has no default text—you should always supply a message. Pass slot content for clearer copy or internationalization:

```heex
<Form.message match="valueMissing">Please provide a name</Form.message>
```

### Custom validation

Built-in `match` values map to the platform's [constraint validation API](https://developer.mozilla.org/en-US/docs/Web/HTML/Constraint_validation). For custom client-side rules, use `match="customError"` and report the error on the native control with `setCustomValidity/1` (via a small `phx-hook` or other JS). The message shows when `validity.customError` is true:

```heex
<Form.field name="name">
  <Form.label>Full name</Form.label>
  <Form.control>
    <input type="text" name="name" phx-hook="NameValidator" />
  </Form.control>
  <Form.message match="customError">Only John is allowed.</Form.message>
</Form.field>
```

For server-returned errors, use a custom `match` string together with `server_invalid` on the field—the message shows while the field is marked server-invalid:

```heex
<Form.field name="name" server_invalid={@server_errors.name}>
  <Form.label>Full name</Form.label>
  <Form.control>
    <input type="text" name="name" />
  </Form.control>
  <Form.message match="name-rejected">Only John is allowed.</Form.message>
</Form.field>
```

### Styling based on validity

The hook sets `data-invalid` on the field and native control. Use it to style parts inside the field—for example, the label:

```heex
<Form.root id="styled-form">
  <Form.field name="email">
    <Form.label class="DemoFormLabel">Email</Form.label>
    <Form.control>
      <input class="DemoInput" type="email" name="email" />
    </Form.control>
  </Form.field>
</Form.root>
```

```css
.DemoFormLabel {
  color: white;
}
[data-radix-form-field][data-invalid] .DemoFormLabel {
  color: red;
}
[data-radix-form-field]:not([data-invalid]) .DemoFormLabel {
  color: green;
}
```

### Accessing the validity state for more control

Wrap markup in `Form.validity_state` and read mirrored `data-*` attributes on the wrapper—useful for icons or library-specific state classes:

```heex
<Form.field name="name">
  <Form.label>Full name</Form.label>
  <Form.validity_state>
    <Form.control>
      <input type="text" name="name" class="DemoInput" />
    </Form.control>
    <span class="DemoValidityIcon" aria-hidden="true"></span>
  </Form.validity_state>
</Form.field>
```

```css
[data-radix-form-validity-state][data-valid="false"] .DemoValidityIcon {
  color: red;
}
[data-radix-form-validity-state][data-valid="true"] .DemoValidityIcon {
  color: green;
}
```

### Server-side validation

Reuse the same `Form.message` parts for server errors. Pass `force_match` to show a client-side message when the server marks the field invalid, or omit `match` to show a server-only message.

Mark the field invalid with `server_invalid`. On submit, `phx-submit` runs only if client-side validation passes; map your server response into assigns and re-render.

```heex
<Form.root id="signup" phx-submit="submit">
  <Form.field name="email" server_invalid={@server_errors.email}>
    <Form.label>Email address</Form.label>
    <Form.control>
      <input type="email" name="email" required phx-change="clear_email_error" />
    </Form.control>
    <Form.message match="valueMissing">Please enter your email.</Form.message>
    <Form.message match="typeMismatch" force_match={@server_errors.email}>
      Please provide a valid email.
    </Form.message>
  </Form.field>

  <Form.field name="password" server_invalid={@server_errors.password}>
    <Form.label>Password</Form.label>
    <Form.control>
      <input type="password" name="password" required phx-change="clear_password_error" />
    </Form.control>
    <Form.message match="valueMissing">Please enter a password.</Form.message>
    <%= if @server_errors.password do %>
      <Form.message>
        Please provide a valid password. It should contain at least 1 number and 1 special character.
      </Form.message>
    <% end %>
  </Form.field>

  <Form.submit>Submit</Form.submit>
</Form.root>
```

```elixir
def handle_event("submit", params, socket) do
  case Accounts.register(params) do
    {:ok, _user} ->
      {:noreply, push_navigate(socket, to: ~p"/")}

    {:error, errors} ->
      {:noreply,
       assign(socket,
         server_errors: %{
           email: Map.has_key?(errors, :email),
           password: Map.has_key?(errors, :password)
         }
       )}
  end
end

def handle_event("clear_email_error", _params, socket) do
  {:noreply, update(socket, :server_errors, &Map.put(&1, :email, false))}
end

def handle_event("clear_password_error", _params, socket) do
  {:noreply, update(socket, :server_errors, &Map.put(&1, :password, false))}
end
```

The `FormRoot` hook also removes `data-server-invalid` from the DOM when the user edits a field. When `server_invalid` is driven by LiveView assigns, clear the assign in `phx-change` (as above) so server errors do not reappear on the next render.

## Accessibility

The component follows the "inline errors" pattern for validation:

- Label and control are associated using the `name` provided on `Form.field`
- When one or more client-side error messages display, they are automatically associated with their matching control and announced accordingly
- Focus is moved to the first invalid control on submit
