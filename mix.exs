defmodule CaptchaEx.Mixfile do
  use Mix.Project

  @source_url "https://github.com/prertik/captcha_ex"
  @version "0.1.0"

  def project do
    [
      app: :captcha_ex,
      version: @version,
      elixir: "~> 1.6",
      description: description(),
      deps: deps(),
      package: package(),
      docs: docs(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,

      # Test coverage:
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Dialyzer:
      dialyzer: [
        plt_add_deps: :apps_direct,
        plt_add_apps: [:jason]
      ]
    ]
  end

  def application do
    [applications: [:logger, :httpoison, :eex]]
  end

  defp description do
    """
    A simple captcha package for Elixir applications, provides verification
    and templates for rendering forms with different captcha widgets.
    """
  end

  defp deps do
    [
      {:httpoison, ">= 0.12.0"},
      {:jason, "~> 1.4", optional: true},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.2", only: [:dev]},
      {:excoveralls, "~> 0.16", only: :test}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["Pratik Karki"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/prertik/captcha_ex"}
    ]
  end

  defp docs do
    [
      extras: [
        "CONTRIBUTING.md",
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: @version,
      formatters: ["html"]
    ]
  end
end
