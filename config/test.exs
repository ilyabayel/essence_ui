import Config

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# In test we don't send emails
config :potion_ui, PotionUI.Mailer, adapter: Swoosh.Adapters.Test

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :potion_ui, PotionUIWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "t3Msr0KrCuZ70t5K0yOTL6GgveR3PBDqRfyy6kwnGtmBlsTG/jRxoQaX3Qja/K11",
  server: false

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false
