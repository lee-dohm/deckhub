# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :deckhub,
  ecto_repos: [Deckhub.Repo]

# Configures the endpoint
config :deckhub, DeckhubWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9im+Hfh6n9ilPM79rk9tQxQX4AEYrjRwqH3U5aLtLEUxZO1+6WHbX+LOjNDqsCiP",
  render_errors: [view: DeckhubWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Deckhub.PubSub, adapter: Phoenix.PubSub.PG2]

# Configure Phoenix
config :phoenix, :generators, binary_id: true
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  slimleex: PhoenixSlime.LiveViewEngine

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
