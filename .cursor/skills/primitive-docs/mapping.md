# Radix / React → Essence mapping

Use this when translating Radix MDX props and examples into HEEx. **Always verify**
against `lib/essence_ui/primitives/{snake}.ex` — this table is a guide, not a
guarantee every prop exists.

## Naming

| Radix / React | Essence HEEx |
|---------------|--------------|
| `className` | `class` |
| `htmlFor` | `for` (on labels) |
| camelCase props | `snake_case` attrs |
| `Accordion.Root` | `Accordion.root` (alias from `PageLive`) |
| JSX children | HEEx slots / nested tags inside the part |

## State & events

| Radix | Essence | Notes |
|-------|---------|-------|
| `defaultValue` | `default_value` | Uncontrolled initial value |
| `value` | `value` | Controlled; pair with change event + assigns |
| `defaultOpen` | `default_open` | Uncontrolled open |
| `open` | `open` | Controlled boolean |
| `onValueChange` | `on_value_change` | **String** LiveView event name, not a function |
| `onOpenChange` | `on_open_change` | Same — event name string |
| `onCheckedChange` | `on_checked_change` | Same pattern |
| `onEscapeKeyDown` etc. | Check module | Often absent or differently named |

Document controlled usage with LiveView assigns and `handle_event/3`, e.g.:

```heex
<Dialog.root id="edit" open={@open} on_open_change="dialog_open_change">
```

```elixir
def handle_event("dialog_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, open: open)}
end
```

Payload shape is component-specific — confirm in hooks / module docs, not from React types.

## Composition

| Radix | Essence |
|-------|---------|
| `asChild` | Often unsupported or via Slot / different API — check module; do not invent |
| Portal | `Dialog.portal` / `AlertDialog.portal` with optional `target` |
| `forceMount` | Only if attr exists on Essence part |

See `docs/API_FRICTION.md` for Themes vs Primitives dialog differences and other LV quirks.

## Styling docs language

Radix talks about `className` and `data-state`. In Essence docs:

- Say **`class`** (HEEx).
- Keep **`data-state`**, **`data-disabled`**, orientation/dir attrs when the hook sets them.
- CSS variables like `--essence-accordion-content-height`: document only if the Essence hook sets them (many do for animation parity).

## Examples translation checklist

1. Replace imports / JSX with HEEx module tags already aliased in docs.
2. Rename classes to `Demo*` to match `assets/css/primitives/{name}.css`.
3. Add required `id`s for hooks/portals (Essence often requires `id` on root/trigger/content).
4. Swap React state for `default_*` in hero demos; show controlled `open`/`value` in Examples when Radix does.
5. Drop TypeScript-only or `asChild`-only examples unless Essence supports them.
6. Inline small SVGs for icons (no Radix Icons package).

## Highlights

Port Radix feature bullets. Rewrite:

- “Works with React / SSR frameworks” → omit or point to Essence SSR guide if accurate
- Callback-centric wording → LiveView event / controlled assign wording
