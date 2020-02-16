defmodule Deckhub.Mixfile do
  use Mix.Project

  def project do
    [
      app: :deckhub,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls, test_task: "test"],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.travis": :test
      ]
    ]
  end

  def application do
    [
      mod: {Deckhub.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp aliases do
    [
      "ecto.ci": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Dependencies
      {:cmark, "~> 0.7"},
      {:cowboy, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix, "~> 1.3.4"},
      {:postgrex, ">= 0.0.0"},

      # Development dependencies
      {:credo, "~> 0.10.0", only: [:dev, :test]},
      {:dotenv, "~> 3.0.0", only: :dev},
      {:ex_doc, "~> 0.16", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.6", only: :test},
      {:httpoison, "~> 1.2", only: :dev},
      {:phoenix_live_reload, "~> 1.0", only: :dev}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "CODE_OF_CONDUCT.md",
        "CONTRIBUTING.md",
        "README.md": [
          filename: "readme",
          title: "README"
        ],
        "LICENSE.md": [
          filename: "license",
          title: "License"
        ]
      ],
      groups_for_modules: [
        Test: [
          ~r{^Support}
        ]
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
