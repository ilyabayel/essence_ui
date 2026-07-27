---
title: Toast
description: A succinct message that is displayed temporarily.
aria: https://www.w3.org/TR/wai-aria/#aria-live
---

A succinct message that is displayed temporarily.

<.demo theme="light" variant="primitive" component="toast" css={primitive_css("toast")}>
  <:heex>
    <Toast.provider duration={8000} swipe_direction="right" label="Notification">
      <button
        type="button"
        id="docs-toast-show-btn"
        class="DemoButton large violet"
        onclick="const toast = document.getElementById('docs-toast-primitive'); if (!toast) return; toast.hidden = false; toast.dataset.state = 'open'; toast.dispatchEvent(new CustomEvent('essence:toast:open', {bubbles: true}));"
      >
        Add to calendar
      </button>
      <Toast.viewport id="docs-toast-viewport" class="DemoToastViewport">
        <Toast.root
          id="docs-toast-primitive"
          duration={3000}
          type="foreground"
          default_open={false}
          class="DemoToastRoot"
        >
          <Toast.title class="DemoToastTitle">Scheduled: Catch up</Toast.title>
          <Toast.description class="DemoToastDescription">Friday at 5:30 PM</Toast.description>
          <Toast.action alt_text="Goto schedule to undo" class="DemoToastAction DemoButton small green">
            Undo
          </Toast.action>
          <Toast.close class="DemoToastClose" aria-label="Close">×</Toast.close>
        </Toast.root>
      </Toast.viewport>
    </Toast.provider>
  </:heex>
</.demo>

<.highlights>
  <:item>Automatically closes.</:item>
  <:item>Pauses closing on hover, focus and window blur.</:item>
  <:item>Supports hotkey to jump to toast viewport.</:item>
  <:item>Supports closing via swipe gesture.</:item>
  <:item>Exposes CSS variables for swipe gesture animations.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<Toast.provider>
  <Toast.root>
    <Toast.title />
    <Toast.description />
    <Toast.action />
    <Toast.close />
  </Toast.root>
  <Toast.viewport />
</Toast.provider>
```

<.anatomy>
  <:part name="Provider">Wraps toasts and the viewport. Supplies default duration, swipe direction, and label.</:part>
  <:part name="Viewport">The fixed area where toasts appear.</:part>
  <:part name="Root">An individual toast that auto-dismisses.</:part>
  <:part name="Title">An optional title for the toast.</:part>
  <:part name="Description">The toast message.</:part>
  <:part name="Action">An optional action button. Requires `alt_text` for screen readers.</:part>
  <:part name="Close">A button that dismisses the toast before its duration elapses.</:part>
</.anatomy>

## API Reference

### Provider

The provider that wraps your toasts and toast viewport. It usually wraps the application.

<.props_table module={EssenceUI.Primitives.Toast} function={:provider} />

### Viewport

The fixed area where toasts appear. Users can jump to the viewport by pressing the configured hotkey (F8 by default). It is up to you to ensure the discoverability of the hotkey for keyboard users.

<.props_table module={EssenceUI.Primitives.Toast} function={:viewport} />

### Root

The toast that automatically closes. It should not be held open to acquire a user response—use an `AlertDialog` styled as a toast when a response is required.

Use `open` with `on_open_change` for controlled state in LiveView:

```heex
<Toast.root id="saved-toast" open={@toast_open} on_open_change="toast_open_change">
  …
