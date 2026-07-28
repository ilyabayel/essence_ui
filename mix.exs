defmodule EssenceUI.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/ilyabayel/essence_ui"

  def project do
    [
      app: :essence_ui,
      version: @version,
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      listeners: [Phoenix.CodeReloader],
      description: description(),
      package: package(),
      docs: docs(),
      name: "Essence UI",
      source_url: @source_url,
      homepage_url: @source_url
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
      # Docs / demo site — optional so Hex consumers do not pull them;
      # still fetched for this project (including MIX_ENV=prod releases).
      {:bandit, "~> 1.11", optional: true},

      # Dev / test tooling (not included in Hex package metadata)
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dns_cluster, "~> 0.2", optional: true},
      {:esbuild, "~> 0.10", optional: true, runtime: Mix.env() == :dev},
      {:ex_doc, "~> 0.38", only: :dev, runtime: false},
      {:floki, ">= 0.38.0", only: :test},
      {:gettext, "~> 0.26", optional: true},
      {:hackney, "~> 1.9", optional: true},
      {:igniter, "~> 0.6", only: [:dev, :test]},
      # Library (required for Hex consumers)
      {:jason, "~> 1.4"},
      {:lazy_html, ">= 0.1.0", only: :test},
      {:live_debugger, "~> 1.0.0", only: :dev},
      {:makeup_eex, "~> 2.0", optional: true},
      {:makeup_html, "~> 0.2", optional: true},
      {:makeup_syntect, "~> 0.1.4", optional: true},
      {:mdex, "~> 0.13", optional: true},
      {:mix_test_watch, "~> 1.3", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.8.1"},
      {:phoenix_html, "~> 4.2.1"},
      {:phoenix_live_dashboard, "~> 0.8.7", optional: true},
      {:phoenix_live_reload, "~> 1.6", only: :dev},
      {:phoenix_live_view, "~> 1.1.8"},
      # makeup_syntect 0.1.4 requires ~> 0.8.2; mdex_native allows ~> 0.8
      {:rustler_precompiled, "~> 0.8.2", optional: true},
      {:styler, "~> 1.7", only: [:dev, :test], runtime: false},
      {:swoosh, "~> 1.19", optional: true},
      {:telemetry_metrics, "~> 1.1", optional: true},
      {:telemetry_poller, "~> 1.3", optional: true},
      {:tidewave, "~> 0.5", only: [:dev]}
    ]
  end

  defp description do
    "Accessible, themeable Phoenix LiveView components inspired by Radix UI Themes."
  end

  defp package do
    [
      name: "essence_ui",
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"
      },
      files: ~w(
        lib/essence_ui
        lib/essence_ui.ex
        priv/static/essence-ui.css
        priv/static/essence-ui.css.gz
        assets/js/hooks
        assets/js/essence_ui.js
        mix.exs
        README.md
        LICENSE
        CHANGELOG.md
      )
    ]
  end

  defp docs do
    [
      main: "EssenceUI",
      extras: ["README.md", "CHANGELOG.md", "LICENSE"],
      source_ref: "v#{@version}",
      source_url: @source_url,
      filter_modules: fn module, _meta ->
        module_string = Atom.to_string(module)

        String.starts_with?(module_string, "Elixir.EssenceUI") and
          not String.starts_with?(module_string, "Elixir.EssenceUIWeb")
      end,
      groups_for_modules: [
        Components: ~r/^EssenceUI\.Components/,
        Primitives: ~r/^EssenceUI\.Primitives/,
        "Shared props": ~r/^EssenceUI\.SharedProps/,
        Utilities: ~r/^EssenceUI\.(Utilities|Helpers)/
      ]
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
        "cmd --cd assets npm run build:css",
        "phx.digest"
      ]
    ]
  end
end
