import Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we can use it
# to bundle .js and .css sources.
config :essence_ui_web, EssenceUIWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: String.to_integer(System.get_env("PORT") || "4000")],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "Q+Uio4LUvL1oF7eb2n1/hCCoLoy/xNIgQGX/JTPkW9TeErTT9ZWFWVfVSOMtmdQr",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:essence_ui_web, ~w(--sourcemap=inline --watch)]}
  ]

config :essence_ui_web, EssenceUIWeb.Endpoint,
  live_reload: [
    web_console_logger: true,
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/essence_ui_web/(?:controllers|live|components|docs|router)/?.*\.(ex|heex)$",
      ~r"../lib/essence_ui/(?:components|primitives)/?.*\.(ex|heex)$",
      ~r"docs/.*(md|exs)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :essence_ui_web, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :default_formatter, format: "[$level] $message\n"

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

config :phoenix_live_view,
  # Include HEEx debug annotations as HTML comments in rendered markup.
  # Changing this configuration will require mix clean and a full recompile.
  debug_heex_annotations: true,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
