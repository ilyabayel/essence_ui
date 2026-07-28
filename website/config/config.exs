import Config

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  essence_ui_web: [
    args:
      ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures the endpoint
config :essence_ui_web, EssenceUIWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: EssenceUIWeb.ErrorHTML, json: EssenceUIWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: EssenceUIWeb.PubSub,
  live_view: [signing_salt: "q8KMa2B+"]

config :essence_ui_web,
  generators: [timestamp_type: :utc_datetime]

# Configures Elixir's Logger
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
