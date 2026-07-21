---
name: liveview-tests
description: >-
  Write Phoenix LiveView tests with Phoenix.LiveViewTest (render_component,
  live/2, element, render_click, forms, asserts). Use when adding or editing
  ExUnit tests for LiveViews, LiveComponents, or HEEx function components,
  or when the user mentions LiveViewTest, ConnCase, mix test for UI, mount,
  handle_event, phx-bindings, or LiveView lifecycle.
---

# LiveView Tests

Guide for writing tests with `Phoenix.LiveViewTest`.

- Welcome / model: https://hexdocs.pm/phoenix_live_view/welcome.html
- Test API: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html

## Mental model → what to test

LiveViews are **processes**: events update **immutable assigns**, then HEEx re-renders and diffs go to the browser. Tests talk to that process instead of a browser.

| LiveView concept | Test implication |
|------------------|------------------|
| Disconnected mount (HTTP) then connected mount (WS) | `get/2` + `html_response` for static HTML; `live/1` or `live/2` for connected process |
| `mount(params, session, socket)` | Pass path params via URL; session via `live_isolated(..., session: …)` or conn session |
| `handle_event/3` + `phx-*` bindings | Prefer `element/2` then `render_click` / `render_submit` / etc. |
| `Phoenix.LiveView.JS` (client-only) | No server event — do not assert via LiveViewTest; use Playwright if needed |
| Function components (`Phoenix.Component`) | Markup only → `render_component` / `rendered_to_string` |
| LiveComponents (own state, **same** process) | Events via DOM + `phx-target`; or one-shot `render_component` |
| Nested LiveView (`live_render/3`, separate process) | Parent `live/2` + `find_live_child/2` / `live_children/1` |
| `push_patch` / live navigate | `assert_patch`, `assert_redirect`, `follow_redirect` |

Default when unsure (from welcome): **function components** for markup; LiveComponents only when you need separate state; nested LiveViews for process isolation.

Essence UI primitives are function components → prefer **`render_component` + `~H`**. Use `live/2` only for real mount / `handle_event` / navigation.

Deeper lifecycle notes: [concepts.md](concepts.md).

## Dependencies

`Phoenix.LiveViewTest` ships with `phoenix_live_view` — not a separate Hex package.

Required for HTML parsing in tests:

```elixir
{:floki, ">= 0.30.0", only: :test}
```

This repo already has `phoenix_live_view` and `floki`. Run `mix deps.get` if missing.

## Setup

```elixir
use EssenceUIWeb.ConnCase, async: true

import Phoenix.Component
import Phoenix.LiveViewTest
```

`ConnCase` sets `@endpoint EssenceUIWeb.Endpoint` and provides `%{conn: conn}`.
Import `Phoenix.LiveViewTest` in each test module (not in ConnCase by default).

Prefer `async: true` unless the test needs shared global state.

## Choose the right style

| What you're testing | Use |
|---------------------|-----|
| Function component markup / attrs / a11y | `render_component/2` or `rendered_to_string/1` |
| LiveComponent once, no events | `render_component(MyLiveComponent, assigns)` |
| LiveView mount, events, navigation | `live/2` + `element/2` + `render_*` |
| LiveView without a route | `live_isolated/3` |
| Nested child LiveView | `find_live_child/2` after parent `live/2` |

## Function components (Essence UI default)

```elixir
test "renders radix-like dialog parts" do
  html =
    render_component(
      fn assigns ->
        ~H"""
        <Dialog.root id="dlg" default_open>
          <Dialog.trigger id="dlg-trigger">Open</Dialog.trigger>
        </Dialog.root>
        """
      end,
      %{}
    )

  assert html =~ ~s[phx-hook="DialogRoot"]
  assert html =~ ~s[data-state="open"]
end
```

Alternatives:

```elixir
# Direct function ref
assert render_component(&MyComponents.greet/1, name: "Mary") =~ "Hello, Mary!"

# ~H + rendered_to_string
assigns = %{}
assert rendered_to_string(~H"<MyComponents.greet name=\"Mary\" />") =~ "Hello"
```

Assert on stable contracts: `data-*`, `role`, `aria-*`, `phx-hook`, ids — not brittle full HTML equality unless the output is tiny.

## LiveViews

```elixir
# Connected mount (get + connect)
{:ok, view, html} = live(conn, "/my-path")
assert html =~ "Welcome"

# Disconnected then connected
conn = get(conn, "/my-path")
assert html_response(conn, 200) =~ "Welcome"
{:ok, view, _html} = live(conn)

# Redirect on mount
assert {:error, {:redirect, %{to: "/login"}}} = live(conn, "/secret")
```

### Events — prefer element scoping

```elixir
assert view
       |> element("button#inc")
       |> render_click() =~ "31℉"

# Bypass element (less validation) — avoid when possible
assert render_click(view, :inc, %{}) =~ "31℉"
```

| Binding | Helper |
|---------|--------|
| `phx-click` | `render_click/1` |
| `phx-submit` | `render_submit/1` |
| `phx-change` | `render_change/1` |
| `phx-blur` / `phx-focus` | `render_blur/1`, `render_focus/1` |
| `phx-keydown` / `phx-keyup` | `render_keydown/1`, `render_keyup/1` |
| JS hook | `render_hook/3` |

### Forms

```elixir
view
|> form("#user-form", user: %{name: "Ada"})
|> render_change()

view
|> form("#user-form", user: %{name: "Ada"})
|> render_submit()
```

### Messages, patches, redirects

```elixir
send(view.pid, {:set_temp, 50})
assert render(view) =~ "50℉"

assert_patch(view, "/thermo?tab=1")
assert_redirect(view, "/elsewhere")
{:ok, view, _html} = follow_redirect(render_click(...), conn)
```

### Presence / queries

```elixir
assert has_element?(view, "#user-13")
refute view |> element("#user-13") |> has_element?()
assert render(view) =~ "Ada"
```

### LiveComponents in a LiveView

Scope via DOM; LiveViewTest follows `phx-target`:

```elixir
html = view |> element("#user-13 a", "Delete") |> render_click()
refute has_element?(view, "#user-13")
```

### Isolated LiveView (no router)

```elixir
{:ok, view, _html} =
  live_isolated(conn, MyAppWeb.ThermoLive, session: %{"user_id" => 1})
```

## Test warnings

LiveViewTest raises by default on duplicate DOM IDs, duplicate LiveComponent IDs, missing form IDs.

```elixir
# Per call
live(conn, "/path", on_error: :warn)
live(conn, "/path", on_error: [duplicate_id: :ignore])

# App config
config :phoenix_live_view, :test_warnings,
  duplicate_id: :warn  # :raise | :warn | :ignore
```

## Workflow

1. Pick style from the table above.
2. Write the failing assertion first (`assert html =~ ...` or event outcome).
3. Implement / fix component.
4. Run: `mix test path/to/file_test.exs`
5. Keep assertions tied to public markup contracts (`data-*`, roles, hooks).

## Anti-patterns

- Full HTML string equality for large trees
- `render_click(view, :event)` when an element exists — skips HTML/event validation
- Asserting server events for `Phoenix.LiveView.JS` client-only commands
- Testing JS hook client behavior in LiveViewTest — use Playwright E2E (`assets/test/`) for that
- Forgetting `import Phoenix.Component` when using `~H` in tests
- Using LiveComponents / nested LiveViews in production code (or tests) when a function component would do

## More

- Concepts (welcome guide): [concepts.md](concepts.md)
- API cheat sheet: [reference.md](reference.md)
- https://hexdocs.pm/phoenix_live_view/welcome.html
- https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html