</Toast.root>
```

```elixir
def handle_event("toast_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, toast_open: open)}
end
```

The `ToastRoot` hook pauses the dismiss timer on pointer enter and focus, resumes on leave/blur, closes on Escape when focused, and dispatches `essence:toast:open` / `essence:toast:close` custom events for imperative control.

<.props_table module={EssenceUI.Primitives.Toast} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects the open state.</:row>
  <:row name="[data-swipe]" values={"start | move | cancel | end"}>Present during swipe interactions (CSS-ready; pointer swipe handling is not yet implemented in the hook).</:row>
  <:row name="[data-swipe-direction]" values={"up | down | left | right"}>Synced from the provider for styling swipe animations.</:row>
</.data_attributes_table>

CSS variables for swipe animations (set when swipe handling is active):

| CSS variable | Description |
| --- | --- |
| `--radix-toast-swipe-move-x` | Horizontal offset while swiping |
| `--radix-toast-swipe-move-y` | Vertical offset while swiping |
| `--radix-toast-swipe-end-x` | Final horizontal offset after swipe |
| `--radix-toast-swipe-end-y` | Final vertical offset after swipe |

### Title

An optional title for the toast.

<.props_table module={EssenceUI.Primitives.Toast} function={:title} />

### Description

The toast message.

<.props_table module={EssenceUI.Primitives.Toast} function={:description} />

### Action

An action that is safe to ignore so users are not expected to complete tasks with unexpected side effects as a result of a time limit.

When obtaining a user response is necessary, portal an `AlertDialog` styled as a toast into the viewport instead.

<.props_table module={EssenceUI.Primitives.Toast} function={:action} />

### Close

A button that allows users to dismiss the toast before its duration has elapsed.

<.props_table module={EssenceUI.Primitives.Toast} function={:close} />

## Examples

### Custom hotkey

Override the default hotkey on the viewport. Essence accepts a single key name (for example `"F8"` or `"T"`); modifier combinations are not yet supported.

```heex
<Toast.provider>
  …
  <Toast.viewport hotkey="T" label="Notifications (T)" />
</Toast.provider>
```

Press the configured key to focus the viewport region.

### Custom duration

Customise the duration of a toast to override the provider value.

```heex
<Toast.root id="saved" duration={3000}>
  <Toast.description>Saved!</Toast.description>
</Toast.root>
```

### Duplicate toasts

When a toast must appear every time a user clicks a button, use LiveView state to render multiple instances of the same toast:

```heex
<Toast.provider>
  <form phx-submit="save">
    <button type="submit">Save</button>
  </form>
  <Toast.viewport>
    <%= for id <- @toast_ids do %>
      <Toast.root id={id} default_open={true}>
        <Toast.description>Saved!</Toast.description>
      </Toast.root>
    <% end %>
  </Toast.viewport>
</Toast.provider>
```

```elixir
def handle_event("save", _params, socket) do
  id = "toast-#{System.unique_integer([:positive])}"
  {:noreply, update(socket, :toast_ids, &[id | &1])}
end
```

### Animating swipe gesture

Combine `--radix-toast-swipe-move-[x|y]` and `--radix-toast-swipe-end-[x|y]` CSS variables with `data-swipe="[start|move|cancel|end]"` attributes to animate a swipe-to-close gesture. The stylesheet below matches the demo CSS; the `ToastRoot` hook currently syncs `data-swipe-direction` from the provider—pointer swipe events that set `data-swipe` are not yet implemented.

```heex
<Toast.provider swipe_direction="right">
  <Toast.root id="swipe-toast" class="DemoToastRoot">…</Toast.root>
  <Toast.viewport />
</Toast.provider>
```

```css
.DemoToastRoot[data-swipe="move"] {
  transform: translateX(var(--radix-toast-swipe-move-x));
}
.DemoToastRoot[data-swipe="cancel"] {
  transform: translateX(0);
  transition: transform 200ms ease-out;
}
.DemoToastRoot[data-swipe="end"] {
  animation: slideRight 100ms ease-out;
}

@keyframes slideRight {
  from {
    transform: translateX(var(--radix-toast-swipe-end-x));
  }
  to {
    transform: translateX(100%);
  }
}
```

## Accessibility

Adheres to the [`aria-live` requirements](https://www.w3.org/TR/wai-aria/#aria-live).

### Sensitivity

Control the sensitivity of the toast for screen readers using the `type` attribute.

For toasts that are the result of a user action, choose `foreground`. Toasts generated from background tasks should use `background`.

#### Foreground

Foreground toasts are announced immediately. Assistive technologies may choose to clear previously queued messages when a foreground toast appears. Try to avoid stacking distinct foreground toasts at the same time.

#### Background

Background toasts are announced at the next graceful opportunity, for example when the screen reader has finished reading its current sentence. They do not clear queued messages so overusing them can be perceived as a laggy user experience for screen reader users when used in response to a user interaction.

```heex
<Toast.root id="foreground-toast" type="foreground">
  <Toast.description>File removed successfully.</Toast.description>
  <Toast.close aria-label="Close">Dismiss</Toast.close>
</Toast.root>

<Toast.root id="background-toast" type="background">
  <Toast.description>We've just released Essence UI 1.0.</Toast.description>
  <Toast.close aria-label="Close">Dismiss</Toast.close>
</Toast.root>
```

### Alternative action

Use the `alt_text` attribute on `Toast.action` to instruct an alternative way of actioning the toast to screen reader users.

```heex
<Toast.root id="upgrade-toast" type="background">
  <Toast.title>Upgrade Available!</Toast.title>
  <Toast.description>We've just released Essence UI 1.0.</Toast.description>
  <Toast.action alt_text="Goto account settings to upgrade">Upgrade</Toast.action>
  <Toast.close aria-label="Close">Dismiss</Toast.close>
</Toast.root>
```

### Close icon button

When providing an icon (or font icon), remember to label it correctly for screen reader users.

```heex
<Toast.root id="saved-icon-toast" type="foreground">
  <Toast.description>Saved!</Toast.description>
  <Toast.close aria-label="Close">
    <span aria-hidden="true">×</span>
  </Toast.close>
</Toast.root>
```

### Keyboard Interactions

<.keyboard_table>
  <:row keys="F8">Focuses the toast viewport (or the key configured via `hotkey`).</:row>
  <:row keys="Tab">Moves focus to the next focusable element.</:row>
  <:row keys="Shift + Tab">Moves focus to the previous focusable element.</:row>
  <:row keys="Space">When focus is on a `Toast.action` or `Toast.close`, activates the control.</:row>
  <:row keys="Enter">When focus is on a `Toast.action` or `Toast.close`, activates the control.</:row>
  <:row keys="Escape">When focus is on a toast, closes the toast.</:row>
</.keyboard_table>

## Custom APIs

### Abstract parts

Create your own API by abstracting the primitive parts into your own component.

#### Usage

```heex
<.toast id="upgrade" title="Upgrade available" content="We've just released Essence UI 1.0!">
  Upgrade
</.toast>
```

#### Implementation

```elixir
def toast(assigns) do
  ~H"""
  <Toast.root id={@id} {@rest}>
    <Toast.title :if={@title}>{@title}</Toast.title>
    <Toast.description>{@content}</Toast.description>
    <Toast.action :if={@inner_block != []} alt_text={@alt_text || "Perform action"}>
      {render_slot(@inner_block)}
    </Toast.action>
    <Toast.close aria-label="Close">
      <span aria-hidden="true">×</span>
    </Toast.close>
  </Toast.root>
  """
end
```

### Imperative API

Create your own imperative API to allow toast duplication if preferred.

#### Usage

Track toast count in LiveView and expose a `phx-click` that increments it:

```heex
<Toast.provider>
  <button type="button" phx-click="show_saved_toast">Save</button>
  <Toast.viewport>
    <%= for id <- @saved_toast_ids do %>
      <Toast.root id={id} default_open={true}>
        <Toast.description>Saved successfully!</Toast.description>
        <Toast.close aria-label="Close">Dismiss</Toast.close>
      </Toast.root>
    <% end %>
  </Toast.viewport>
</Toast.provider>
```

#### Implementation

```elixir
def handle_event("show_saved_toast", _params, socket) do
  id = "saved-#{System.unique_integer([:positive])}"
  {:noreply, assign(socket, saved_toast_ids: [id | socket.assigns.saved_toast_ids])}
end
```
