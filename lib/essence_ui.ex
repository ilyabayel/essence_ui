defmodule EssenceUI do
  @moduledoc """
  Accessible, themeable Phoenix LiveView components inspired by Radix UI Themes.

  ## Installation

  Add to your `mix.exs` dependencies:

      {:essence_ui, "~> 0.2.0"}

  ## Themes (styled components)

      import EssenceUI.Components

  Import the prebuilt stylesheet from your app CSS:

      @import "../deps/essence_ui/priv/static/essence-ui.css";

  Wrap your layout with `<.theme>` and compose components such as `<.button>`,
  `<.flex>`, and `<.text>`.

  ## Primitives (headless)

      alias EssenceUI.Primitives.Dialog

  Register the JavaScript hooks from `deps/essence_ui/assets/js/essence_ui.js`
  with your LiveSocket (see the README).

  ## Documentation

  - HexDocs: generated API reference for this package
  - Guides and demos: see the project README and GitHub repository
  """
end
