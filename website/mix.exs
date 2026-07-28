defmodule EssenceUIWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :essence_ui_web,
      version: "0.2.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      listeners: [Phoenix.CodeReloader]
    ]
  end

  def application do
    [
      mod: {EssenceUIWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    # styler:sort
    [
      {:bandit, "~> 1.11"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dns_cluster, "~> 0.2"},
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:essence_ui, path: ".."},
      {:floki, ">= 0.38.0", only: :test},
      {:gettext, "~> 0.26"},
      {:hackney, "~> 1.9"},
      {:igniter, "~> 0.6", only: [:dev, :test]},
      {:jason, "~> 1.4"},
      {:lazy_html, ">= 0.1.0", only: :test},
      {:live_debugger, "~> 1.0.0", only: :dev},
      {:makeup_eex, "~> 2.0"},
      {:makeup_html, "~> 0.2"},
      {:makeup_syntect, "~> 0.1.4"},
      {:mdex, "~> 0.13"},
      {:mix_test_watch, "~> 1.3", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.8.1"},
      {:phoenix_html, "~> 4.2.1"},
      {:phoenix_live_dashboard, "~> 0.8.7"},
      {:phoenix_live_reload, "~> 1.6", only: :dev},
      {:phoenix_live_view, "~> 1.1.8"},
      # makeup_syntect 0.1.4 requires ~> 0.8.2; mdex_native allows ~> 0.8
      {:rustler_precompiled, "~> 0.8.2", override: true},
      {:styler, "~> 1.7", only: [:dev, :test], runtime: false},
      {:swoosh, "~> 1.19"},
      {:telemetry_metrics, "~> 1.1"},
      {:telemetry_poller, "~> 1.3"},
      {:tidewave, "~> 0.5", only: [:dev]}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build", "cmd --cd assets npm run build:css"],
      "assets.setup": ["esbuild.install --if-missing"],
      "assets.build": ["esbuild essence_ui_web"],
      "assets.deploy": [
        "esbuild essence_ui_web --minify",
        "cmd --cd assets npm run build:css",
        "phx.digest"
      ]
    ]
  end
end
