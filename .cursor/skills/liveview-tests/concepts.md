# LiveView concepts (from welcome guide)

Source: https://hexdocs.pm/phoenix_live_view/welcome.html

Use this when deciding *what* a test should cover. Keep API details in [reference.md](reference.md).

## Programming model

- LiveViews receive events, update state, render HTML diffs.
- Declarative: events are messages → may change assigns → LiveView re-renders relevant HEEx → browser applies the diff.
- State is immutable Elixir data on the socket (`assign` / `update`).
- Events come from the browser (`phx-*`) or the app (e.g. PubSub / `send/2`).

## Lifecycle (two mounts)

1. **Disconnected**: regular HTTP request; `mount/3` runs on a disconnected socket; full HTML for first paint / SEO.
2. **Connected**: JS `LiveSocket` connects over WebSockets; LiveView process starts; `mount/3` runs again on a connected socket.

Test mapping:

```elixir
# (1) HTTP only
conn = get(conn, "/thermostat")
assert html_response(conn, 200) =~ "Current temperature"

# (2) Connected process
{:ok, view, html} = live(conn)          # after get/2
# or
{:ok, view, html} = live(conn, "/thermostat")
```

## Core callbacks

Minimal LiveView (welcome thermostat example):

```elixir
def render(assigns) do
  ~H"""
  Current temperature: {@temperature}°F
  <button phx-click="inc_temperature">+</button>
  """
end

def mount(_params, _session, socket) do
  {:ok, assign(socket, :temperature, 70)}
end

def handle_event("inc_temperature", _params, socket) do
  {:noreply, update(socket, :temperature, &(&1 + 1))}
end
```

| Callback | Role | Typical assert |
|----------|------|----------------|
| `mount/3` | Params, session → initial assigns | HTML after `live/2`; redirect/error tuples |
| `render/1` | Assigns → HEEx | `render(view) =~ …` / `html =~ …` |
| `handle_event/3` | Binding event → new assigns | `element |> render_click()` then assert HTML |

`{:noreply, socket}` means no extra reply payload — only a re-render (diffs). Hook replies use `assert_reply/3`.

## Params and session

```elixir
def mount(%{"house" => house}, %{"current_user_id" => user_id}, socket) do
  …
end
```

- **Params**: from the URL / router (`live "/thermostat/:house", …`) → exercise via `live(conn, "/thermostat/oak")`.
- **Session**: signed/encrypted cookie (auth, etc.) → set on conn before `live`, or pass `session:` to `live_isolated/3`.

## Bindings vs JS commands

- **Bindings** (`phx-click`, `phx-submit`, …): browser → server → `handle_event/3`. Test with `render_*`.
- **JS commands** (`Phoenix.LiveView.JS`): run in the browser only (open/close UI without round-trip). LiveViewTest will **not** see a server event — assert markup that enables JS, or cover behavior in Playwright.

## Navigation

- **Patch**: same LiveView, update URL (`push_patch`) → `assert_patch` / `render_patch`.
- **Navigate**: another LiveView → `assert_redirect` / `follow_redirect`.

## Compartmentalize: pick the right abstraction

From welcome summary:

| Tool | Use for | Process | Test with |
|------|---------|---------|-----------|
| `Phoenix.Component` (function component) | Reuse markup (± `attach_hook` for shared events) | Parent LiveView | `render_component` / `rendered_to_string` |
| `Phoenix.LiveComponent` | Own state + events + markup | Same as parent | `live/2` + DOM/`phx-target`, or one-shot `render_component` |
| Nested `live_render/3` LiveView | Isolation; child crash ≠ parent | Separate | Parent `live/2` + `find_live_child` |

Default to function components. LiveComponents only when you need separate state. Nested LiveViews when you need error/process isolation (costlier).

## Essence UI note

Library primitives/components are HEEx function components (hooks, `data-*`, roles). Unit-test markup with `render_component`. Client hook behavior belongs in Playwright (`assets/test/`), not LiveViewTest.
