defmodule EssenceUI.MixProject do
  use Mix.Project

  @version "0.2.1"
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
      description: description(),
      package: package(),
      docs: docs(),
      name: "Essence UI",
      source_url: @source_url,
      homepage_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    # styler:sort
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.38", only: :dev, runtime: false},
      {:floki, ">= 0.38.0", only: :test},
      {:jason, "~> 1.4"},
      {:lazy_html, ">= 0.1.0", only: :test},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_view, ">= 1.1.8 and < 2.0.0"},
      {:styler, "~> 1.7", only: [:dev, :test], runtime: false}
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
        assets/js/lib
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
      groups_for_modules: [
        Components: ~r/^EssenceUI\.Components/,
        Primitives: ~r/^EssenceUI\.Primitives/,
        "Shared props": ~r/^EssenceUI\.SharedProps/,
        Utilities: ~r/^EssenceUI\.(Utilities|Helpers)/
      ]
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd --cd assets npm ci", "css.release"],
      "css.release": ["cmd node scripts/build-css-release.mjs"]
    ]
  end
end
