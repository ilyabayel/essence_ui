# Phoenix.LiveViewTest API cheat sheet

Upstream: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html

## Mount / navigation

| Function | Purpose |
|----------|---------|
| `live(conn, path \\ nil, opts \\ [])` | Connected LiveView (GET + mount) |
| `live_isolated(conn, live_view, opts \\ [])` | Mount without router |
| `live_redirect(view, opts)` | Live redirect between LiveViews |
| `render_patch(view, path)` | Simulate `push_patch` |
| `follow_redirect(reason, conn, to \\ nil)` | Follow redirect from render/error |
| `follow_trigger_action(form, conn)` | Follow `phx-trigger-action` |
| `submit_form(form, conn)` | HTTP submit through Plug pipeline |
| `put_connect_params(conn, params)` | Connect params for next `live` |

## DOM / scope

| Function | Purpose |
|----------|---------|
| `element(view, selector, text_filter \\ nil)` | Scope to DOM element |
| `form(view, selector, form_data \\ %{})` | Scope to form + optional data |
| `has_element?(element)` / `has_element?(view, selector, text_filter \\ nil)` | Presence check |
| `with_target(view, target)` | Set event target |
| `find_live_child(parent, child_id)` | Nested LiveView by id |
| `live_children(parent)` | List child LiveViews |
| `page_title(view)` | Latest `page_title` assign |
| `open_browser(view_or_element)` | Dump HTML in system browser |

## Render / events

| Function | Purpose |
|----------|---------|
| `render(view_or_element)` | Current HTML |
| `render_async(view_or_element, timeout \\ …)` | Await assign/stream/start_async |
| `render_click/1,2,3` | `phx-click` |
| `render_submit/1,2,3` | `phx-submit` |
| `render_change/1,2,3` | `phx-change` |
| `render_blur/1,2,3` | `phx-blur` |
| `render_focus/1,2,3` | `phx-focus` |
| `render_keydown/1,2,3` | `phx-keydown` |
| `render_keyup/1,2,3` | `phx-keyup` |
| `render_hook(view_or_element, event, value \\ %{})` | Hook event |
| `put_submitter(form, element_or_selector)` | Set form submitter |

## Components

| Function | Purpose |
|----------|---------|
| `render_component(component, assigns \\ %{}, opts \\ [])` | Function or LiveComponent once |
| `rendered_to_string(rendered)` | `~H` template → string |

## Uploads

| Function | Purpose |
|----------|---------|
| `file_input(view, form_selector, name, entries)` | Build upload input |
| `preflight_upload(upload)` | Preflight request |
| `render_upload(upload, entry_name, percent \\ 100)` | Upload + render |

## Assertions

| Function | Purpose |
|----------|---------|
| `assert_patch/1,2,3` | Expect live patch |
| `assert_patched(view, to)` | Patch already happened |
| `refute_patched/1,2` | No patch |
| `assert_redirect/1,2,3` | Expect redirect |
| `assert_redirected(view, to)` | Redirect already happened |
| `refute_redirected/1,2` | No redirect |
| `assert_push_event(view, event, payload, timeout \\ …)` | Expect `push_event` |
| `refute_push_event/4` | No push event |
| `assert_reply(view, payload, timeout \\ …)` | Hook reply from handle_event |

Timeouts default to ExUnit `:assert_receive_timeout` / `:refute_receive_timeout`.

## `on_error` / test warnings

Keys: `:duplicate_id`, `:duplicate_live_component`, `:missing_form_id`  
Values: `:raise` (default), `:warn`, `:ignore`

```elixir
live(conn, "/path", on_error: :warn)
live(conn, "/path", on_error: [duplicate_id: :ignore])

config :phoenix_live_view, :test_warnings,
  duplicate_id: :warn
```
