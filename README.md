# EssenceUI

EssenceUI is a set of Phoenix components compatible with Radix UI Themes API.

## Usage

Add to your Phoenix templates or LiveView:

```elixir
import EssenceUI.Components
```

## Components

### Em

Emphasizes text, matching the Radix UI Themes Em API.

#### Example

```elixir
<.em>
  Emphasized text
</.em>

<.em truncate>
  This is a long emphasized text that will be truncated.
</.em>
```

#### Props

- `as_child` - If true, renders the component as its child element.
- `truncate` - If true, truncates text with ellipsis when it overflows.
- `wrap` - Controls text wrapping. One of: `"wrap"`, `"nowrap"`, `"pretty"`, `"balance"`. Responsive supported.
- `class` - Additional CSS classes.
- `style` - Additional inline styles.
- `rest` - Additional HTML attributes.

---

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
