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
      {:ecto_sql, "~> 3.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.1"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_octicons, "~> 0.6.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_slime, "~> 0.13"},
      {:phoenix, "~> 1.4.13"},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},

      # Development dependencies
      {:credo, "~> 1.4.0", only: [:dev, :test]},
      {:dotenv, "~> 3.0.0", only: :dev},
      {:ex_doc, "~> 0.16", only: [:dev, :test], runtime: false},
      {:ex_machina, "~> 2.3", only: :test},
      {:excoveralls, "~> 0.6", only: :test},
      {:faker_elixir_octopus, "~> 1.0", only: :test},
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
