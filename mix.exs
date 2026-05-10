defmodule EssenceUI.MixProject do
  use Mix.Project

  def project do
    [
      app: :essence_ui,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      listeners: [Phoenix.CodeReloader]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {EssenceUI.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    # styler:sort
    [
      {:bandit, "~> 1.11"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dns_cluster, "~> 0.2"},
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:floki, ">= 0.38.0", only: :test},
      {:gettext, "~> 0.26"},
      {:igniter, "~> 0.6", only: [:dev, :test]},
      {:jason, "~> 1.4"},
      {:mix_test_watch, "~> 1.3", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.8.1", override: true},
      {:phoenix_html, "~> 4.2.1"},
      {:phoenix_live_dashboard, "~> 0.8.7"},
      {:phoenix_live_reload, "~> 1.6", only: :dev},
      {:phoenix_live_view, "~> 1.1.8"},
      {:phoenix_storybook, "~> 1.0"},
      {:styler, "~> 1.7"},
      {:swoosh, "~> 1.19"},
      {:telemetry_metrics, "~> 1.1"},
      {:telemetry_poller, "~> 1.3"},
      {:tidewave, "~> 0.5", only: [:dev]}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build", "cmd --cd assets npm run build:css"],
      "assets.setup": ["esbuild.install --if-missing"],
      "assets.build": ["esbuild essence_ui"],
      "assets.deploy": [
        "esbuild essence_ui --minify",
        "phx.digest"
      ]
    ]
  end
end
